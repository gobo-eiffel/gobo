%{
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

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_ARGUMENTS

	KL_SHARED_EXCEPTIONS

creation

	make
%}

%option nodefault outfile="ascii2ps.e"

%%

"\n"				output_file.put_string ("%Tnewline%N")
" "					output_file.put_string ("%T( ) show%N")
"\t"				output_file.put_string ("%Tprinttab%N")
""				output_file.put_string ("%Tnewpage%N")
[^ \t\n\\()]+	{
					output_file.put_string ("%T(")
					output_file.put_string (text)
					output_file.put_string (") printword%N")
				}
("("|")"|"\\")	{
					output_file.put_string ("%T(\")
					output_file.put_character (text_item (1))
					output_file.put_string (") printword%N")
				}

%%

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

			if us_letter then
					-- US Letter
				output_file.put_string ("/pagewidth 8.45 inch def%N")
				output_file.put_string ("%T%T%% Width of the page%N%N")
				output_file.put_string ("/pageheight 11 inch def%N")
				output_file.put_string ("%N%N%% Height of the page%N%N")
			else
					-- A4
				output_file.put_string ("/pagewidth 8.27 inch def%N")
				output_file.put_string ("%T%T%% Width of the page%N%N")
				output_file.put_string ("/pageheight 11.69 inch def%N")
				output_file.put_string ("%N%N%% Height of the page%N%N")
			end

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
			if double_sided then
				output_file.put_string ("%Tpagenb 2 idiv 2 mod 0 eq%N")
				output_file.put_string ("%T%T{%N%
					%%T%T%T90 rotate%N%
					%%T%T%T0 pagewidth neg translate%N%
					%%T%T}%N")
				output_file.put_string ("%T%T{%N%
					%%T%T%T-90 rotate%N%
					%%T%T%Tpageheight neg 0 translate%N%
					%%T%T}%N")
				output_file.put_string ("%Tifelse%N")
			else
				output_file.put_string ("%T90 rotate%N")
				output_file.put_string ("%T0 pagewidth neg translate%N")
			end
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
				("%T%T{showpage pageinit gsave firstpage newline}%N")
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
			output_file.put_string (escaped_string (user_font))
			output_file.put_string (") setuserfont%N")
			output_file.put_integer (tab_length)
			output_file.put_string (" settablength%N")
			if flag_n then
				output_file.put_string ("() setfilename%N")
			else
				output_file.put_character ('(')
				output_file.put_string (escaped_string (filename))
				output_file.put_string (") setfilename%N")
			end
			output_file.put_character ('(')
			output_file.put_string (escaped_string (date))
			output_file.put_string (") (")
			output_file.put_string (escaped_string (time))
			output_file.put_string (") setdate%N")
			if has_header then
				output_file.put_string ("true")
			else
				output_file.put_string ("false")
			end
			output_file.put_string (" setshowtitlebar%N")
			output_file.put_string ("pageinit%N")
			output_file.put_string ("gsave%N")
			output_file.put_string ("firstpage%N")
			scan
			output_file.put_string ("grestore%N")
			output_file.put_string ("showpage%N")
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

invariant

	date_not_void: date /= Void
	time_not_void: time /= Void
	user_font_not_void: user_font /= Void
	tab_length_positive: tab_length > 0
	filename_not_void: filename /= Void

end -- class ASCII2PS
