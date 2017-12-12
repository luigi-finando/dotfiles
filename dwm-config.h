/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
	"Ubuntu Mono:size=8"
};
static const char dmenufont[]       = "Ubuntu Mono:size=8";
static const char normbordercolor[] = "#d7af5f";
static const char normbgcolor[]     = "#d7af5f";
static const char normfgcolor[]     = "#000000";
static const char selbordercolor[]  = "#d7af5f";
static const char selbgcolor[]      = "#000000";
static const char selfgcolor[]      = "#d7af5f";
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* tagging */
static const char *tags[] = { "web", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1,       	    0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.75; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[tiling]",      tile },    /* first entry is default */
	{ "[floating]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", "-lr", "2", "-d", "0.3", "-l", "3", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "rxvt-unicode", NULL };
static const char *killxorgcmd[]  = { "killall", "xinit", NULL };

static const char *firefoxcmd[]  = { "firefox", NULL };
static const char *calcursecmd[]  = { "rxvt-unicode", "-e", "calcurse", NULL };
static const char *htopcmd[]  = { "rxvt-unicode", "-e", "htop", NULL };
static const char *rangercmd[]  = { "rxvt-unicode", "-e", "ranger", NULL };

static const char *ncmpcppcmd[]  = { "rxvt-unicode", "-e", "ncmpcpp", NULL };
static const char *mpcplay[]  = { "mpc", "toggle", NULL };
static const char *mpcnext[]  = { "mpc", "next", NULL };
static const char *mpcprev[]  = { "mpc", "prev", NULL };

static const char *mutecmd[]  = { "amixer", "-D", "pulse", "sset", "Master", "toggle", NULL };
static const char *volumeupcmd[]  = { "amixer", "-D", "pulse", "sset", "Master", "5%+", NULL };
static const char *volumedowncmd[]  = { "amixer", "-D", "pulse", "sset", "Master", "5%-", NULL };

static const char *brightupcmd[]  = { "xbacklight", "-inc", "10", NULL };
static const char *brightfullcmd[]  = { "xbacklight", "-set", "100", NULL };
static const char *brightdowncmd[]  = { "xbacklight", "-dec", "10", NULL };
static const char *brightoffcmd[]  = { "xbacklight", "-set", "0", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = htopcmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = rangercmd } },
	{ MODKEY,                       XK_w,      spawn,          {.v = firefoxcmd } },
	{ MODKEY,                       XK_q,      spawn,          {.v = calcursecmd } },
	{ MODKEY,             		XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = dmenucmd } },
	{ 0,             	   0x1008ff02, 	   spawn,          {.v = brightupcmd } },
	{ MODKEY,             	   0x1008ff02, 	   spawn,          {.v = brightfullcmd } },
	{ 0,             	   0x1008ff03, 	   spawn,          {.v = brightdowncmd } },
	{ MODKEY,             	   0x1008ff03, 	   spawn,          {.v = brightoffcmd } },
	{ 0,             	   0x1008ff13, 	   spawn,          {.v = volumeupcmd } },
	{ 0,             	   0x1008ff11, 	   spawn,          {.v = volumedowncmd } },
	{ 0,             	   0x1008ff12, 	   spawn,          {.v = mutecmd } },
	{ MODKEY,             	   0x1008ff14, 	   spawn,          {.v = ncmpcppcmd } },
	{ 0,                       0x1008ff14,	   spawn,	   {.v = mpcplay } },
	{ 0,                       0x1008ff16,	   spawn,	   {.v = mpcprev } },
	{ 0,                       0x1008ff17,	   spawn,	   {.v = mpcnext } },
	//window management
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_z,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_z,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,	                XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_c,	   zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	//layouts
	{ MODKEY|ShiftMask,             XK_x,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_u,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_i,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_o,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_c,      quit,           {0} },
	{ MODKEY|ShiftMask,              XK_x,      spawn,          {.v = killxorgcmd } },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

