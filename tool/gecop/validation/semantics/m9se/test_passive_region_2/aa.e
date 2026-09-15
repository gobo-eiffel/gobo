class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create <NONE> b.make
			print ("Calling AA.f%N")
			f (b)
		end

	f (b: separate BB)
		do
			print ("AA.f%N")
			b.g
			print ("Failed")
		end

end
