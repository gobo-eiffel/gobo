class AA

create

	make

feature

	make
		do
			f (b, d)
		end

	b: BB
		do
			create Result
			print ("Evaluate expression of type BB%N")
		end

	d: DD
		do
			create Result
			print ("Evaluate expression of type DD%N")
		end
		
	f (c: CC; e: EE)
		do
			print ("##%N")
		end
		
end
