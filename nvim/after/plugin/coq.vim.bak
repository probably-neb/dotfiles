let g:coq_settings = { 'auto_start': 'shut-up'}

lua << EOF
require ("coq") {}
require("coq_3p") {
	{ src = "bc", short_name = "MATH", precision = 6 },
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
	{ src = "figlet", short_name = "BIG" },
	--{src = "vimtex", short_name = "vTEX"}
}
EOF
