class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create <NONE> b.make
			print ("Before AA.f%N")
			f (b)
			print ("After AA.f%N")
		end

	f (b: separate BB)
		local
			i: INTEGER
		do
			i := b.g
		end

end
