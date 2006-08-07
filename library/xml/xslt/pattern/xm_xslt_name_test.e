indexing

	description:

		"XSLT patterns that matches a particular name and node type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NAME_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			fingerprint, node_kind, constraining_node_names, is_name_test, as_name_test
		redefine
			default_priority
		end

	XM_XPATH_NAME_TEST
		rename
			make as make_xpath,
			make_same_type as make_same_type_xpath
		end

create

	make, make_same_type, make_without_location

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node_type: INTEGER; a_name_code: INTEGER; an_original_text: STRING) is
			-- Create from name and type.
		require
			static_context_not_void: a_static_context /= Void
			valid_node_type: is_node_type (a_node_type)
			positive_name_code: a_name_code >= 0
			original_text_not_void: an_original_text /= Void
		do
			initialize_dependencies
			make_xpath (a_node_type, a_name_code, an_original_text)
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
		ensure
			node_kind_set: node_kind = a_node_type
			original_text_set: original_text = an_original_text
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

	make_same_type (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node: XM_XPATH_NODE) is
			-- Create like `a_node'. 
		require
			static_context_not_void: a_static_context /= Void
			node_not_void: a_node /= Void
		do
			make_same_type_xpath (a_node)
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
		ensure
			same_type: node_kind = a_node.node_type
			same_fingerprint: fingerprint = a_node.fingerprint
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

	make_without_location (a_node: XM_XPATH_NODE) is
			-- Create  like `a_node', without location.
		require
			node_not_void: a_node /= Void
		do
			make_same_type_xpath (a_node)
			system_id := ""
			line_number := 0
		ensure
			same_type: node_kind = a_node.node_type
			same_fingerprint: fingerprint = a_node.fingerprint
		end
	
feature -- Access

		frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
				create Result.make_zero
		end

end
	
