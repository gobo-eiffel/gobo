class XM_STRING_SOURCE

inherit
	XM_SOURCE
		redefine
			out
		end
		
feature -- Out

	out: STRING is 
			-- STRING.
		do	
			Result := "STRING" 
		end
	
end
