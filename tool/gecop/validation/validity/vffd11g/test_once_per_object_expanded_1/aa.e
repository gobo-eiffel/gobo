class AA

create

	make,
	make_separate

feature

	make
		local
			b: BB
			a: separate AA
		do
			b := f
			create a.make_separate
		end

	make_separate
		local
			b: BB
		do
			b := f
			print ("Passed")
		end

	f: BB
		once ("OBJECT")
			Result.set_name ("gobo")
		end

end
