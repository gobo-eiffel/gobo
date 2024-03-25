class AA

create

	make,
	make_separate

feature

	make
		local
			s: separate STRING
			a: separate AA
		do
			s := f
			create a.make_separate
		end

	make_separate
		local
			s: separate STRING
		do
			s := f
			print ("Passed")
		end

	f: separate STRING
		once ("PROCESS")
			Result := "gobo"
		end

end
