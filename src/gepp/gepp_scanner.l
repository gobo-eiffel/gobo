%{
indexing

	description:

		"Scanners for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class GEPP_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	GEPP_TOKENS
		export
			{NONE} all
		end

%}

%x S_PREPROC

%option ecs meta-ecs case-insensitive nodefault outfile="gepp_scanner.e"

WS					[ \t\r]+
NAME				[a-z0-9_]+
ESC					\\(.|[0-7]{1,3}|x[0-9a-f]{1,2})

%%

<INITIAL>{
	^"#"				set_start_condition (S_PREPROC)
	^[^#\n].*\n		|
	^\n				{
						if not ignored then
							echo
						end
						line_nb := line_nb + 1
					}
	^[^#\n].*		{
						if not ignored then
							echo
						end
					}
}

<S_PREPROC>{
	{WS}				-- Separator.
	"#".*				-- Comment.
	"ifdef"				last_token := P_IFDEF
	"ifndef"			last_token := P_IFNDEF
	"else"				last_token := P_ELSE
	"endif"				last_token := P_ENDIF
	"include"			last_token := P_INCLUDE
	"define"			last_token := P_DEFINE
	"undef"				last_token := P_UNDEF
	[a-z0-9_.-]+	{
						last_token := P_NAME
						last_value := text
					}
	"&&"				last_token := P_AND
	"||"				last_token := P_OR
	\n				{
						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					}
	.					last_token := text_item (1).code
}

<*>.|\n					last_token := text_item (1).code

%%

feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			line_nb := 1
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			line_nb := 1
		end

feature -- Access

	line_nb: INTEGER
			-- Current line number

	last_value: ANY
			-- Semantic value to be passed to the parser

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		deferred
		end

end -- class GEPP_SCANNER
