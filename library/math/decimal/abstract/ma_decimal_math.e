indexing
	description:

		"Access to decimal math constants and shared context"
	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"

class MA_DECIMAL_MATH

inherit

	MA_SHARED_DECIMAL_CONTEXT

feature -- Access

	zero : MA_DECIMAL is
		once
			create Result.make (1)
			Result := Result.zero
		end
		
	negative_zero : MA_DECIMAL is
		once
			Result := zero.negative_zero
		end
		
	one : MA_DECIMAL is
		once
			Result := zero.one
		end
		
	minus_one : MA_DECIMAL is
		once
			Result := zero.minus_one
		end
	
	infinity : MA_DECIMAL is
		once
			Result := zero.infinity
		end
		
	negative_infinity :  MA_DECIMAL is
		once
			Result := zero.negative_infinity
		end

	not_a_number : MA_DECIMAL is
		once
			Result := zero.nan
		end
		
	signaling_not_a_number : MA_DECIMAL is
		once
			Result := zero.snan
		end
		
end
