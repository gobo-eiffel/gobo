note

	description:

		"Compiled instructions that produce comment output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_COMMENT

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			display, item_type, compute_cardinality
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
		do
			executable := an_executable
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := comment_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:comment")
			std.error.put_string (a_string)
			std.error.put_new_line
			Precursor (a_level + 1)
		end

feature -- Optimization

	type_check (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type checking
		do
			-- TODO: early evaluation when content known statically
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_comment: detachable STRING
			a_string: STRING
			a_comment_marker_index: INTEGER
		do
			check attached a_context.transformer as l_context_transformer then
				a_transformer := l_context_transformer
				expand_children (a_context)
				if attached error_value as l_error_value then
					check is_error: is_error end
					l_error_value.set_location (system_id, line_number)
					a_transformer.report_fatal_error (l_error_value)
				else
					check postcondition_of_expand_children: attached last_string_value as l_last_string_value then
						a_comment := l_last_string_value
						from
						a_comment_marker_index := 1
						until
							a_comment_marker_index = 0
						loop
							a_comment_marker_index := a_comment.substring_index ("--", 1)
							if a_comment_marker_index /= 0 then
								a_string := STRING_.concat (a_comment.substring (1, a_comment_marker_index), " ")
								a_comment := STRING_.appended_string (a_string, a_comment.substring (a_comment_marker_index + 1, a_comment.count))
							end
						end
						if a_comment.count > 0 and then a_comment.item (a_comment.count).is_equal ('-') then
							a_comment := STRING_.appended_string (a_comment, " ")
						end
					end
				end
				if not a_transformer.is_error then
					check
						a_comment /= Void
						attached a_context.current_receiver as l_current_receiver
					then
						l_current_receiver.notify_comment (a_comment, 0)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end

