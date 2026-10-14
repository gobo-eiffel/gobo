class AA

create

	make,
	make_separate

feature

	make
		local
			b: separate BB
			a: separate AA
		do
			create b.make
			create a.make_separate
		end

	make_separate
		local
			b: separate BB
		do
			create b.make
			print ("Passed%N")
		end

end
