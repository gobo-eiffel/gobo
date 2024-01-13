class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make
			print ("Before AA.f%N")
			f (b)
			print ("After AA.f%N")
		end

	f (b: separate BB)
		do
			b.g
		end

end
