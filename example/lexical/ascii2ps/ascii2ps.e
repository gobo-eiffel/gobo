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
		end

	ARGUMENTS
		export
			{NONE} all
		end

	KL_SHARED_EXCEPTIONS

	KL_SHARED_INPUT_STREAM_ROUTINES

	KL_SHARED_OUTPUT_STREAM_ROUTINES

	KL_SHARED_STANDARD_FILES

creation

	make

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
			yy_base := yy_base_
			yy_def := yy_def_
			yy_ec := yy_ec_
			yy_meta := yy_meta_
			yy_accept := yy_accept_
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
--|#line 44
output_file.put_string ("%Tnewline%N")
when 2 then
--|#line 45
output_file.put_string ("%T( ) show%N")
when 3 then
--|#line 46
output_file.put_string ("%Tprinttab%N")
when 4 then
--|#line 47
output_file.put_string ("%Tnewpage%N")
when 5 then
--|#line 48

					output_file.put_string ("%T(")
					output_file.put_string (text)
					output_file.put_string (") printword%N")
				
when 6 then
--|#line 53

					output_file.put_string ("%T(\")
					output_file.put_character (text_item (1))
					output_file.put_string (") printword%N")
				
when 7 then
--|#line 59
fatal_error ("scanner jammed")
			else
				fatal_error ("fatal scanner internal error: no action found")
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

feature {NONE} -- Tables

	yy_nxt_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    4,    5,    6,    7,    8,    9,    9,    9,   10,
			   10,   11,    3,   11,   11,   11,   11,   11,   11,   11,
			   11>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,   10,
			    4,    3,   11,   11,   11,   11,   11,   11,   11,   11,
			   11>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,    0,   11,    9,   12,   12,   12,   12,   12,
			    8,   12>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,   11,    1,   11,   11,   11,   11,   11,   11,   11,
			   11,    0>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
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
			    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,    0,    8,    5,    3,    1,    4,    2,    6,
			    5,    0>>, 0)
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
			in_filename, out_filename: STRING
			in_file: like INPUT_STREAM_TYPE
			out_file: like OUTPUT_STREAM_TYPE
		do
			make_compressed_scanner_skeleton
			tab_length := 4
			user_font := "Courier"
			header := "true"
			date := "06/21/97"
			time := "18:06:34"
			i := 1
			nb := argument_count
				-- Read options.
			if nb >= 1 and then argument (1).is_equal ("-n") then
				flag_n := True
				i := i + 1
			end
				-- Read filenames.
			inspect nb - i + 1
			when 0 then
				in_filename := "-"
				out_filename := "-"
				filename := "standard input"
			when 1 then
				in_filename := argument (i)
				out_filename := "-"
				filename := in_filename
			when 2 then
				in_filename := argument (i)
				out_filename := argument (i + 1)
				filename := in_filename
			else
				std.error.put_string
					("usage: ascii2ps [-n] [filename [filename]]%N")
				exceptions_.die (1)
			end

			if not out_filename.is_equal ("-") then
				out_file := output_Stream_.make_file_open_write (out_filename)
				if output_stream_.is_open_write (out_file) then
					set_output_file (out_file)
				else
					std.error.put_string ("ascii2ps: cannot open %'")
					std.error.put_string (out_filename)
					std.error.put_string ("%'%N")
					exceptions_.die (1)
				end
			else
				set_output_file (std.output)
			end
			if in_filename.is_equal ("-") then
				print_postscript
			else
				in_file := input_stream_.make_file_open_read (in_filename)
				if input_stream_.is_open_read (in_file) then
					set_input_buffer (new_file_buffer (in_file))
					print_postscript
					input_stream_.close (in_file)
				else
					std.error.put_string ("ascii2ps: cannot open %'")
					std.error.put_string (in_filename)
					std.error.put_string ("%'%N")
					exceptions_.die (1)
				end
			end
			if out_file /= Void and then not output_stream_.is_closed (out_file) then
				output_stream_.close (out_file)
			end
		rescue
			std.error.put_string ("ascii2ps: internal error%N")
			exceptions_.die (1)
		end

feature -- Access

	flag_n: BOOLEAN
	tab_length: INTEGER
	user_font: STRING
	header: STRING
	filename: STRING
	date, time: STRING

feature -- Generation

	print_postscript is
			-- Print PostScript format of `input_buffer'
			-- to `output_file'.
		do
			output_file.put_string ("%%! PS-Adobe-1.0%N")
			output_file.put_string ("%%%%Creator:%T%T%TEric Bezault%N")
			output_file.put_string ("%%%%Title:%T%T%TPretty Printer%N")
			output_file.put_string ("%%%%CreateDate:%T%TMon Jan 27 1992%N")
			output_file.put_string
				("%%%%DocumentFonts:%TTimes-Roman Times-Bold Courier%N")
			output_file.put_string ("%%%%EndComments%N%N")

			output_file.put_string ("/inch {72 mul} def%N")
			output_file.put_string
				("%T%T%% Translate from `inch' unit to `point' unit.%N%N")

				-- A4
			output_file.put_string ("/pagewidth 8.27 inch def%N")
				-- US Letter
			-- output_file.put_string ("/pagewidth 8.45 inch def%N")
			output_file.put_string ("%T%T%% Width of the page%N%N")

				-- A4
			output_file.put_string ("/pageheight 11.69 inch def%N")
				-- US Letter
			-- output_file.put_string ("/pageheight 11 inch def%N")
			output_file.put_string ("%N%N%% Height of the page%N%N")

			output_file.put_string ("/textmargin 0.25 inch def%N")
			output_file.put_string
				("%N%N%% Margin used when printing the text in a document%N%N")

			output_file.put_string ("/pagemargin 0.25 inch def%N")
			output_file.put_string
				("%T%T%% Margin used to draw the frame on the page%N%N")

			output_file.put_string ("/titleheight 0.5 inch def%N")
			output_file.put_string ("%T%T%% Height of the title bar%N%N")

			output_file.put_string ("/pagenb 0 def%N")
			output_file.put_string ("%T%T%% Current document page number%N%N")

			output_file.put_string ("/letter ( ) def%N")
			output_file.put_string ("%T%T%% One character string%N%N")

			output_file.put_string ("/docwidth { %% - => -%N")
			output_file.put_string
				("%T%T%% Width of the document which will fit on%N")
			output_file.put_string ("%T%T%% half a horizontal page%N")
			output_file.put_string ("%Tpageheight 2 div pagemargin sub%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/docheight { %% - => -%N")
			output_file.put_string
				("%T%T%% Height of the document which will fit on%N")
			output_file.put_string ("%T%T%% half a horizontal page%N")
			output_file.put_string
				("%Tpagewidth titleheight sub pagemargin 2 mul sub%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/settextfont { %% - => - %N")
			output_file.put_string
				("%T%T%% Set current font to the font intended to print%N")
			output_file.put_string
				("%T%T%% the file text. `userfont' must not be `Void'.%N")
			output_file.put_string
				("%Tuserfont cvn findfont 7 scalefont setfont%N")
			output_file.put_string ("%T/linespacing 8 def%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setfilenamefont { %% - => - %N")
			output_file.put_string
				("%T%T%% Set current font to the font intended to print%N")
			output_file.put_string ("%T%T%% the file name in the title bar.%N")
			output_file.put_string
				("%T/Times-Roman findfont 14 scalefont setfont%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setpagenbfont { %% - => - %N")
			output_file.put_string
				("%T%T%% Set current font to the font intended to print%N")
			output_file.put_string
				("%T%T%% the current page number in the title bar.%N")
			output_file.put_string
				("%T/Times-Bold findfont 20 scalefont setfont%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setdatefont { %% - => - %N")
			output_file.put_string
				("%T%T%% Set current font to the font intended to print%N")
			output_file.put_string
				("%T%T%% the current date in the title bar.%N")
			output_file.put_string
				("%T/Times-Bold findfont 11 scalefont setfont%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setfilename { %% string => -%N")
			output_file.put_string ("%T%T%% Assign `string' to `filename'.%N")
			output_file.put_string ("%T/filename exch def%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setdate { %% string1 string2 => -%N")
			output_file.put_string ("%T%T%% Assign `string1' to `date' and%N")
			output_file.put_string ("%T%T%% `string2' to `time'.%N")
			output_file.put_string ("%T/time exch def%N")
			output_file.put_string ("%T/date exch def%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setuserfont { %% string => -%N")
			output_file.put_string ("%T%T%% Assign `string' to `userfont'.%N")
			output_file.put_string ("%T/userfont exch def%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/settablength { %% int => -%N")
			output_file.put_string
				("%T%T%% Assign `int' to `tablegnth', which is%N")
			output_file.put_string
				("%T%T%% Space between two tabulation marks%N")
			output_file.put_string ("%T/tablength exch def%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setshowtitlebar { %% bool => -%N")
			output_file.put_string
				("%T%T%% Set whether the title bar will be shown or not.%N")
			output_file.put_string ("%Tnot%N")
			output_file.put_string ("%T{/titleheight 0 def}%N")
			output_file.put_string ("%Tif%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string
				("/stringheight { %% string => lower upper%N")
			output_file.put_string
				("%T%T%% Calculate the vertical space which would be%N")
			output_file.put_string
				("%T%T%% used by `string' if it was given as the %N")
			output_file.put_string
				("%T%T%% operand to `show' with the current font.%N")
			output_file.put_string ("%T%% 2 dict begin %N")
			output_file.put_string ("%Tgsave%N")
			output_file.put_string ("%T/uy 0 def%N")
			output_file.put_string ("%T/ly 0 def%N")
			output_file.put_string ("%T{%Tnewpath%N")
			output_file.put_string ("%T%T0 0 moveto%N")
			output_file.put_string
				("%T%Tletter dup 0 4 -1 roll put false charpath%N")
			output_file.put_string ("%T%Tflattenpath pathbbox%N")
			output_file.put_string ("%T%Tdup uy gt%N")
			output_file.put_string ("%T%T%T{/uy exch def}%N")
			output_file.put_string ("%T%T%T{pop}%N")
			output_file.put_string ("%T%Tifelse%N")
			output_file.put_string ("%T%Tpop dup ly lt%N")
			output_file.put_string ("%T%T%T{/ly exch def}%N")
			output_file.put_string ("%T%T%T{pop}%N")
			output_file.put_string ("%T%Tifelse%N")
			output_file.put_string ("%T%Tpop}%N")
			output_file.put_string ("%Tforall%N")
			output_file.put_string ("%Tly neg uy%N")
			output_file.put_string ("%Tgrestore %N")
			output_file.put_string ("%T%% end%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/printfilename { %% - => -%N")
			output_file.put_string
				("%T%T%% Print the file name of the document at the top%N")
			output_file.put_string
				("%T%T%% of the page. `filename' must not be `Void'.%N")
			output_file.put_string
				("%T%T%% The user coordinate system origin must be%N")
			output_file.put_string
				("%T%T%% located at the lower left corner of the%N")
			output_file.put_string ("%T%T%% horizontally oriented page.%N")
			output_file.put_string ("%Tgsave%N")
			output_file.put_string
				("%Tpagemargin dup docheight add translate%N")
			output_file.put_string ("%Tnewpath%N")
			output_file.put_string ("%T0 0 moveto%N")
			output_file.put_string ("%T0 titleheight rlineto%N")
			output_file.put_string ("%Tdocwidth 2 mul 0 rlineto%N")
			output_file.put_string ("%T0 titleheight neg rlineto%N")
			output_file.put_string ("%Tclosepath%N")
			output_file.put_string ("%Tgsave 0.95 setgray fill grestore%N")
			output_file.put_string ("%Tclip setfilenamefont%N")
			output_file.put_string
				("%Tdocwidth 2 mul filename stringwidth pop sub 2 div%N")
			output_file.put_string ("%Ttitleheight filename stringheight exch")
			output_file.put_string (" dup 4 1 roll add sub 2 div add%N")
			output_file.put_string ("%Tmoveto filename show%N")
			output_file.put_string ("%Tgrestore%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/drawtopcorner { %% - => -%N")
			output_file.put_string
				("%T%T%% Draw black rectangle whose width is")
			output_file.put_string (" 2 * `titleheight'%N")
			output_file.put_string
				("%T%T%% and whose height is `titleheight'.%N")
			output_file.put_string ("%Tnewpath%N")
			output_file.put_string ("%T0 0 moveto%N")
			output_file.put_string ("%T0 titleheight rlineto%N")
			output_file.put_string ("%Ttitleheight 2 mul 0 rlineto%N")
			output_file.put_string ("%T0 titleheight neg rlineto%N")
			output_file.put_string ("%Tclosepath%N")
			output_file.put_string ("%Tgsave 0.3 setgray fill grestore%N")
			output_file.put_string ("%Tclip%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/printpagenb { %% - => -%N")
			output_file.put_string
				("%T%T%% Print the page number at the upper right corner.%N")
			output_file.put_string
				("%T%T%% The user coordinate system origin must be%N")
			output_file.put_string
				("%T%T%% located at the lower left corner of the%N")
			output_file.put_string ("%T%T%% horizontally oriented page.%N")
			output_file.put_string ("%Tgsave%N")
			output_file.put_string
				("%Tpageheight titleheight 2 mul sub pagemargin sub%N")
			output_file.put_string ("%Tdocheight pagemargin add translate%N")
			output_file.put_string ("%Tdrawtopcorner%N")
			output_file.put_string ("%Tsetpagenbfont%N")
			output_file.put_string
				("%Tpagenb 2 div 1 add cvi 10 string cvs dup dup%N")
			output_file.put_string
				("%Ttitleheight 2 mul exch stringwidth pop sub 2 div exch%N")
			output_file.put_string ("%Ttitleheight exch stringheight exch")
			output_file.put_string (" dup 4 1 roll add sub 2 div add%N")
			output_file.put_string ("%Tmoveto 1 setgray show%N")
			output_file.put_string ("%Tgrestore%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/printdate { %% - => -%N")
			output_file.put_string
				("%T%T%% Print the date at the upper left corner.%N")
			output_file.put_string
				("%T%T%% `date' and `time' must not be `Void'.%N")
			output_file.put_string
				("%T%T%% The user coordinate system origin must be%N")
			output_file.put_string
				("%T%T%% located at the lower left corner of the%N")
			output_file.put_string ("%T%T%% horizontally oriented page.%N")
			output_file.put_string ("%T%% 2 dict begin%N")
			output_file.put_string ("%Tgsave%N")
			output_file.put_string
				("%Tpagemargin dup docheight add translate%N")
			output_file.put_string ("%Tdrawtopcorner%N")
			output_file.put_string ("%Tsetdatefont%N")
			output_file.put_string ("%T1 setgray%N")
			output_file.put_string ("%T/timeheight time stringheight add def%N")
			output_file.put_string ("%T/dateline titleheight timeheight sub")
			output_file.put_string (" date stringheight add sub 5 div def%N")
			output_file.put_string
				("%Ttitleheight 2 mul time stringwidth pop sub 2 div%N")
			output_file.put_string ("%Tdateline 2 mul moveto%N")
			output_file.put_string ("%Ttime show%N")
			output_file.put_string
				("%Ttitleheight 2 mul date stringwidth pop sub 2 div%N")
			output_file.put_string ("%Tdateline 3 mul timeheight add moveto%N")
			output_file.put_string ("%Tdate show%N")
			output_file.put_string ("%Tgrestore %N")
			output_file.put_string ("%T%% end%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/drawframe { %% - => -%N")
			output_file.put_string ("%T%T%% Draw the frame on the page.%N")
			output_file.put_string
				("%T%T%% The user coordinate system origin must be%N")
			output_file.put_string
				("%T%T%% located at the lower left corner of the%N")
			output_file.put_string ("%T%T%% horizontally oriented page.%N")
			output_file.put_string ("%Tgsave%N")
			output_file.put_string ("%T0.5 setlinewidth%N")
			output_file.put_string ("%Tnewpath%N")
			output_file.put_string ("%Tpagemargin dup moveto%N")
			output_file.put_string ("%T0 docheight titleheight add rlineto%N")
			output_file.put_string ("%Tdocwidth 2 mul 0 rlineto%N")
			output_file.put_string
				("%T0 docheight titleheight add neg rlineto%N")
			output_file.put_string ("%Tclosepath stroke%N")
			output_file.put_string
				("%Tpagemargin docwidth add pagemargin moveto%N")
			output_file.put_string ("%T0 docheight rlineto%N")
			output_file.put_string ("%Tdocwidth neg 0 rmoveto%N")
			output_file.put_string ("%Tdocwidth 2 mul 0 rlineto%N")
			output_file.put_string ("%Tstroke%N")
			output_file.put_string ("%Tgrestore%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/pageinit { %% - => -%N")
			output_file.put_string
				("%T%T%% Give to the page a horizontal orientation,%N")
			output_file.put_string
				("%T%T%% divide it into two documents and a title bar.%N")
			output_file.put_string ("%T90 rotate%N")
			output_file.put_string ("%T0 pagewidth neg translate%N")
			output_file.put_string
				("%T0.07 inch neg 0.035 inch neg translate%N")
			output_file.put_string ("%Tprintfilename %N")
			output_file.put_string ("%Tprintpagenb %N")
			output_file.put_string ("%Tprintdate%N")
			output_file.put_string ("%Tdrawframe%N")
			output_file.put_string ("%Tsettextfont%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/setclip { %% - => -%N")
			output_file.put_string
				("%T%T%% Make the current document the current clip.%N")
			output_file.put_string
				("%T%T%% Out of that area, nothing will be printed.%N")
			output_file.put_string ("%Tnewpath%N")
			output_file.put_string ("%T0 0 moveto%N")
			output_file.put_string ("%T0 docheight rlineto%N")
			output_file.put_string ("%Tdocwidth 0 rlineto%N")
			output_file.put_string ("%T0 docheight neg rlineto%N")
			output_file.put_string ("%Tclosepath%N")
			output_file.put_string ("%Tclip%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/firstpage { %% - => -%N")
			output_file.put_string
				("%T%T%% Make the left part of the page the current%N")
			output_file.put_string
				("%T%T%% document, that's to say where the text will be%N")
			output_file.put_string
				("%T%T%% printed. Keep track of the page number.%N")
			output_file.put_string ("%T/pagenb pagenb 1 add def%N")
			output_file.put_string ("%Tpagemargin dup translate%N")
			output_file.put_string ("%Tsetclip%N")
			output_file.put_string
				("%Ttextmargin docheight textmargin sub moveto%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/secondpage { %% - => -%N")
			output_file.put_string
				("%T%T%% Make the right part of the page the current%N")
			output_file.put_string
				("%T%T%% document, that's to say where the text will be%N")
			output_file.put_string
				("%T%T%% printed. Keep track of the page number.%N")
			output_file.put_string ("%T/pagenb pagenb 1 add def%N")
			output_file.put_string
				("%Tpagemargin dup docwidth add exch translate%N")
			output_file.put_string ("%Tsetclip%N")
			output_file.put_string
				("%Ttextmargin docheight textmargin sub moveto%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/newline { %% - => -%N")
			output_file.put_string
				("%T%T%% Skip one line. Skip one document if%N")
			output_file.put_string ("%T%T%% the current one is full.%N")
			output_file.put_string ("%Tcurrentpoint linespacing sub%N")
			output_file.put_string ("%Tdup textmargin lt%N")
			output_file.put_string ("%T%T{pop pop newpage}%N")
			output_file.put_string ("%T%T{exch pop textmargin exch moveto}%N")
			output_file.put_string ("%Tifelse%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/newpage { %% - => -%N")
			output_file.put_string ("%T%T%% Skip one document.%N")
			output_file.put_string ("%Tpagenb 2 mod 0 eq%N")
			output_file.put_string
				("%T%T{showpage pageinit grestore gsave firstpage newline}%N")
			output_file.put_string ("%T%T{grestore gsave secondpage newline}%N")
			output_file.put_string ("%Tifelse%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/printtab { %% - => -%N")
			output_file.put_string
				("%T%T%% Move to the next tabulation mark on the current%N")
			output_file.put_string
				("%T%T%% document, from the current position.%N")
			output_file.put_string
				("%Tletter dup 0 110 put%T%T%T%% char (110) = 'n'%N")
			output_file.put_string ("%Tstringwidth pop tablength mul dup%N")
			output_file.put_string ("%Tcurrentpoint pop textmargin sub dup%N")
			output_file.put_string ("%T4 -1 roll div %N")
			output_file.put_string
				("%T%T%% patch: remove errors due to calculation%N")
			output_file.put_string
				("%T%T%% imprecisions (0.99999 instead of 1.0)%N")
			output_file.put_string ("%T1 tablength div 3 div add%N")
			output_file.put_string ("%Tfloor 1 add%N")
			output_file.put_string ("%T3 -1 roll mul exch sub 0 rmoveto%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/printword { %% string => -%N")
			output_file.put_string
				("%T%T%% Print `string' on the current document, starting%N")
			output_file.put_string
				("%T%T%% at the current position. The processed string%N")
			output_file.put_string
				("%T%T%% is assumed to be a word, that's to say a string%N")
			output_file.put_string
				("%T%T%% with no separator characters, which are blanks,%N")
			output_file.put_string
				("%T%T%% tabulations and new_lines. Skip a line if the%N")
			output_file.put_string
				("%T%T%% word is too long, and cut the word if it does%N")
			output_file.put_string ("%T%T%% not fit on a line.%N")
			output_file.put_string ("%T%% 1 dict begin%N")
			output_file.put_string ("%T/word exch def%N")
			output_file.put_string
				("%Tcurrentpoint pop word stringwidth pop add%N")
			output_file.put_string ("%Tdocwidth textmargin sub gt%N")
			output_file.put_string
				("%T%T{%Tword stringwidth pop docwidth textmargin 2 mul sub gt")
			output_file.put_string ("%N%T%T%T%T{word printchars}%N")
			output_file.put_string ("%T%T%T%T{newline word show}%N")
			output_file.put_string ("%T%T%Tifelse}%N")
			output_file.put_string ("%T%T{word show}%N")
			output_file.put_string ("%Tifelse%N")
			output_file.put_string ("%T%% end%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("/printchars { %% string => -%N")
			output_file.put_string
				("%T%T%% Print `string' on the current document, charater%N")
			output_file.put_string
				("%T%T%% by character, starting at the current position.%N")
			output_file.put_string
				("%T%T%% Skip a line if the string is too long.%N")
			output_file.put_string ("%T%% 1 dict begin%N")
			output_file.put_string
				("%T{%T/char letter dup 0 5 -1 roll put def%N")
			output_file.put_string
				("%T%Tcurrentpoint pop char stringwidth pop add%N")
			output_file.put_string ("%T%Tdocwidth textmargin sub gt%N")
			output_file.put_string ("%T%T%T{newline}%N")
			output_file.put_string ("%T%Tif%N")
			output_file.put_string ("%T%Tchar show}%N")
			output_file.put_string ("%Tforall%N")
			output_file.put_string ("%T%% end%N")
			output_file.put_string ("%T} def%N%N")

			output_file.put_string ("%%%%EndProlog%N%N")
	
			output_file.put_character ('(')
			output_file.put_string (user_font)
			output_file.put_string (") setuserfont%N")
			output_file.put_integer (tab_length)
			output_file.put_string (" settablength%N")
			if flag_n then
				output_file.put_string ("() setfilename%N")
			else
				output_file.put_character ('(')
				output_file.put_string (filename)
				output_file.put_string (") setfilename%N")
			end
			output_file.put_character ('(')
			output_file.put_string (date)
			output_file.put_string (") (")
			output_file.put_string (time)
			output_file.put_string (") setdate%N")
			output_file.put_string (header)
			output_file.put_string (" setshowtitlebar%N")
			output_file.put_string ("pageinit%N")
			output_file.put_string ("gsave%N")
			output_file.put_string ("firstpage%N")
			scan
			output_file.put_string ("grestore%N")
			output_file.put_string ("showpage%N")
		end

end -- class ASCII2PS
