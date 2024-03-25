class AA

create

	make,
	make_separate

feature

	make
		local
			s: STRING
			a: separate AA
		do
			s := f
			create a.make_separate
		end

	make_separate
		local
			s: STRING
		do
			s := f
			print ("Failed")
		end

	f: STRING
		once ("PROCESS")
			Result := "gobo"
		end

end
