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
			display, item_type
		end
		
	XM_XPATH_SHARED_NODE_KIND_TESTS

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE) is
			-- Establish invariant.
		do
			executable := an_executable
			instruction_name := "comment"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
		ensure
			executable_set: executable = an_executable
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

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "comment")
			std.error.put_string (a_string)
			std.error.put_new_line
			Precursor (a_level + 1)
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

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_comment, a_string: STRING
			a_comment_marker_index: INTEGER
		do
			a_transformer := a_context.transformer
			a_comment := expanded_string_value (a_context)
			from
				a_comment_marker_index := 1
			until
				a_comment_marker_index = 0
			loop
				a_comment_marker_index := a_comment.substring_index ("--", 1)
				if a_comment_marker_index /= 0 then
					report_recoverable_error (Current, "Invalid characters (--) in comment", a_transformer)
					a_string := STRING_.concat (a_comment.substring (1, a_comment_marker_index), " ")
					a_comment := STRING_.appended_string (a_string, a_comment.substring (a_comment_marker_index + 1, a_comment.count))
				end
			end
			if a_comment.count > 0 and then a_comment.item (a_comment.count).is_equal ('-') then
				report_recoverable_error (Current, "Invalid character (-) at end of comment", a_transformer)
				a_comment := STRING_.appended_string (a_comment, " ")
			end
			if not a_transformer.is_error then
				a_transformer.current_receiver.notify_comment (a_comment, 0)
			end
			last_tail_call := Void
		end

end
	
