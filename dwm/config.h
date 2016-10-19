/* See LICENSE file for copyright and license details. */
#include "X11/XF86keysym.h"
/* See LICENSE file for copyright and license details. */
/* appearance */
static const char *fonts[]          = { "hurmit nerd font-medium:size=12" };
static const char dmenufont[]       = "hurmit nerd font-medium:size=12";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#282828";
static const char normfgcolor[]     = "#577e59";
static const char selbordercolor[]  = "#458588";
static const char selbgcolor[]      = "#282828";
static const char selfgcolor[]      = "#458588";
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 3;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

static const char bar_bg_normal[] = "#222222";
static const char bar_border_normal[] = "#444444";
static const char bar_fg_normal[] = "#577e59";
static const char bar_fg_selected[] = "#eeeeee";
static const char col_cyan[] = "#222222";
static const char *colors[SchemeLast][3]      = {
	/*               fg         	bg	         border   */
	[SchemeNorm] = { bar_fg_normal, bar_bg_normal, bar_border_normal },
	[SchemeSel] =  { bar_fg_selected, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = {"","","",""};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 4,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define WINKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ WINKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ WINKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ WINKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ WINKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *file[] = {"st", "-e", "ranger", NULL};
static const char *browser[] = {"chromium", NULL};
static const char *vold[] = {"pamixer","--decrease","5"};
static const char *volu[] = {"pamixer","--increase","5"};
static const char *mute[] = {"pamixer","--toggle-mute"};
static const char *brightnup[] = {"xbacklight", "-inc", "5"};
static const char *brightndwn[] = {"xbacklight", "-dec", "5"};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,	                        XF86XK_AudioLowerVolume,      spawn,     {.v = vold} },
	{ 0,	                        XF86XK_AudioRaiseVolume,      spawn,     {.v = volu} },
	{ 0,	                        XF86XK_AudioMute,      spawn,     {.v = mute} },
	{ 0,	                        XF86XK_MonBrightnessUp,      spawn,     {.v = brightnup} },
	{ 0,	                        XF86XK_MonBrightnessDown,      spawn,     {.v = brightndwn} },
	{ WINKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ WINKEY,                       XK_w,      spawn,          {.v = browser } },
	{ WINKEY,                       XK_r,      spawn,          {.v = file } },
	{ WINKEY,             XK_Return, spawn,          {.v = termcmd } },
	{ WINKEY,                       XK_b,      togglebar,      {0} },
	{ WINKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ WINKEY,                       XK_k,      focusstack,     {.i = -1 } },
	//{ WINKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	//{ WINKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ WINKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ WINKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ WINKEY,                       XK_Return, zoom,           {0} },
	{ WINKEY,                       XK_Tab,    view,           {0} },
	{ WINKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ WINKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ WINKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ WINKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ WINKEY,                       XK_space,  setlayout,      {0} },
	{ WINKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ WINKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ WINKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ WINKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ WINKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ WINKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ WINKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	{ WINKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         WINKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         WINKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         WINKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            WINKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            WINKEY,         Button3,        toggletag,      {0} },
};

