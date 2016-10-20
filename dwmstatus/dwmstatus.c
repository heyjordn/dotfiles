#define _BSD_SOURCE

#define BATT_NOW        "/sys/class/power_supply/BAT0/energy_now"
#define BATT_FULL       "/sys/class/power_supply/BAT0/energy_full"
#define BATT_STATUS       "/sys/class/power_supply/BAT0/status"

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <strings.h>
#include <sys/time.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <alsa/asoundlib.h>
#include <alsa/control.h>

#include <X11/Xlib.h>

char *tzjamaica = "America/Jamaica";
char *tzutc = "UTC";
char *tzberlin = "Europe/Berlin";

static Display *dpy;

char *
smprintf(char *fmt, ...)
{
	va_list fmtargs;
	char *ret;
	int len;

	va_start(fmtargs, fmt);
	len = vsnprintf(NULL, 0, fmt, fmtargs);
	va_end(fmtargs);

	ret = malloc(++len);
	if (ret == NULL) {
		perror("malloc");
		exit(1);
	}

	va_start(fmtargs, fmt);
	vsnprintf(ret, len, fmt, fmtargs);
	va_end(fmtargs);

	return ret;
}

char *
getbattery(){
    long lnum1, lnum2 = 0;
    char *status = malloc(sizeof(char)*12);
    char s = '?';
    char* batt_symbol;
    int batt_percent;

    FILE *fp = NULL;
    if ((fp = fopen(BATT_NOW, "r"))) {
        fscanf(fp, "%ld\n", &lnum1);
        fclose(fp);
        fp = fopen(BATT_FULL, "r");
        fscanf(fp, "%ld\n", &lnum2);
        fclose(fp);
        fp = fopen(BATT_STATUS, "r");
        fscanf(fp, "%s\n", status);
        fclose(fp);
        if (strcmp(status,"Charging") == 0)
            s = '+';
        if (strcmp(status,"Discharging") == 0)
            s = '-';
        if (strcmp(status,"Full") == 0)
            s = '=';
        
        batt_percent = lnum1/(lnum2/100);
        
        if(batt_percent <= 15)
          batt_symbol = "\uf244";
        if(batt_percent > 15 || batt_percent <= 50)
          batt_symbol = "\uf243";
        if(batt_percent > 50 || batt_percent <= 75)
          batt_symbol = "\uf242";
        if(batt_percent > 75 || batt_percent <= 99)
          batt_symbol = "\uf241";
        if(batt_percent == 100)
          batt_symbol = "\uf240";

        if(s == '+')
          batt_symbol = "\u26a1";

        return smprintf("%s %ld%%",batt_symbol,batt_percent);
    }
    else return smprintf("");
}

char *
getVolume()
{
  const char* MIXER = "Master";
  char* vol_symbol;
  /* OSS
  const char* OSSMIXCMD = "ossmix vmix0-outvol";
  const char* OSSMIXFORMAT = "Value of mixer control vmix0-outvol is currently set to %f (dB)";
  */

  float vol = 0;
  long pmin, pmax, pvol;

  /* Alsa {{{ */
  snd_mixer_t *handle;
  snd_mixer_selem_id_t *sid;
  snd_mixer_elem_t *elem;
  snd_mixer_selem_id_alloca(&sid);

  if(snd_mixer_open(&handle, 0) < 0)
    return 0;

  if(snd_mixer_attach(handle, "default") < 0
     || snd_mixer_selem_register(handle, NULL, NULL) < 0
     || snd_mixer_load(handle) > 0)
    {
      snd_mixer_close(handle);
      return 0;
    }

  for(elem = snd_mixer_first_elem(handle); elem; elem = snd_mixer_elem_next(elem))
    {
      snd_mixer_selem_get_id(elem, sid); 
      if(!strcmp(snd_mixer_selem_id_get_name(sid), MIXER))
        {
          snd_mixer_selem_get_playback_volume_range(elem, &pmin, &pmax);
          snd_mixer_selem_get_playback_volume(elem, SND_MIXER_SCHN_MONO, &pvol);
          vol = ((float)pvol / (float)(pmax - pmin)) * 100;
        }
    }

  snd_mixer_close(handle);
  /* }}} */
  /* Oss (soundcard.h not working) {{{ 
     if(!(f = popen(OSSMIXCMD, "r")))
       return;
     fscanf(f, OSSMIXFORMAT, &vol);
     pclose(f);
     }}} */

  if(vol <= 15)
    vol_symbol = "\uf026";
  if(vol > 15 || vol <= 50)
    vol_symbol = "\uf027";
  if(vol > 50 || vol <= 100)
    vol_symbol = "\uf028";
  
  return smprintf("%s %.0f",vol_symbol, vol);
}

void
settz(char *tzname)
{
	setenv("TZ", tzname, 1);
}

char *
mktimes(char *fmt, char *tzname)
{
	char buf[129];
	time_t tim;
	struct tm *timtm;

	memset(buf, 0, sizeof(buf));
	settz(tzname);
	tim = time(NULL);
	timtm = localtime(&tim);
	if (timtm == NULL) {
		perror("localtime");
		exit(1);
	}

	if (!strftime(buf, sizeof(buf)-1, fmt, timtm)) {
		fprintf(stderr, "strftime == 0\n");
		exit(1);
	}

	return smprintf("%s", buf);
}

void
setstatus(char *str)
{
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

char *
loadavg(void)
{
	double avgs[3];

	if (getloadavg(avgs, 3) < 0) {
		perror("getloadavg");
		exit(1);
	}

	return smprintf("%.2f %.2f %.2f", avgs[0], avgs[1], avgs[2]);
}

int
main(void)
{
	char *status;
	char *avgs;
	char *tmar;
	char *tmutc;
	char *tmbln;
  char *batt;
  char *vol;

	if (!(dpy = XOpenDisplay(NULL))) {
		fprintf(stderr, "dwmstatus: cannot open display.\n");
		return 1;
	}

	for (;;sleep(1)) {
		avgs = loadavg();
		tmar = mktimes("%H:%M", tzjamaica);
		tmutc = mktimes("%H:%M", tzutc);
		tmbln = mktimes("%a %d %b %H:%M %Y", tzjamaica);
    batt = getbattery();
    vol = getVolume();
    status = smprintf("%s \u258f %s \u258f %s \u258f  ",
				vol, batt, tmbln);
		setstatus(status);
		free(avgs);
		free(tmar);
		free(tmutc);
		free(tmbln);
		free(status);
		free(batt);
	}

	XCloseDisplay(dpy);

	return 0;
}

