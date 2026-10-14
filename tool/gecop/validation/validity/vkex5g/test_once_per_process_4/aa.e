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
			b := {separate BB}.make
			create a.make_separate
		end

	make_separate
		local
			b: separate BB
		do
			b := {separate BB}.make
			print ("Passed%N")
		end

end
