indexing

	description:

		"XSLT patterns that test for a match against nodes with a specific  content-type"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CONTENT_TYPE_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			is_content_test, as_content_test, node_kind, content_type
		redefine
			default_priority, match
		end
	
	XM_XPATH_CONTENT_TYPE_TEST
		rename
			make as make_xpath
		end

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node_kind: INTEGER; a_type: XM_XPATH_SCHEMA_TYPE) is
			-- Establish invariant
		require
			static_context_not_void: a_static_context /= Void
			valid_node_type: a_node_kind = Element_node or else a_node_kind = Attribute_node
			valid_type: a_type /= Void
		do
			initialize_dependencies
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
			make_xpath (a_node_kind, a_type)
		end

feature -- Access

		frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			create Result.make_from_string ("0.0")
		end

feature -- Matching

	frozen match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Determine whether this Pattern matches the given Node;
		do
			internal_last_match_result := matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation) 
		end

end
