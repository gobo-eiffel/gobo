class AA

create

	make

feature

	make
		local
			b: separate BB
		do
			create b.make (Current)
			print ("Before AA.f%N")
			f (b)
			print ("After AA.f%N")
			{SCHEDULER}.set_value (1)
		end

	f (b: separate BB)
		do
			b.g
		end

	h
		do
			{SCHEDULER}.wait_for_value (2)
			print ("End of AA.h%N")
		end

end
