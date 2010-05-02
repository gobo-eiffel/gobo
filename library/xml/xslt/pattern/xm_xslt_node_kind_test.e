note

	description:

		"XSLT patterns that matches a particular node kind"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NODE_KIND_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			node_kind, content_type, is_node_kind_test, as_node_kind_test
		redefine
			default_priority
		end

	XM_XPATH_NODE_KIND_TEST
		rename
			make as make_xpath
		end

create

	make, make_without_location

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT; a_node_type: INTEGER)
			-- Make with location.
		require
			valid_node_type: is_node_type (a_node_type) and then a_node_type /= Any_node
			static_context_not_void: a_static_context /= Void
		do
			initialize_dependencies
			make_xpath (a_node_type)
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
		ensure
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
		end

	make_without_location (a_node_type: INTEGER)
			-- Make without location.
		require
			valid_node_type: is_node_type (a_node_type) and then a_node_type /= Any_node
		do
			make_xpath (a_node_type)
			system_id := ""
			line_number := 0
		end

feature -- Access

		frozen default_priority: MA_DECIMAL
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			create Result.make_from_string ("-0.5")
		end

end

