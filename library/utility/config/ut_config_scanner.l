%{
indexing

	description:

		"Scanners for config files made up of name/value pairs and preprocessor instructions"

	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class UT_CONFIG_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		redefine
			wrap, output
		end

	UT_CONFIG_TOKENS
		export {NONE} all end

%}

%x S_PREPROC S_READLINE S_SKIP_EOL S_NAME S_VALUE S_EMPTY_LINE

%option ecs meta-ecs case-insensitive nodefault outfile="ut_config_scanner.e"

WS					[ \t\r]+
NAME				[a-z0-9_.-]+

%%

<INITIAL>{
	^{WS}*"--".*	|
	^{WS}*"##".*	{
						-- Comment.
						set_start_condition (S_SKIP_EOL)
					}
	^{WS}*"#ifdef"	{
						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
					}
	^{WS}*"#ifndef"	{
						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
					}
	^{WS}*"#else"	{
						last_token := P_ELSE
						set_start_condition (S_PREPROC)
					}
	^{WS}*"#endif"	{
						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
					}
	^{WS}*"#include" {
						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
					}
	^{WS}*"#define"	{
						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
					}
	^{WS}*"#undef"	{
						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
					}
	^{WS}*{NAME}	{
						last_token := P_NAME
						last_string_value := text
						STRING_.left_adjust (last_string_value)
						set_start_condition (S_NAME)
					}
	^\n 			{
						last_token := P_EOL
						line_nb := line_nb + 1
					}
	^{WS}+			{
						set_start_condition (S_EMPTY_LINE)
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
	{NAME}			{
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
}

<S_NAME>{
	{WS}				-- Separator.
	":"				{
						last_token := P_COLON
						set_start_condition (S_VALUE)
					}
}

<S_VALUE>{
	{WS}				-- Separator.
	[^ \t\r\n].*	{
						last_token := P_VALUE
						last_string_value := text
					}
	\n				{
						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					}
	<<EOF>>			{
						last_token := P_EOL
						set_start_condition (INITIAL)
					}
}

<S_EMPTY_LINE>		{
	\n				{
						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					}
	<<EOF>>			{
						last_token := P_EOL
						set_start_condition (INITIAL)
					}
}

<*>.|\n				{
						last_token := text_item (1).code
						set_start_condition (INITIAL)
					}

%%

feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_with_buffer (Empty_buffer)
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
			no_void_buffer: not Result.has_void
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

feature -- Element change

	wrap: BOOLEAN is
			-- Should current scanner terminate when end of file is reached?
			-- True unless an include file was being processed.
		local
			old_buffer: detachable YY_FILE_BUFFER
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

	output (a_text: like text) is
			-- Silently ignore `a_text'.
		do
		end

end
