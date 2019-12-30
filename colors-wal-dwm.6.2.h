static const char norm_fg[] = "#dedede";
static const char norm_bg[] = "#020202";
static const char norm_border[] = "#9b9b9b";

static const char sel_fg[] = "#dedede";
static const char sel_bg[] = "#70C052";
static const char sel_border[] = "#dedede";

static const char urg_fg[] = "#dedede";
static const char urg_bg[] = "#B16E3D";
static const char urg_border[] = "#B16E3D";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
