class AA

create

	make,
	make_separate

feature

	make
		local
			a: separate AA
		do
			create b.f
			create a.make_separate
			separate a as sa do
				print ("b = a.b: " + (b = sa.b).out + "%N")
				inspect b
				when {BB}.f then
					print ("b is {BB}.f: True%N")
				else
					print ("b is {BB}.f: False%N")
				end
				inspect sa.b
				when {BB}.f then
					print ("a.b is {BB}.f: True%N")
				else
					print ("a.b is {BB}.f: False%N")
				end
			end
		end

	make_separate
		do
			create b.f
		end

	b: BB
		
end
