note

	description:

		"Eiffel type parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_TYPE_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton,
			parse as yyparse
		redefine
			report_error
		end

	ET_TYPE_SCANNER_SKELETON
		rename
			make as make_type_scanner
		redefine
			reset, set_syntax_error,
			system_processor
		end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new type parser.
		do
			system_processor := a_system_processor
			create counters.make (Initial_counters_capacity)
			create last_symbols.make (Initial_last_symbols_capacity)
			make_type_scanner ("unknown file", a_system_processor)
			make_parser_skeleton
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			precursor
			counters.wipe_out
			last_symbols.wipe_out
		end

feature -- Access

	last_type: detachable ET_TYPE
			-- Last type parsed

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Parsing

	parse_type (a_string: STRING; a_system: ET_SYSTEM)
			-- Parse `a_string'.
			-- Make resulting type available in `last_type',
			-- or set `has_fatal_error' in case of a syntax error.
		require
			a_string_not_void: a_string /= Void
			a_system_not_void: a_system /= Void
		local
			l_buffer: YY_UNICODE_BUFFER
			old_system: like current_system
		do
			old_system := current_system
			current_system := a_system
			last_type := Void
			set_fatal_error (False)
			create l_buffer.make (a_string)
			input_buffer := l_buffer
			yy_load_input_buffer
			yyparse
			reset
			current_system := old_system
		rescue
			reset
		end

feature {NONE} -- Basic operations

	add_to_actual_parameter_list (a_parameter: detachable ET_ACTUAL_PARAMETER_ITEM; a_list: detachable ET_ACTUAL_PARAMETER_LIST)
			-- Add `a_parameter' at the beginning of `a_list'.
		do
			if a_list /= Void and a_parameter /= Void then
				a_list.put_first (a_parameter)
			end
		end

feature {NONE} -- AST factory

	new_dot_feature_name (a_dot: detachable ET_SYMBOL; a_name: detachable ET_IDENTIFIER): detachable ET_QUALIFIED_FEATURE_NAME
			-- New dot-feature_name
		do
			if a_name /= Void then
				a_name.set_feature_name (True)
			end
			Result := ast_factory.new_dot_feature_name (a_dot, a_name)
		end

	new_like_feature (a_type_mark: detachable ET_TYPE_MARK; a_like: detachable ET_KEYWORD;
		a_name: detachable ET_IDENTIFIER): detachable ET_LIKE_FEATURE
			-- New 'like name' type
		do
			if a_name /= Void then
				a_name.set_feature_name (True)
			end
			Result := ast_factory.new_like_feature (a_type_mark, a_like, a_name)
		end

	new_named_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER;
		a_generics: detachable ET_ACTUAL_PARAMETER_LIST): detachable ET_TYPE
			-- New Eiffel class type or formal generic paramater
		local
			l_class: ET_MASTER_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			if a_name /= Void then
				l_class := current_universe.master_class (a_name)
				l_class.set_marked (True)
				l_type_mark := a_type_mark
				if l_type_mark = Void then
					l_type_mark := current_universe.implicit_attachment_type_mark
				elseif attached {ET_KEYWORD} l_type_mark as l_keyword and then l_keyword.is_separate then
					l_type_mark := ast_factory.new_attachment_mark_separate_keyword (current_universe.implicit_attachment_type_mark, l_keyword)
				end
				if a_generics /= Void then
					Result := ast_factory.new_generic_class_type (l_type_mark, a_name, a_generics, l_class)
				else
					Result := ast_factory.new_class_type (l_type_mark, a_name, l_class)
				end
			end
		end

	new_tuple_type (a_type_mark: detachable ET_TYPE_MARK; a_tuple: detachable ET_IDENTIFIER;
		a_generics: detachable ET_ACTUAL_PARAMETER_LIST): detachable ET_TUPLE_TYPE
			-- New 'TUPLE' type
		local
			a_class: ET_MASTER_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			if a_tuple /= Void then
				a_class := current_universe.master_class (a_tuple)
				a_class.set_marked (True)
				l_type_mark := a_type_mark
				if l_type_mark = Void then
					l_type_mark := current_universe.implicit_attachment_type_mark
				elseif attached {ET_KEYWORD} l_type_mark as l_keyword and then l_keyword.is_separate then
					l_type_mark := ast_factory.new_attachment_mark_separate_keyword (current_universe.implicit_attachment_type_mark, l_keyword)
				end
				Result := ast_factory.new_tuple_type (l_type_mark, a_tuple, a_generics, a_class)
			end
		end

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error been reported?

	report_error (a_message: STRING)
			-- Print error message.
		do
			report_syntax_error (current_position)
		end

	set_syntax_error
			-- Set fatal error.
		do
			set_fatal_error (True)
		end

	set_fatal_error (b: BOOLEAN)
			-- Set fatal error.
		do
			has_fatal_error := b
		ensure
			fatal_error_set: has_fatal_error = b
		end

feature {NONE} -- Last symbol

	last_symbol: detachable ET_SYMBOL
			-- Last symbol read
		require
			last_symbols_not_empty: not last_symbols.is_empty
		do
			Result := last_symbols.item
		end

	add_symbol (a_symbol: detachable ET_SYMBOL)
			-- Add `a_symbol' to `last_symbols'.
		do
			last_symbols.force (a_symbol)
		ensure
			one_more: last_symbols.count = old last_symbols.count + 1
			keyword_added: last_symbol = a_symbol
		end

	remove_symbol
			-- Remove `last_symbol' from `last_symbols'.
		require
			last_symbols_not_empty: not last_symbols.is_empty
		do
			last_symbols.remove
		ensure
			one_less: last_symbols.count = old last_symbols.count - 1
		end

	last_symbols: DS_ARRAYED_STACK [detachable ET_SYMBOL]
			-- Last symbols read

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

feature {NONE} -- Constants

	Initial_counters_capacity: INTEGER = 10
			-- Initial capacity for `counters'

	Initial_last_symbols_capacity: INTEGER = 5
			-- Initial capacity for `last_symbols'

invariant

	counters_not_void: counters /= Void
	last_symbols_not_void: last_symbols /= Void

end
