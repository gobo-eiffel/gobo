note

	description:

		"JSON parser skeletons"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class JN_JSON_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton,
			parse as yyparse
		redefine
			report_error
		end

	JN_JSON_SCANNER_SKELETON
		rename
			make as make_json_scanner,
			make_with_error_handler as make_json_scanner_with_error_handler
		redefine
			reset
		end

	KL_SHARED_STREAMS
		export {NONE} all end

feature {NONE} -- Initialization

	make
			-- Create a new JSON parser.
		local
			l_handler: like error_handler
		do
			create l_handler.make_standard
			make_with_error_handler (l_handler)
		end

	make_with_error_handler (a_handler: like error_handler)
			-- Create a new JSON parser.
		require
			a_handler_not_void: a_handler /= Void
		do
			create json_buffer.make_with_size (null_input_stream, Initial_json_buffer_size)
			create counters.make (Initial_counters_capacity)
			create array_values.make (Initial_array_values_capacity)
			create object_values.make (Initial_object_values_capacity)
			create object_keys.make (Initial_object_values_capacity)
			make_json_scanner_with_error_handler (a_handler)
			make_parser_skeleton
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			precursor
			json_buffer.set_end_of_file
			json_buffer.set_file (null_input_stream)
			counters.wipe_out
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING)
			-- Parse JSON text in `a_file`.
			-- `a_filename` is the filename of `a_file`.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
		do
			last_value := Void
			has_error := False
			input_buffer := json_buffer
			json_buffer.set_file (a_file)
			yy_load_input_buffer
			yyparse
			if has_error then
				last_value := Void
			end
			reset
		rescue
			reset
		end

	parse_string (a_string: READABLE_STRING_GENERAL)
			-- Parse JSON text in `a_string`.
		require
			a_string_not_void: a_string /= Void
		do
			last_value := Void
			has_error := False
			input_buffer := json_buffer
			json_buffer.set_string (a_string)
			yy_load_input_buffer
			yyparse
			if has_error then
				last_value := Void
			end
			reset
		rescue
			reset
		end

	parse_utf8_string (a_string: STRING_8)
			-- Parse JSON text in `a_string`.
			-- `a_string' is expected to be encoded with UTF-8.
			-- Replace invalid UTF-8 sequence by `content.invalid_unicode_charater'.
		require
			a_string_not_void: a_string /= Void
		do
			last_value := Void
			has_error := False
			input_buffer := json_buffer
			json_buffer.set_utf8_string (a_string)
			yy_load_input_buffer
			yyparse
			if has_error then
				last_value := Void
			end
			reset
		rescue
			reset
		end

feature -- Access

	last_value: detachable JN_VALUE
			-- Last value parsed, if any

feature {NONE} -- AST factory

	new_array (nb: INTEGER): JN_ARRAY
			-- New JSON array with `nb` values
		require
			nb_not_negative: nb >= 0
		local
			i, j: INTEGER
		do
			create Result.make_with_capacity (nb)
			j := array_values.count - nb + 1
			from i := 1 until i > nb loop
				Result.put_last (array_values.item (j))
				j := j + 1
				i := i + 1
			end
			array_values.prune_last (nb)
		ensure
			new_array_not_void: Result /= Void
		end

	new_object (nb: INTEGER): JN_OBJECT
			-- New JSON object with `nb` fields
		require
			nb_not_negative: nb >= 0
		local
			i, j: INTEGER
		do
			create Result.make_with_capacity (nb)
			j := object_values.count - nb + 1
			from i := 1 until i > nb loop
				Result.put_value_with_json_name (object_values.item (j), object_keys.item (j))
				j := j + 1
				i := i + 1
			end
			object_values.prune_last (nb)
			object_keys.prune_last (nb)
		ensure
			new_object_not_void: Result /= Void
		end

feature -- Error handling

	report_error (a_message: STRING)
			-- Print error message.
		do
			report_syntax_error (line, column)
		end

feature {NONE} -- Access

	array_values: DS_ARRAYED_LIST [JN_VALUE]
			-- List of array values currently being parsed

	object_values: DS_ARRAYED_LIST [JN_VALUE]
			-- List of object values currently being parsed

	object_keys: DS_ARRAYED_LIST [JN_STRING]
			-- List of object valkeysues currently being parsed

feature {NONE} -- Counters

	counter_value: INTEGER
			-- Value of the last counter registered
		require
			counters_not_empty: not counters.is_empty
		do
			Result := counters.item
		ensure
			value_positive: Result >= 0
		end

	add_counter
			-- Register a new counter.
		do
			counters.force (0)
		ensure
			one_more: counters.count = old counters.count + 1
			value_zero: counter_value = 0
		end

	remove_counter
			-- Unregister last registered counter.
		require
			counters_not_empty: not counters.is_empty
		do
			counters.remove
		ensure
			one_less: counters.count = old counters.count - 1
		end

	increment_counter
			-- Increment `counter_value'.
		require
			counters_not_empty: not counters.is_empty
		local
			a_value: INTEGER
		do
			a_value := counters.item
			counters.replace (a_value + 1)
		ensure
			same_counters_count: counters.count = old counters.count
			one_more: counter_value = old counter_value + 1
		end

	counters: DS_ARRAYED_STACK [INTEGER]
			-- Counters currently in use by the parser
			-- to build lists of AST nodes

feature {NONE} -- Input buffer

	json_buffer: YY_UNICODE_FILE_BUFFER
			-- JSON file input buffer

feature {NONE} -- Constants

	Initial_json_buffer_size: INTEGER = 50000
			-- Initial size for `json_buffer`

	Initial_counters_capacity: INTEGER = 10
			-- Initial capacity for `counters`

	Initial_array_values_capacity: INTEGER = 200
			-- Initial capacity for `array_values`

	Initial_object_values_capacity: INTEGER = 200
			-- Initial capacity for `object_values`

invariant

	counters_not_void: counters /= Void
	array_values_not_void: array_values /= Void
	no_void_array_value: not array_values.has_void
	object_values_not_void: object_values /= Void
	no_void_object_value: not object_values.has_void
	object_keys_not_void: object_keys /= Void
	no_void_key_value: not object_keys.has_void
	object_keys_values_same_count: object_keys.count = object_values.count
	json_buffer_not_void: json_buffer /= Void

end
