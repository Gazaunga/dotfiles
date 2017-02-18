
/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-artwiz-cure-medium-r-normal--11-110-75-75-p-90-iso8859-1";
static const char colors[MAXCOLORS][ColLast][8] = {
	/* border     fg         bg       */
	{ "#212121", "#696969", "#121212" }, /* 0 = normal */
	{ "#212121", "#E0E0E0", "#121212" }, /* 1 = selected */
	{ "#212121", "#4586de", "#121212" }, /* 2 = urgent */
	{ "#212121", "#7bde45", "#121212" }, /* 3 = green */
	{ "#212121", "#fedd26", "#121212" }, /* 4 = yellow */
	{ "#212121", "#e55555", "#121212" }, /* 5 = cyan */
	{ "#212121", "#006699", "#121212" }, /* 6 = magenta */
	{ "#212121", "#C0C0C0", "#121212" }, /* 7 = grey */
};
static const unsigned int borderpx  = 1;        /* border pixel of windows     */
static const unsigned int snap      = 8;        /* snap pixel                  */
static const Bool showbar           = True;     /* False means no bar          */
static const Bool topbar            = True;     /* False means bottom bar      */
static const Bool focusonclick      = True;     /* Change focus only on click  */
static const Bool viewontag         = True;     /* Switch view on tag switch   */
static const unsigned int gappx     = 7;        /* gap pixel between windows       */

static const Rule rules[] = {
	/* class          instance     title       tags mask     isfloating   monitor */
	{ "Gimp",         NULL,        NULL,       0,            True,        -1 },
	{ "Firefox",      NULL,        NULL,       1 << 8,       False,       -1 },
	{  NULL,          NULL,      "scratchpad", 0,            True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.5;   /* factor of master area size [0.05..0.95] */
static const int nmaster      = 2;     /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */
static const Layout layouts[] = {
	{ " |",      pidgin },
  { " |",      NULL },    
  { " |",      gaplessgrid},
  { " |",      monocle },
 	{ " |",      tile },    
  { " |",      bstack },
};


/* tagging */
static const Tag tags[] = {
	/* name       layout           mfact    nmaster */
	{ " Term  |",     &layouts[2],     -1,      -1 },
	{ " Vim  |",      &layouts[0],     -1,      -1 },
	{ " Chat  |",     &layouts[2],     -1,      -1 },
	{ " Net  |",      &layouts[3],     0.83,    -1 },
	{ " Music  |",    &layouts[1],     -1,      -1 },
};

/* key definitions */
#define ALTKEY Mod2Mask
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* commands */
static const char scratchpadname[]   = { "scratchpad" };
static const char *dmenucmd[]      = { "dmenu_run", "-i", "-p", "Run command:", "-fn", font, "-nb", colors[0][ColBG], "-nf", colors[0][ColFG],"-sb", colors[1][ColBG], "-sf", colors[1][ColFG], NULL };
static const char *termcmd[]       = { "urxvt", NULL };
static const char *ncmpcppcmd[]      = { "urxvt", "-e", "ncmpcpp", NULL };
static const char *scratchpadcmd[] = { "urxvt", "-title", "scratchpad", "-geometry", "70x20+400+220", "-bg", "0", "-fg", "white",  NULL };
static const char *filemancmd[]    = { "thunar", NULL };
static const char *firefoxcmd[]    = { "firefox", NULL };
static const char *volmcmd[]       = { "amixer", "-q", "sset", "Master", "mute", NULL };
static const char *voldcmd[]       = { "amixer", "-q", "sset", "Master", "1-", "unmute", NULL };
static const char *volucmd[]       = { "amixer", "-q", "sset", "Master", "1+", "unmute", NULL };
static const char *mpdstopcmd[]    = { "ncmpcpp", "toggle", NULL };
static const char *mpdprevcmd[]    = { "ncmpcpp", "prev", NULL };
static const char *mpdnextcmd[]    = { "ncmpcpp", "next", NULL };
static const char *irccmd[]    = { "urxvt", "-e", "weechat",  NULL };
static const char *scrotcmd[]    = { "scrot", "&&", "mv", "*.png", "~/pictures/",  NULL };
//static const char *charcmd[]    = { "echo |", NULL };

//static const char *hibernatecmd[]  = { "dbus-send", "--system", "--print-reply", "--dest=org.freedesktop.UPower", "/org/freedesktop/UPower", "org.freedesktop.UPower.Hibernate", NULL };
//static const char *rebootcmd[]     = { "dbus-send", "--system", "--print-reply", "--dest=org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager", "org.freedesktop.ConsoleKit.Manager.Restart", NULL };
//static const char *shutdowncmd[]   = { "dbus-send", "--system", "--print-reply", "--dest=org.freedesktop.ConsoleKit", "/org/freedesktop/ConsoleKit/Manager", "org.freedesktop.ConsoleKit.Manager.Stop", NULL }
static Key keys[] = {
	/* modifier                     key         function        argument */
	{ ALTKEY,                       XK_F2,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return,  spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_n,       spawn,          {.v = ncmpcppcmd } },
	{ MODKEY,                       XK_w,       spawn,          {.v = irccmd } },
	{ MODKEY|ControlMask,           XK_s,       spawn,          {.v = scrotcmd } },
	{ MODKEY|ShiftMask,             XK_s,       togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,             XK_t,       spawn,          {.v = filemancmd } },
	{ MODKEY|ShiftMask,             XK_x,       spawn,          {.v = firefoxcmd } },
	{ 0,                            0x1008ff12, spawn,          {.v = volmcmd } },
	{ 0,                            0x1008ff11, spawn,          {.v = voldcmd } },
	{ 0,                            0x1008ff13, spawn,          {.v = volucmd } },
	{ MODKEY,                       XK_egrave,  spawn,          {.v = mpdstopcmd } },
	{ MODKEY|ShiftMask,             XK_p,       spawn,          {.v = mpdprevcmd } },
	{ MODKEY,                       XK_ccedilla,     spawn,          {.v = mpdnextcmd } },
//	{ MODKEY|ControlMask,           XK_p,       spawn,          {.v = pipecmd } },
	{ MODKEY|ShiftMask,             XK_m,       togglemax,      {0} },
	{ MODKEY|ShiftMask,             XK_b,       togglebar,      {0} },
	{ MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_a,       incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_z,       incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,       setmfact,       {.f = -0.01} },
	{ MODKEY,                       XK_l,       setmfact,       {.f = +0.01} },
	{ MODKEY|ShiftMask,             XK_j,       pushdown,       {0} },
	{ MODKEY|ShiftMask,             XK_k,       pushup,         {0} },
	{ ShiftMask, 			XK_Return,  zoom,           {0} },
	{ MODKEY,                       XK_Tab,     view,           {0} },
	{ MODKEY|ShiftMask,             XK_Tab,     focusurgent,    {0} },
	{ MODKEY|ShiftMask,             XK_c,       killclient,     {0} },
	{ MODKEY,                       XK_g,       setlayout,      {.v = &layouts[5]} },
	{ MODKEY,                       XK_p,       setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_m,       setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_f,       setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_b,       setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,   setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
	{ MODKEY,                       XK_0,       view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_Left,    cycle,          {.i = -1 } },
	{ MODKEY,                       XK_Right,   cycle,          {.i = +1 } },
	{ MODKEY|ControlMask,           XK_Left,    tagcycle,       {.i = -1 } },
	{ MODKEY|ControlMask,           XK_Right,   tagcycle,       {.i = +1 } },
	TAGKEYS(                        0x26,                       0)
	TAGKEYS(                        0xe9,                       1)
	TAGKEYS(                        0x22,                       2)
	TAGKEYS(                        0x27,                       3)
	TAGKEYS(                        0x28,                       4)
//	{ ControlMask|ALTKEY,           XK_h,       spawn,          {.v = hibernatecmd } },
//	{ ControlMask|ALTKEY,           XK_r,       spawn,          {.v = rebootcmd } },
//	{ MODKEY|ControlMask,           XK_q,       spawn,          {.v = shutdowncmd } },
	{ MODKEY|ShiftMask,             XK_q,  quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkWinTitle,          0,              Button4,        focusstack,     {.i = +1} },
	{ ClkWinTitle,          0,              Button5,        focusstack,     {.i = -1} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkTagBar,            0,              Button4,        cycle,          {.i = -1} },
	{ ClkTagBar,            0,              Button5,        cycle,          {.i = +1} },
};
