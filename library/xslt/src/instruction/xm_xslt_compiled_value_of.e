note

	description:

		"Compiled xsl:value-of elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_COMPILED_VALUE_OF

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			display, evaluate_item, item_type,
			compute_cardinality, is_value_of
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: detachable XM_XPATH_EXPRESSION; disabled: BOOLEAN; a_module_number, a_line_number: INTEGER)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
		local
			is_special: BOOLEAN
			a_string: STRING
			an_index, a_count: INTEGER
			a_code: NATURAL_32
		do
			set_source_location (a_module_number, a_line_number)
			executable := an_executable
			select_expression := a_select_expression
			is_special := True
			if attached {XM_XPATH_STRING_VALUE} select_expression as a_string_value then
				instruction_name := "xsl:text"
				from
					is_special := False
					a_string := a_string_value.string_value
					an_index := 1; a_count := a_string.count
				until
					is_special or else an_index > a_count
				loop
					a_code := a_string.code (an_index)
					if a_code < 33 or else a_code > 126
						or else a_code = 60 or else a_code = 62 or else a_code = 38 then
						-- <, > or &
						is_special := True
					end
					an_index := an_index + 1
				end
				if not is_special then
					receiver_options := No_special_characters
				end
			else
				instruction_name := "xsl:value-of"
			end
			if a_select_expression /= Void then
				adopt_child_expression (a_select_expression)
			end
			if disabled then
				if	not is_special then
					receiver_options := Disable_escaping + No_special_characters
				else
					receiver_options := Disable_escaping
				end
			end
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			select_set: select_expression = a_select_expression
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := text_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_value_of: BOOLEAN
			-- Is `Current' an `XM_XSLT_COMPILED_VALUE_OF'?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), instruction_name)
			std.error.put_string (a_string)
			std.error.put_new_line
			check
				select_expression_not_void: attached select_expression as l_select_expression
				-- Compiling ensures this
			then
				l_select_expression.display (a_level + 1)
			end
		end

feature -- Optimization

	type_check (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type checking
		do
			-- do nothing
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_orphan: XM_XPATH_ORPHAN
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context
				-- This is XSLT
			then
				expand_children (l_evaluation_context)
				if not attached error_value as l_error_value then
					check not_is_error: not is_error end
					check postcondition_of_expand_children: attached last_string_value as l_last_string_value then
						create l_orphan.make (Text_node, l_last_string_value)
						a_result.put (l_orphan)
					end
				else
					conditionally_set_error_location
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
				end
			end
		end

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			expand_children (a_context)
			if attached error_value as l_error_value then
				check is_error: is_error end
				conditionally_set_error_location
				check
					attached a_context.transformer as l_context_transformer
					attached a_context.current_receiver as l_context_current_receiver
				then
					l_context_transformer.report_recoverable_error (l_error_value)
					l_context_current_receiver.on_error (l_error_value.error_message)
				end
			else
				check
					attached a_context.current_receiver as l_context_current_receiver
					postcondition_of_expand_children: attached last_string_value as l_last_string_value
				then
					l_context_current_receiver.notify_characters (STRING_.cloned_string (l_last_string_value), receiver_options)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	receiver_options: INTEGER
			-- Receiver options

end

