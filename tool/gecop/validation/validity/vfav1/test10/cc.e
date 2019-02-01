class CC

feature

	f (i: INTEGER): INTEGER
		do
			print ("Failed")
			Result := i
		end

	infix "+" (i: INTEGER): INTEGER
		do
			print ("Failed")
			Result := i
		end
		
end
