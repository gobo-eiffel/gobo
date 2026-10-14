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
			b := {BB}.make
			create a.make_separate
		end

	make_separate
		local
			b: BB
		do
			b := {BB}.make
			print ("Failed")
		end

end
