note

	description:

		"XSLT patterns that matches a particular namespace and node type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NAMESPACE_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			fingerprint, node_kind, is_namespace_test, as_namespace_test
		redefine
			default_priority
		end

	XM_XPATH_NAMESPACE_TEST
		rename
			make as make_xpath
		end

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node_type: INTEGER; a_uri, an_original_text: STRING) is
		require
			static_context_not_void: a_static_context /= Void
			uri_not_void: a_uri /= Void
			original_text_not_void: an_original_text /= Void
		do
			initialize_dependencies
			make_xpath (a_node_type, a_uri, an_original_text)
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
		ensure
			node_kind_set: node_kind = a_node_type
			original_text_set: original_text = an_original_text
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

feature -- Access

		frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
				create Result.make_from_string ("-0.25")
		end

end
	
