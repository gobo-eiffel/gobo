indexing

	description:

		"Pretty printer using PostScript facilities"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class ASCII2PS

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton
		redefine
			output
		end

	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_ARGUMENTS
	KL_SHARED_EXCEPTIONS

creation

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 37
output ("%Tnewline%N")
else
--|#line 38
output ("%T( ) show%N")
end
else
if yy_act = 3 then
--|#line 39
output ("%Tprinttab%N")
else
--|#line 40
output ("%Tnewpage%N")
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 41

					output ("%T(")
					output (text)
					output (") printword%N")
				
else
--|#line 46

					output ("%T(\")
					output (text_item (1).out)
					output (") printword%N")
				
end
else
--|#line 0
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    6,    7,    8,    9,    9,    9,   10,
			   10,   11,    3,   11,   11,   11,   11,   11,   11,   11,
			   11>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,   10,
			    4,    3,   11,   11,   11,   11,   11,   11,   11,   11,
			   11>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   11,    9,   12,   12,   12,   12,   12,
			    8,   12>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   11,    1,   11,   11,   11,   11,   11,   11,   11,
			   11,    0>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    4,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    1,    1,    1,    1,    1,    1,    1,
			    6,    7,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    8,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    8,    5,    3,    1,    4,    2,    6,
			    5,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 12
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 11
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 12
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 7
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 8
			-- End of buffer rule code

	INITIAL: INTEGER is 0
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make is
			-- Run 'ascii2ps' pretty-printer.
		local
			i, nb: INTEGER
			no_more_option: BOOLEAN
			arg: STRING
			in_filename, out_filename: STRING
			in_file: like INPUT_STREAM_TYPE
			out_file: like OUTPUT_STREAM_TYPE
		do
			output_file := std.output
			make_compressed_scanner_skeleton
			tab_length := 4
			user_font := "Courier"
			has_header := true
			date := "00/00/00"
			time := "00:00:00"
				-- Read options.
			from
				i := 1
				nb := Arguments.argument_count
			until
				i > nb or no_more_option
			loop
				arg := Arguments.argument (i)
				if arg.is_equal ("-h") then
					std.output.put_string (usage_message)
					Exceptions.die (0)
				elseif arg.is_equal ("-n") then
					flag_n := True
					i := i + 1
				elseif arg.is_equal ("-l") then
					us_letter := True
					i := i + 1
				elseif arg.is_equal ("-d") and i < nb then
					i := i + 1
					date := Arguments.argument (i)
					i := i + 1
				elseif arg.is_equal ("-t") and i < nb then
					i := i + 1
					time := Arguments.argument (i)
					i := i + 1
				elseif arg.is_equal ("-2") then
					double_sided := True
					i := i + 1
				elseif arg.is_equal ("--") then
					i := i + 1
					no_more_option := True
				else
					no_more_option := True
				end
			end
				-- Read filenames.
			inspect nb - i + 1
			when 0 then
				in_filename := "-"
				out_filename := "-"
				filename := "standard input"
			when 1 then
				in_filename := Arguments.argument (i)
				out_filename := "-"
				filename := basename (in_filename)
			when 2 then
				in_filename := Arguments.argument (i)
				out_filename := Arguments.argument (i + 1)
				filename := basename (in_filename)
			else
				std.error.put_string (usage_message)
				Exceptions.die (1)
			end

			if not out_filename.is_equal ("-") then
				out_file := OUTPUT_STREAM_.make_file_open_write (out_filename)
				if OUTPUT_STREAM_.is_open_write (out_file) then
					set_output_file (out_file)
				else
					std.error.put_string ("ascii2ps: cannot open %'")
					std.error.put_string (out_filename)
					std.error.put_string ("%'%N")
					Exceptions.die (1)
				end
			else
				set_output_file (std.output)
			end
			if in_filename.is_equal ("-") then
				print_postscript
			else
				in_file := INPUT_STREAM_.make_file_open_read (in_filename)
				if INPUT_STREAM_.is_open_read (in_file) then
					set_input_buffer (new_file_buffer (in_file))
					print_postscript
					INPUT_STREAM_.close (in_file)
				else
					std.error.put_string ("ascii2ps: cannot open %'")
					std.error.put_string (in_filename)
					std.error.put_string ("%'%N")
					Exceptions.die (1)
				end
			end
			if out_file /= Void and then not OUTPUT_STREAM_.is_closed (out_file) then
				OUTPUT_STREAM_.close (out_file)
			end
		rescue
			std.error.put_string ("ascii2ps: internal error%N")
			Exceptions.die (1)
		end

feature -- Access

	flag_n: BOOLEAN
	tab_length: INTEGER
	user_font: STRING
	has_header: BOOLEAN
	filename: STRING
	date, time: STRING

	us_letter: BOOLEAN
			-- Will the PostScript output be printed on
			-- US-letter paper? (A4 paper otherwise)

	double_sided: BOOLEAN
			-- Will the PostScript output be printed on
			-- double side paper (i.e. recto-verso)?

	usage_message: STRING is
			"usage: ascii2ps [-h] [-n] [-d date] [-t time]%N%
				%T[-l] [-2] [filename | -] [filename | -]%N"

feature -- Generation

	print_postscript is
			-- Print PostScript format of `input_buffer'
			-- to `output_file'.
		do
			output ("%%! PS-Adobe-1.0%N")
			output ("%%%%Creator:%T%T%TEric Bezault%N")
			output ("%%%%Title:%T%T%TPretty Printer%N")
			output ("%%%%CreateDate:%T%TMon Jan 27 1992%N")
			output ("%%%%DocumentFonts:%TTimes-Roman Times-Bold Courier%N")
			output ("%%%%EndComments%N%N")

			output ("/inch {72 mul} def%N")
			output ("%T%T%% Translate from `inch' unit to `point' unit.%N%N")

			if us_letter then
					-- US Letter
				output ("/pagewidth 8.45 inch def%N")
				output ("%T%T%% Width of the page%N%N")
				output ("/pageheight 11 inch def%N")
				output ("%N%N%% Height of the page%N%N")
			else
					-- A4
				output ("/pagewidth 8.27 inch def%N")
				output ("%T%T%% Width of the page%N%N")
				output ("/pageheight 11.69 inch def%N")
				output ("%N%N%% Height of the page%N%N")
			end

			output ("/textmargin 0.25 inch def%N")
			output ("%N%N%% Margin used when printing the text in a document%N%N")

			output ("/pagemargin 0.25 inch def%N")
			output ("%T%T%% Margin used to draw the frame on the page%N%N")

			output ("/titleheight 0.5 inch def%N")
			output ("%T%T%% Height of the title bar%N%N")

			output ("/pagenb 0 def%N")
			output ("%T%T%% Current document page number%N%N")

			output ("/letter ( ) def%N")
			output ("%T%T%% One character string%N%N")

			output ("/docwidth { %% - => -%N")
			output ("%T%T%% Width of the document which will fit on%N")
			output ("%T%T%% half a horizontal page%N")
			output ("%Tpageheight 2 div pagemargin sub%N")
			output ("%T} def%N%N")

			output ("/docheight { %% - => -%N")
			output ("%T%T%% Height of the document which will fit on%N")
			output ("%T%T%% half a horizontal page%N")
			output ("%Tpagewidth titleheight sub pagemargin 2 mul sub%N")
			output ("%T} def%N%N")

			output ("/settextfont { %% - => - %N")
			output ("%T%T%% Set current font to the font intended to print%N")
			output ("%T%T%% the file text. `userfont' must not be `Void'.%N")
			output ("%Tuserfont cvn findfont 7 scalefont setfont%N")
			output ("%T/linespacing 8 def%N")
			output ("%T} def%N%N")

			output ("/setfilenamefont { %% - => - %N")
			output ("%T%T%% Set current font to the font intended to print%N")
			output ("%T%T%% the file name in the title bar.%N")
			output ("%T/Times-Roman findfont 14 scalefont setfont%N")
			output ("%T} def%N%N")

			output ("/setpagenbfont { %% - => - %N")
			output ("%T%T%% Set current font to the font intended to print%N")
			output ("%T%T%% the current page number in the title bar.%N")
			output ("%T/Times-Bold findfont 20 scalefont setfont%N")
			output ("%T} def%N%N")

			output ("/setdatefont { %% - => - %N")
			output ("%T%T%% Set current font to the font intended to print%N")
			output ("%T%T%% the current date in the title bar.%N")
			output ("%T/Times-Bold findfont 11 scalefont setfont%N")
			output ("%T} def%N%N")

			output ("/setfilename { %% string => -%N")
			output ("%T%T%% Assign `string' to `filename'.%N")
			output ("%T/filename exch def%N")
			output ("%T} def%N%N")

			output ("/setdate { %% string1 string2 => -%N")
			output ("%T%T%% Assign `string1' to `date' and%N")
			output ("%T%T%% `string2' to `time'.%N")
			output ("%T/time exch def%N")
			output ("%T/date exch def%N")
			output ("%T} def%N%N")

			output ("/setuserfont { %% string => -%N")
			output ("%T%T%% Assign `string' to `userfont'.%N")
			output ("%T/userfont exch def%N")
			output ("%T} def%N%N")

			output ("/settablength { %% int => -%N")
			output ("%T%T%% Assign `int' to `tablegnth', which is%N")
			output ("%T%T%% Space between two tabulation marks%N")
			output ("%T/tablength exch def%N")
			output ("%T} def%N%N")

			output ("/setshowtitlebar { %% bool => -%N")
			output ("%T%T%% Set whether the title bar will be shown or not.%N")
			output ("%Tnot%N")
			output ("%T{/titleheight 0 def}%N")
			output ("%Tif%N")
			output ("%T} def%N%N")

			output ("/stringheight { %% string => lower upper%N")
			output ("%T%T%% Calculate the vertical space which would be%N")
			output ("%T%T%% used by `string' if it was given as the %N")
			output ("%T%T%% operand to `show' with the current font.%N")
			output ("%T%% 2 dict begin %N")
			output ("%Tgsave%N")
			output ("%T/uy 0 def%N")
			output ("%T/ly 0 def%N")
			output ("%T{%Tnewpath%N")
			output ("%T%T0 0 moveto%N")
			output ("%T%Tletter dup 0 4 -1 roll put false charpath%N")
			output ("%T%Tflattenpath pathbbox%N")
			output ("%T%Tdup uy gt%N")
			output ("%T%T%T{/uy exch def}%N")
			output ("%T%T%T{pop}%N")
			output ("%T%Tifelse%N")
			output ("%T%Tpop dup ly lt%N")
			output ("%T%T%T{/ly exch def}%N")
			output ("%T%T%T{pop}%N")
			output ("%T%Tifelse%N")
			output ("%T%Tpop}%N")
			output ("%Tforall%N")
			output ("%Tly neg uy%N")
			output ("%Tgrestore %N")
			output ("%T%% end%N")
			output ("%T} def%N%N")

			output ("/printfilename { %% - => -%N")
			output ("%T%T%% Print the file name of the document at the top%N")
			output ("%T%T%% of the page. `filename' must not be `Void'.%N")
			output ("%T%T%% The user coordinate system origin must be%N")
			output ("%T%T%% located at the lower left corner of the%N")
			output ("%T%T%% horizontally oriented page.%N")
			output ("%Tgsave%N")
			output ("%Tpagemargin dup docheight add translate%N")
			output ("%Tnewpath%N")
			output ("%T0 0 moveto%N")
			output ("%T0 titleheight rlineto%N")
			output ("%Tdocwidth 2 mul 0 rlineto%N")
			output ("%T0 titleheight neg rlineto%N")
			output ("%Tclosepath%N")
			output ("%Tgsave 0.95 setgray fill grestore%N")
			output ("%Tclip setfilenamefont%N")
			output ("%Tdocwidth 2 mul filename stringwidth pop sub 2 div%N")
			output ("%Ttitleheight filename stringheight exch")
			output (" dup 4 1 roll add sub 2 div add%N")
			output ("%Tmoveto filename show%N")
			output ("%Tgrestore%N")
			output ("%T} def%N%N")

			output ("/drawtopcorner { %% - => -%N")
			output ("%T%T%% Draw black rectangle whose width is")
			output (" 2 * `titleheight'%N")
			output ("%T%T%% and whose height is `titleheight'.%N")
			output ("%Tnewpath%N")
			output ("%T0 0 moveto%N")
			output ("%T0 titleheight rlineto%N")
			output ("%Ttitleheight 2 mul 0 rlineto%N")
			output ("%T0 titleheight neg rlineto%N")
			output ("%Tclosepath%N")
			output ("%Tgsave 0.3 setgray fill grestore%N")
			output ("%Tclip%N")
			output ("%T} def%N%N")

			output ("/printpagenb { %% - => -%N")
			output ("%T%T%% Print the page number at the upper right corner.%N")
			output ("%T%T%% The user coordinate system origin must be%N")
			output ("%T%T%% located at the lower left corner of the%N")
			output ("%T%T%% horizontally oriented page.%N")
			output ("%Tgsave%N")
			output ("%Tpageheight titleheight 2 mul sub pagemargin sub%N")
			output ("%Tdocheight pagemargin add translate%N")
			output ("%Tdrawtopcorner%N")
			output ("%Tsetpagenbfont%N")
			output ("%Tpagenb 2 div 1 add cvi 10 string cvs dup dup%N")
			output ("%Ttitleheight 2 mul exch stringwidth pop sub 2 div exch%N")
			output ("%Ttitleheight exch stringheight exch")
			output (" dup 4 1 roll add sub 2 div add%N")
			output ("%Tmoveto 1 setgray show%N")
			output ("%Tgrestore%N")
			output ("%T} def%N%N")

			output ("/printdate { %% - => -%N")
			output ("%T%T%% Print the date at the upper left corner.%N")
			output ("%T%T%% `date' and `time' must not be `Void'.%N")
			output ("%T%T%% The user coordinate system origin must be%N")
			output ("%T%T%% located at the lower left corner of the%N")
			output ("%T%T%% horizontally oriented page.%N")
			output ("%T%% 2 dict begin%N")
			output ("%Tgsave%N")
			output ("%Tpagemargin dup docheight add translate%N")
			output ("%Tdrawtopcorner%N")
			output ("%Tsetdatefont%N")
			output ("%T1 setgray%N")
			output ("%T/timeheight time stringheight add def%N")
			output ("%T/dateline titleheight timeheight sub")
			output (" date stringheight add sub 5 div def%N")
			output ("%Ttitleheight 2 mul time stringwidth pop sub 2 div%N")
			output ("%Tdateline 2 mul moveto%N")
			output ("%Ttime show%N")
			output ("%Ttitleheight 2 mul date stringwidth pop sub 2 div%N")
			output ("%Tdateline 3 mul timeheight add moveto%N")
			output ("%Tdate show%N")
			output ("%Tgrestore %N")
			output ("%T%% end%N")
			output ("%T} def%N%N")

			output ("/drawframe { %% - => -%N")
			output ("%T%T%% Draw the frame on the page.%N")
			output ("%T%T%% The user coordinate system origin must be%N")
			output ("%T%T%% located at the lower left corner of the%N")
			output ("%T%T%% horizontally oriented page.%N")
			output ("%Tgsave%N")
			output ("%T0.5 setlinewidth%N")
			output ("%Tnewpath%N")
			output ("%Tpagemargin dup moveto%N")
			output ("%T0 docheight titleheight add rlineto%N")
			output ("%Tdocwidth 2 mul 0 rlineto%N")
			output ("%T0 docheight titleheight add neg rlineto%N")
			output ("%Tclosepath stroke%N")
			output ("%Tpagemargin docwidth add pagemargin moveto%N")
			output ("%T0 docheight rlineto%N")
			output ("%Tdocwidth neg 0 rmoveto%N")
			output ("%Tdocwidth 2 mul 0 rlineto%N")
			output ("%Tstroke%N")
			output ("%Tgrestore%N")
			output ("%T} def%N%N")

			output ("/pageinit { %% - => -%N")
			output ("%T%T%% Give to the page a horizontal orientation,%N")
			output ("%T%T%% divide it into two documents and a title bar.%N")
			if double_sided then
				output ("%Tpagenb 2 idiv 2 mod 0 eq%N")
				output ("%T%T{%N%
					%%T%T%T90 rotate%N%
					%%T%T%T0 pagewidth neg translate%N%
					%%T%T}%N")
				output ("%T%T{%N%
					%%T%T%T-90 rotate%N%
					%%T%T%Tpageheight neg 0 translate%N%
					%%T%T}%N")
				output ("%Tifelse%N")
			else
				output ("%T90 rotate%N")
				output ("%T0 pagewidth neg translate%N")
			end
			output ("%T0.07 inch neg 0.035 inch neg translate%N")
			output ("%Tprintfilename %N")
			output ("%Tprintpagenb %N")
			output ("%Tprintdate%N")
			output ("%Tdrawframe%N")
			output ("%Tsettextfont%N")
			output ("%T} def%N%N")

			output ("/setclip { %% - => -%N")
			output ("%T%T%% Make the current document the current clip.%N")
			output ("%T%T%% Out of that area, nothing will be printed.%N")
			output ("%Tnewpath%N")
			output ("%T0 0 moveto%N")
			output ("%T0 docheight rlineto%N")
			output ("%Tdocwidth 0 rlineto%N")
			output ("%T0 docheight neg rlineto%N")
			output ("%Tclosepath%N")
			output ("%Tclip%N")
			output ("%T} def%N%N")

			output ("/firstpage { %% - => -%N")
			output ("%T%T%% Make the left part of the page the current%N")
			output ("%T%T%% document, that's to say where the text will be%N")
			output ("%T%T%% printed. Keep track of the page number.%N")
			output ("%T/pagenb pagenb 1 add def%N")
			output ("%Tpagemargin dup translate%N")
			output ("%Tsetclip%N")
			output ("%Ttextmargin docheight textmargin sub moveto%N")
			output ("%T} def%N%N")

			output ("/secondpage { %% - => -%N")
			output ("%T%T%% Make the right part of the page the current%N")
			output ("%T%T%% document, that's to say where the text will be%N")
			output ("%T%T%% printed. Keep track of the page number.%N")
			output ("%T/pagenb pagenb 1 add def%N")
			output ("%Tpagemargin dup docwidth add exch translate%N")
			output ("%Tsetclip%N")
			output ("%Ttextmargin docheight textmargin sub moveto%N")
			output ("%T} def%N%N")

			output ("/newline { %% - => -%N")
			output ("%T%T%% Skip one line. Skip one document if%N")
			output ("%T%T%% the current one is full.%N")
			output ("%Tcurrentpoint linespacing sub%N")
			output ("%Tdup textmargin lt%N")
			output ("%T%T{pop pop newpage}%N")
			output ("%T%T{exch pop textmargin exch moveto}%N")
			output ("%Tifelse%N")
			output ("%T} def%N%N")

			output ("/newpage { %% - => -%N")
			output ("%T%T%% Skip one document.%N")
			output ("%Tpagenb 2 mod 0 eq%N")
			output ("%T%T{showpage pageinit gsave firstpage newline}%N")
			output ("%T%T{grestore gsave secondpage newline}%N")
			output ("%Tifelse%N")
			output ("%T} def%N%N")

			output ("/printtab { %% - => -%N")
			output ("%T%T%% Move to the next tabulation mark on the current%N")
			output ("%T%T%% document, from the current position.%N")
			output ("%Tletter dup 0 110 put%T%T%T%% char (110) = 'n'%N")
			output ("%Tstringwidth pop tablength mul dup%N")
			output ("%Tcurrentpoint pop textmargin sub dup%N")
			output ("%T4 -1 roll div %N")
			output ("%T%T%% patch: remove errors due to calculation%N")
			output ("%T%T%% imprecisions (0.99999 instead of 1.0)%N")
			output ("%T1 tablength div 3 div add%N")
			output ("%Tfloor 1 add%N")
			output ("%T3 -1 roll mul exch sub 0 rmoveto%N")
			output ("%T} def%N%N")

			output ("/printword { %% string => -%N")
			output ("%T%T%% Print `string' on the current document, starting%N")
			output ("%T%T%% at the current position. The processed string%N")
			output ("%T%T%% is assumed to be a word, that's to say a string%N")
			output ("%T%T%% with no separator characters, which are blanks,%N")
			output ("%T%T%% tabulations and new_lines. Skip a line if the%N")
			output ("%T%T%% word is too long, and cut the word if it does%N")
			output ("%T%T%% not fit on a line.%N")
			output ("%T%% 1 dict begin%N")
			output ("%T/word exch def%N")
			output ("%Tcurrentpoint pop word stringwidth pop add%N")
			output ("%Tdocwidth textmargin sub gt%N")
			output ("%T%T{%Tword stringwidth pop docwidth textmargin 2 mul sub gt")
			output ("%N%T%T%T%T{word printchars}%N")
			output ("%T%T%T%T{newline word show}%N")
			output ("%T%T%Tifelse}%N")
			output ("%T%T{word show}%N")
			output ("%Tifelse%N")
			output ("%T%% end%N")
			output ("%T} def%N%N")

			output ("/printchars { %% string => -%N")
			output ("%T%T%% Print `string' on the current document, charater%N")
			output ("%T%T%% by character, starting at the current position.%N")
			output ("%T%T%% Skip a line if the string is too long.%N")
			output ("%T%% 1 dict begin%N")
			output ("%T{%T/char letter dup 0 5 -1 roll put def%N")
			output ("%T%Tcurrentpoint pop char stringwidth pop add%N")
			output ("%T%Tdocwidth textmargin sub gt%N")
			output ("%T%T%T{newline}%N")
			output ("%T%Tif%N")
			output ("%T%Tchar show}%N")
			output ("%Tforall%N")
			output ("%T%% end%N")
			output ("%T} def%N%N")

			output ("%%%%EndProlog%N%N")
	
			output ("(")
			output (escaped_string (user_font))
			output (") setuserfont%N")
			output (tab_length.out)
			output (" settablength%N")
			if flag_n then
				output ("() setfilename%N")
			else
				output ("(")
				output (escaped_string (filename))
				output (") setfilename%N")
			end
			output ("(")
			output (escaped_string (date))
			output (") (")
			output (escaped_string (time))
			output (") setdate%N")
			if has_header then
				output ("true")
			else
				output ("false")
			end
			output (" setshowtitlebar%N")
			output ("pageinit%N")
			output ("gsave%N")
			output ("firstpage%N")
			scan
			output ("grestore%N")
			output ("showpage%N")
		end

feature {NONE} -- Implementation

	escaped_string (a_string: STRING): STRING is
			-- Escaped version of `a_string' according
			-- to PostScript rules
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			from
				i := 1
				nb := a_string.count
				Result := STRING_.make (nb)
			until
				i > nb
			loop
				c := a_string.item (i)
				if c = '(' or c = ')' or c = '\' then
					Result.append_character ('\')
				end
				Result.append_character (c)
				i := i + 1
			end
		ensure
			escaped_string_not_void: Result /= Void
		end

	basename (a_filename: STRING): STRING is
			-- Basename of filename `a_filename'
			-- (Use '/' and '\' as filename separator)
		require
			a_filename_not_void: a_filename /= Void
		local
			i, nb: INTEGER
		do
			from
				nb := a_filename.count
				i := nb
			until
				i < 1 or else
				a_filename.item (i) = '/' or
				a_filename.item (i) = '\'
			loop
				i := i - 1
			end
			if i < nb then
				Result := a_filename.substring (i + 1,  nb)
			else
				Result := STRING_.make (0)
			end
		ensure
			basename_not_void: Result /= Void
		end

feature -- Output

	output_file: like OUTPUT_STREAM_TYPE
			-- Output file

	set_output_file (a_file: like OUTPUT_STREAM_TYPE) is
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

	output (a_text: like text) is
			-- Output `a_text' to `output_file'.
		do
			output_file.put_string (a_text)
		end

invariant

	date_not_void: date /= Void
	time_not_void: time /= Void
	user_font_not_void: user_font /= Void
	tab_length_positive: tab_length > 0
	filename_not_void: filename /= Void
	output_not_void: output_file /= Void
	output_open_write: OUTPUT_STREAM_.is_open_write (output_file)

end -- class ASCII2PS
