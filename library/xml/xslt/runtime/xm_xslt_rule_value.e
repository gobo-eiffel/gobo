indexing

	description:

		"Objects that can be returned from {XM_XSLT_MODE}.rule"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_RULE_VALUE

create

	make, make_boolean

feature {NONE} -- Initialization

	make (a_template: XM_XSLT_COMPILED_TEMPLATE) is
			-- Create a template rule.
		require
			template_not_void: a_template /= Void
		do
			is_template := True
			template_value := a_template
		ensure
			template_set: is_template and then template_value = a_template
		end

	make_boolean (a_boolean: BOOLEAN) is
			-- Create a boolean rule
		do
			is_boolean := True
			boolean_value := a_boolean
		ensure
			boolean_set: is_boolean and then boolean_value = a_boolean
		end

feature -- Access

	as_boolean: BOOLEAN is
			-- Value as a `BOOLEAN'
		require
			is_boolean: is_boolean
		do
			Result := boolean_value
		end

	as_template: XM_XSLT_COMPILED_TEMPLATE is
			-- Value as an `XM_XSLT_COMPILED_TEMPLATE'
		require
			is_template: is_template
		do
			Result := template_value
		end

feature -- Status report

	is_boolean: BOOLEAN
			-- Is `Current' a `BOOLEAN'?

	is_template: BOOLEAN
			-- Is `Current' an `XM_XSLT_COMPILED_TEMPLATE'?

feature {NONE} -- Implementation

	template_value: XM_XSLT_COMPILED_TEMPLATE
			-- Template value

	boolean_value: BOOLEAN
			-- Boolean value

invariant

	boolean_or_template: is_boolean xor is_template
	template: is_template implies template_value /= Void

end
	
