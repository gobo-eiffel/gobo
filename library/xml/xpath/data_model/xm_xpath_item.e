indexing

	description:

		"XPath item - a member of a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ITEM

inherit

	XM_XPATH_TYPE

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		deferred
		ensure
			string_value_not_void: Result /= Void
		end

	item_type: INTEGER is
			-- Type;
			-- This will be a value such as Element_node or Integer_type
		deferred
		ensure
			Result > 0 implies is_valid_type (Result)
		end
	
	typed_value: XM_XPATH_VALUE is
			-- Typed value
		deferred
		ensure
			typed_value_not_void: Result /= Void
		end

feature -- Conversion
	
	as_value: XM_XPATH_VALUE is
			-- Convert to a value
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_node: XM_XPATH_NODE
		do
			an_atomic_value ?= Current
			if an_atomic_value /= Void then
				Result := an_atomic_value
			else
				a_node ?= Current
				if a_node /= Void then
					create {XM_XPATH_SINGLETON_NODE} Result.make (a_node)
				end
			end
		end

end
	
