class AA

inherit

	ISE_SCOOP_RUNTIME

create

	make,
	make_separate

feature

	make
		local
			i: INTEGER
			a: separate AA
		do
			i := f
			create a.make_separate
		end

	make_separate
		local
			i: INTEGER
		do
			i := f
			print ("Passed")
		end

	f: INTEGER
		once ("PROCESS")
			Result := 2
		end

end
