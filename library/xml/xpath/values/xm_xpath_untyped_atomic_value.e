indexing

	description:

		"XPath untyped atomic values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNTYPED_ATOMIC_VALUE

inherit

	XM_XPATH_STRING_VALUE
		redefine
			display
		end

	-- N.B. Inheritance from XM_XPATH_STRING_VALUE is an implementation convenience;
	-- xdt:untypedAtomic is NOT a sub-type of xs:integer
	-- TODO - factor out the common implementation (all of string-value??) to tremove the sub-typing relationship
	
creation

	make

feature -- Comparison

	three_way_comparison_using_collator (an_atomic_value: XM_XPATH_ATOMIC_VALUE; a_collator: ST_COLLATOR): INTEGER is
			-- Comparison with `an_atomic_value'
		require
			atomic_value_valid: an_atomic_value /= Void -- and then is_comparable
		do
			-- TODO
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end
			
feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "untyped (%"")
			a_string := STRING_.appended_string (a_string, value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end
	
end
