indexing

	description:

		"Compiled instructions that produce comment output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_COMMENT

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			display
		end
		
	XM_XPATH_SHARED_NODE_KIND_TESTS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			instruction_name := "comment"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := comment_node_kind_test
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "comment")
			std.error.put_string (a_string)
			std.error.put_new_line
			Precursor (a_level + 1, a_pool)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := False
			todo ("same_expression", True)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		do
			do_nothing
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

end
	
