class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			f (b)
		end

	f (b: separate BB)
		do
			b.g
			b.h
			print ("Passed")
		end

end
