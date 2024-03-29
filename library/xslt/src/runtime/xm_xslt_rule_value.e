﻿note

	description:

		"Objects that can be returned from {XM_XSLT_MODE}.last_matched_rule"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2017, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_RULE_VALUE

create

	make, make_boolean

feature {NONE} -- Initialization

	make (a_template: XM_XSLT_COMPILED_TEMPLATE)
			-- Create a template rule.
		require
			template_not_void: a_template /= Void
		do
			is_template := True
			template_value := a_template
		ensure
			template_set: is_template and then template_value = a_template
		end

	make_boolean (a_boolean: BOOLEAN)
			-- Create a boolean rule
		do
			is_boolean := True
			boolean_value := a_boolean
		ensure
			boolean_set: is_boolean and then boolean_value = a_boolean
		end

feature -- Access

	as_boolean: BOOLEAN
			-- Value as a `BOOLEAN'
		require
			is_boolean: is_boolean
		do
			Result := boolean_value
		end

	as_template: XM_XSLT_COMPILED_TEMPLATE
			-- Value as an `XM_XSLT_COMPILED_TEMPLATE'
		require
			is_template: is_template
		do
			check is_template: attached template_value as l_template_value then
				Result := l_template_value
			end
		end

feature -- Status report

	is_boolean: BOOLEAN
			-- Is `Current' a `BOOLEAN'?

	is_template: BOOLEAN
			-- Is `Current' an `XM_XSLT_COMPILED_TEMPLATE'?

feature {XM_XSLT_MODE} -- Debugging and implementation

	template_value: detachable XM_XSLT_COMPILED_TEMPLATE
			-- Template value

feature {NONE} -- Implementation

	boolean_value: BOOLEAN
			-- Boolean value

invariant

	boolean_or_template: is_boolean xor is_template
	template: is_template implies template_value /= Void

end

