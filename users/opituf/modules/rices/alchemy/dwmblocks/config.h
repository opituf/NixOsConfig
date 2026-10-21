//Modify this file to change what commands output to your statusbar 

static const Block blocks[] = {
	/* Icon  Command            Interval  Signal */
	{"  ", "sb-cpu",           2,  1},
	{"  ", "sb-disk",         30,  2},
	{"  ", "sb-wifi",          5,  3},
	{"󱄠  ", "sb-volume",        0, 10},
	{"  ", "sb-brightness",    0, 11},
	{""   , "sb-battery-rate",  5,  4},
	{"  ", "sb-battery",      30,  5},
	{""   , "sb-date",         60,  6},
	{""   , "sb-clock",         1,  7},
};

static char delim[] = " | ";
static unsigned int delimLen = 4;
