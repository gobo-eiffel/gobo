indexing
	description:

		"Constants for the EDA library"

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"

class MA_DECIMAL_CONSTANTS

inherit

	KL_SHARED_PLATFORM
		export
			{NONE} all
		end
		
feature -- Constants

  	Round_up : INTEGER is 0 
		-- Rounding mode to round away from zero
		-- If any of the discarded digits are non-zero then the result will be rounded up (away from zero)

	Round_down : INTEGER is 1
		-- Rounding mode to round towards zero
		-- If any of the discarded digits are non-zero then the result should be rounded towards the next ore negative digit
	
	Round_ceiling : INTEGER is 2
		-- Rounding mode to round to a more positive number
		-- All discarded digits are ignored (truncated).  The result is neither incremented nor decremented
		
	Round_floor : INTEGER is 3
		-- Rounding mode to round to a more negative number
		-- If any of the discarded digits are non-zero then the result should be rounded towards the next more negative digit
 
 	Round_half_up : INTEGER is 4
  		-- Rounding mode to round to nearest neighbor, where an equidistant value is rounded up
  		-- If the discarded digits represent greater than or equal to half (0.5 times) the value
		-- of a one in the next position then the result should be rounded up (away from zero).
		-- Otherwise the discarded digits are ignored.

 	Round_half_down : INTEGER is 5 
	 	-- Rounding mode to round to nearest neighbor, where an equidistant value is rounded down.
		-- If the discarded digits represent greater than half (0.5 times)
  		-- the value of a one in the next position then the result should be
 		-- rounded up (away from zero).  Otherwise the discarded digits are ignored.
 	
 	Round_half_even : INTEGER is 6
 		-- Rounding mode to round to nearest neighbor, where an equidistant value is rounded to the nearest even neighbor.
		-- If the discarded digits represent greater than half (0.5 times) the value of a one in the next position then the result should be
 		-- rounded up (away from zero).  
 		-- If they represent less than half, then the result should be rounded down.
		-- Otherwise (they represent exactly half) the result is rounded down if its rightmost digit is even, or rounded up if its
 		-- rightmost digit is odd (to make an even digit).
  
	Round_unnecessary : INTEGER is 7 
 		-- Rounding mode to assert that no rounding is necessary.
 		-- Rounding (potential loss of information) is not permitted.
 		-- If any of the discarded digits are non-zero then an 'ArithmeticException'should be thrown.
  
  	Signal_division_by_zero : INTEGER is 1
  		-- Non Zero dividend is divided by zero
		
  	Signal_inexact : INTEGER is 2
  		-- A result is not exact, or overflows or underflows without being trapped
  		
  	Signal_invalid_operation : INTEGER is 3
  		-- A result would be undefined or impossible
  		
  	Signal_lost_digits : INTEGER is 4
  		-- Non-zero digits have been discarded before an operation.
  		
  	Signal_overflow : INTEGER is 5
  		-- The exponent of a result is too large to be represented
  		
  	Signal_rounded : INTEGER is 6
  		-- A result has been rounded, that is, some zero or non-zero digits were discarded.
  		
  	Signal_underflow : INTEGER is 7
  		-- The exponent of a result is too small to be represented
  	
  	Signal_subnormal : INTEGER is 8
  	
  	Minimum_digits : INTEGER is 0
 	Maximum_digits : INTEGER is 999_999_999

	Default_digits : INTEGER is 9

	Default_traps : ARRAY[INTEGER] is 
		once 
			Result := <<
			  	Signal_division_by_zero,	  		
			  	Signal_invalid_operation ,	  		
			  	Signal_overflow,
			  	Signal_underflow >>	
		end
		
	Default_rounding_mode : INTEGER is once Result := Round_half_up end

	Special_none : INTEGER is 0
	Special_infinity : INTEGER is 1
	Special_signaling_nan : INTEGER is 2
	Special_quiet_nan : INTEGER is 3

	 Minimum_exponent : INTEGER is -999_999_999 
	 	-- minimum exponent allowed
	 	
	 Maximum_exponent : INTEGER is 999_999_999
	 	-- maximum exponent allowed
	 	
	 Minimum_integer_as_decimal : MA_DECIMAL is
	 		-- Minimum value convertible to integer
	 	once
	 		!!Result.make_from_integer(Platform.Minimum_integer)
	 	end
	 	
	 Maximum_integer_as_decimal : MA_DECIMAL is
	 		-- Maximum value convertible to integer
	 	once
	 		!!Result.make_from_integer (Platform.Maximum_integer)
	 	end
	 	
end


