indexing

	description:

		"Compiled xsl:value-of elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_VALUE_OF

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			display, evaluate_item, item_type,
			compute_cardinality
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; disabled: BOOLEAN) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do
			executable := an_executable
			select_expression := a_select_expression; adopt_child_expression (select_expression)
			a_string_value ?= select_expression
			if a_string_value /= Void then
				instruction_name := "xsl:text"
			else
				instruction_name := "xsl:value-of"
			end
			if disabled then
				receiver_options := Disable_escaping
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
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := text_node_kind_test
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), instruction_name)
			std.error.put_string (a_string)
			std.error.put_new_line
			select_expression.display (a_level + 1)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		do
			-- do nothing
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			an_orphan: XM_XPATH_ORPHAN
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- This is XSLT
			end
			expand_children (an_evaluation_context)
			if not is_error then
				create an_orphan.make (Text_node, last_string_value)
				last_evaluated_item := an_orphan
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (error_value)
			end
		end

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			expand_children (a_context)
			if is_error then
				a_context.current_receiver.on_error (error_value.error_message)
			else
				a_context.current_receiver.notify_characters (last_string_value, receiver_options)
			end
			last_tail_call := Void
		end

feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	receiver_options: INTEGER
			-- Receiver options

end
	
