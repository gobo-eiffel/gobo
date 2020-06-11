class BB

feature

	f
		once ("OBJECT")
			print ("Calling f%N")
		end

	g
		do
			print ("Calling g%N")
		end
		
end
