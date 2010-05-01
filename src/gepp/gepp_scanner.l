%{
note

	description:

		"Scanners for 'gepp' preprocessors"

	copyright: "Copyright (c) 1999-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

%x S_PREPROC S_READLINE S_SKIP_EOL

%option ecs meta-ecs case-insensitive nodefault outfile="gepp_scanner.e"

WS					[ \t\r]+

%%

<INITIAL>{
	^"##".*			{
						-- Comment.
						set_start_condition (S_SKIP_EOL)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#ifdef"		{
						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#ifndef"		{
						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#else"		{
						last_token := P_ELSE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#endif"		{
						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#include"		{
						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#define"		{
						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#undef"		{
						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					}
	^"#"			{
						echo
						set_start_condition (S_READLINE)
					}
	^[^#\n].*\n		|
	^\n				{
						echo
						line_nb := line_nb + 1
					}
	^[^#\n].*		{
						echo
					}
}

<S_READLINE>{
	.*\n			{
						echo
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					}
	.*				{
						echo
						set_start_condition (INITIAL)
					}
}

<S_SKIP_EOL>{
	.*\n			{
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					}
	.*				{
						set_start_condition (INITIAL)
					}
}

<S_PREPROC>{
	{WS}				-- Separator.
	\"[^"\n]+\"		{
						last_token := P_STRING
						last_string_value := text_substring (2, text_count - 1)
					}
	[a-z0-9_.-]+	{
						last_token := P_NAME
						last_string_value := text
					}
	"&&"				last_token := P_AND
	"||"				last_token := P_OR
	\n				{
						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					}
	<<EOF>>			{
						last_token := P_EOL
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

	include_stack: DS_STACK [YY_BUFFER] is
			-- Input buffers not completely parsed yet
		deferred
		ensure
			include_stack_not_void: Result /= Void
			no_void_buffer: not Result.has (Void)
		end

	line_nb_stack: DS_STACK [INTEGER] is
			-- Line numbers in the corresponding input buffers in `include_stack'
		deferred
		ensure
			line_nb_stack_not_void: Result /= Void
			same_count: Result.count = include_stack.count
		end

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		deferred
		end

	empty_lines: BOOLEAN
			-- Should empty lines be generated when lines are
			-- ignored in order to preserve line numbering?

feature -- Status setting

	set_empty_lines (b: BOOLEAN) is
			-- Set `empty_lines' to `b'.
		do
			empty_lines := b
		ensure
			empty_lines_set: empty_lines = b
		end

feature -- Element change

	wrap: BOOLEAN is
			-- Should current scanner terminate when end of file is reached?
			-- True unless an include file was being processed.
		local
			old_buffer: YY_FILE_BUFFER
			a_file: KI_CHARACTER_INPUT_STREAM
		do
			if not include_stack.is_empty then
				old_buffer ?= input_buffer
				set_input_buffer (include_stack.item)
				line_nb := line_nb_stack.item
				line_nb_stack.remove
				include_stack.remove
				if old_buffer /= Void then
					a_file := old_buffer.file
					if a_file.is_closable then
						a_file.close
					end
				end
				set_start_condition (INITIAL)
			else
				Result := True
			end
		end

feature -- Output

	output_file: KI_TEXT_OUTPUT_STREAM
			-- Output file

	set_output_file (a_file: like output_file) is
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

	output (a_text: like text) is
			-- Output `a_text' to `output_file'.
		local
			nb: INTEGER
		do
			if not ignored then
				nb := a_text.count
				if nb > 0 then
					if a_text.item (nb) = '%N' then
						nb := nb - 1
						if nb > 0 and then a_text.item (nb) = '%R' then
							nb := nb - 1
						end
						if nb > 0 then
							output_file.put_line (a_text.substring (1, nb))
						else
							output_file.put_new_line
						end
					else
						output_file.put_string (a_text)
					end
				end
			elseif empty_lines then
				output_file.put_new_line
			end
		end

invariant

	output_not_void: output_file /= Void
	output_open_write: output_file.is_open_write

end
