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
			b.g (Current)
		end

	h
		do
			{EXECUTION_ENVIRONMENT}.sleep (1_000_000_000)
			print ("End of AA.h%N")
		end

end
