%{
indexing

	description:

		"Scanners for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class GEPP_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		redefine
			wrap, output
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
	\"[^"\n]+\"		{
						last_token := P_STRING
						last_value := text_substring (2, text_count - 1)
					}
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
			make_with_buffer (Empty_buffer)
			output_file := std.output
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

	include_stack: DS_STACK [YY_BUFFER] is
			-- Input buffers not completely parsed yet
		deferred
		ensure
			include_stack_not_void: Result /= Void
			no_void_buffer: not Result.has (Void)
		end

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		deferred
		end

feature -- Element change

	wrap: BOOLEAN is
			-- Should current scanner terminate when end of file is reached?
			-- True unless an include file was being processed.
		local
			old_buffer: YY_FILE_BUFFER
		do
			if not include_stack.is_empty then
				old_buffer ?= input_buffer
				set_input_buffer (include_stack.item)
				include_stack.remove
				if old_buffer /= Void then
					INPUT_STREAM_.close (old_buffer.file)
				end
				set_start_condition (INITIAL)
			else
				Result := True
			end
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

	output_not_void: output_file /= Void
	output_open_write: OUTPUT_STREAM_.is_open_write (output_file)

end -- class GEPP_SCANNER
