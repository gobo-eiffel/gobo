indexing

	description:

		"Decimal number parsers"

	library: "GOBO Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"

deferred class MA_DECIMAL_PARSER
	
feature -- Access		
	
	last_decimal : MA_DECIMAL
	
feature -- Status report
		
 	error : BOOLEAN is
 			-- Has an error occured during the last `parse'
 		deferred
 		end
			
feature -- Basic operations

	parse (string : STRING) is
		require
			string_exists: string /= Void
		deferred
		ensure
			last_decimal_not_void_when_no_error: not error implies last_decimal /= Void
		end

feature {NONE} -- Implementation

end


