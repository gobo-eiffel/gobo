indexing
	description: "Information about integer, natural and real type in Eiffel"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	NUMERIC_INFORMATION

feature -- Types

	max_integer_type: INTEGER_64
			-- INTEGER type of max word length
			
	max_natural_type: NATURAL_64
			-- NATURAL type of max word length
			
	type_count: INTEGER is 4
			-- Number of types of integer/natural in Eiffel
	
	type_no_limitation: INTEGER is 0
			-- Type representing a number sequence (no length limitation)

	type_integer_natural_separator: INTEGER is 10
			
	type_integer_8:  INTEGER is 1
	type_integer_16: INTEGER is 2
	type_integer, type_integer_32: INTEGER is 3
	type_integer_64: INTEGER is 4	

	type_natural_8: INTEGER is 11
	type_natural_16: INTEGER is 12
	type_natural, type_natural_32: INTEGER is 13
	type_natural_64: INTEGER is 14
			-- Integer/natural type indicators
			
	type_real: INTEGER is 100
	type_double: INTEGER is 101
			-- Real/Double type indicators
	
feature -- Type checking

	integer_type_valid (type: INTEGER): BOOLEAN is
			-- Is `type' a valid integer type?
		do
			Result := (type = type_integer_8) or
					  (type = type_integer_16) or
					  (type = type_integer_32) or
					  (type = type_integer_64)
		end
		
	natural_type_valid (type: INTEGER): BOOLEAN is
			-- Is `type' a valid natural type?
		do
			Result := (type = type_natural_8) or
					  (type = type_natural_16) or
					  (type = type_natural_32) or
					  (type = type_natural_64)			
		end
		
	integer_natural_type_valid (type: INTEGER): BOOLEAN is
			-- Is `type' a valid integer/natural type?
		do
			Result := (type = type_no_limitation) or
					  (type = type_integer_8) or
					  (type = type_integer_16) or
					  (type = type_integer_32) or
					  (type = type_integer_64) or
					  (type = type_natural_8) or
					  (type = type_natural_16) or
					  (type = type_natural_32) or
					  (type = type_natural_64)					  
		end
		
	real_double_type_valid (type: INTEGER): BOOLEAN is
			-- Is `type' a valid real/double type?
		do
			Result := (type = type_no_limitation) or
					  (type = type_real) or
					  (type = type_double)	
		end
	
	read_type_valid (type: INTEGER): BOOLEAN is
			-- Is `type' a valid real type?
		do
			Result := (type = type_real)
		end
		
	double_type_valid (type: INTEGER): BOOLEAN is
			-- Is `type' a valid double type?
		do
			Result := (type = type_double)
		end		
		
end
