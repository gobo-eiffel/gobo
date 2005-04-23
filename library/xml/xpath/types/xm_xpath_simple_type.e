indexing

	description:

		"Objects that represent a descendant of xs:anySimpleType"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SIMPLE_TYPE
	
inherit
	
	XM_XPATH_SCHEMA_TYPE
		redefine
			is_simple_type, as_simple_type
		end

feature -- Access

	common_atomic_type: XM_XPATH_ATOMIC_TYPE is
			-- Lowest common super-type
		deferred
		ensure
			result_not_void: Result /= Void
		end

	is_simple_type: BOOLEAN is
			-- Is `Current' a simple type?
		do
			Result := True
		end

	as_simple_type: XM_XPATH_SIMPLE_TYPE is
			-- `Current' seen as a simple type
		do
			Result := Current
		end
	
end
