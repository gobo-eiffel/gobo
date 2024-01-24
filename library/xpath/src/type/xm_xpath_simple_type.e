note

	description:

		"Objects that represent a descendant of xs:anySimpleType"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_SIMPLE_TYPE

inherit

	XM_XPATH_SCHEMA_TYPE
		redefine
			is_simple_type, as_simple_type
		end

feature -- Access

	common_atomic_type: XM_XPATH_ATOMIC_TYPE
			-- Lowest common super-type
		deferred
		ensure
			result_not_void: Result /= Void
		end

	is_simple_type: BOOLEAN
			-- Is `Current' a simple type?
		do
			Result := True
		end

	as_simple_type: XM_XPATH_SIMPLE_TYPE
			-- `Current' seen as a simple type
		do
			Result := Current
		end

end
