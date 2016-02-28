note

	description:

		"XSLT patterns that combine two node tests with a set operator"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMBINED_NODE_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			constraining_node_names, is_at_most_one_name_constraint, content_type,
			is_combined_node_test, as_combined_node_test
		redefine
			default_priority, match
		end

	XM_XPATH_COMBINED_NODE_TEST
		rename
			make as make_xpath
		end

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node_test: XM_XPATH_NODE_TEST; a_operator: INTEGER; a_other_node_test: XM_XPATH_NODE_TEST)
			-- Establish invariant
		require
			static_context_not_void: a_static_context /= Void
			node_test_one_not_void: a_node_test /= Void
			node_test_two_not_void: a_other_node_test /= Void
			set_operation: a_operator = Union_token or else a_operator = Intersect_token or else a_operator = Except_token
		do
			initialize_dependencies
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
			make_xpath (a_node_test, a_operator, a_other_node_test)
		end

feature -- Access

		frozen default_priority: MA_DECIMAL
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			create Result.make_from_string ("0.25")
		end

feature -- Matching

	frozen match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Determine whether this Pattern matches the given Node;
		do
			internal_last_match_result := matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation)
		end

end
