indexing

	description:

		"XSLT expression contexts"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EXPRESSION_CONTEXT

inherit

	XM_XPATH_STATIC_CONTEXT

feature -- Access

	style_element: XM_XSLT_STYLE_ELEMENT is
			-- TODO
		do
				todo ("style-element", False)
		end

	
	default_element_namespace: INTEGER is
			-- Default XPath namespace, as a namespace code that can be looked up in `name_pool'
		do
			todo ("default-element-namespace", False)
		end

	default_collation_name: STRING
			-- URI naming the default collation

	collator (a_collation_name: STRING): ST_COLLATOR is
			-- Collation named `a_collation_name'
		do
			todo ("collator", False)
		end

	uri_for_prefix (an_xml_prefix: STRING): STRING is
			-- URI for a namespace prefix
		do
			todo ("uri-for-prefix", False)
		end

		is_backwards_compatible_mode: BOOLEAN
			-- Is Backwards Compatible Mode used?

feature -- Status report

	is_declared_prefix (an_xml_prefix: STRING): BOOLEAN is
			-- Is `an_xml_prefix' allocated to a namespace?
		do
			todo ("is-declared-prefix", False)
		end

feature -- Element change
	
	bind_variable (a_fingerprint: INTEGER) is
			-- Bind variable to it's declaration.
		do
			todo ("bind-variable", False)
		end

	bind_function (a_qname: STRING; arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Identify a function appearing in an expression.
		do
			todo ("bind-function", False)
		end

feature -- Output

	issue_warning (a_warning: STRING) is
			-- Issue a warning message
		do
			todo ("issue-warning", False)
		end

feature {NONE} -- Implementation

	todo (a_routine_name: STRING; is_partially_done: BOOLEAN) is
			-- Write a TODO message.
		require
			routine_name_not_void: a_routine_name /= Void and then a_routine_name.count > 2
		do
			std.error.put_string ("TODO: {")
			std.error.put_string (generating_type)
			std.error.put_string ("}.")
			std.error.put_string (a_routine_name)
			if is_partially_done then
				std.error.put_string (" is only partly written")
			else
				std.error.put_string (" needs to be written")
			end
			std.error.put_new_line
		end

end

