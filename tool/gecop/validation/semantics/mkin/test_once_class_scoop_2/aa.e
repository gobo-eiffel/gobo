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
			separate a as sa, b as sb do
				separate sa.b as sa_b do
					print ("b = a.b: " + (sb = sa_b).out + "%N")
					inspect sb
					when {separate BB}.f then
						print ("b is {BB}.f: True%N")
					else
						print ("b is {BB}.f: False%N")
					end
					inspect sa_b
					when {separate BB}.f then
						print ("a.b is {BB}.f: True%N")
					else
						print ("a.b is {BB}.f: False%N")
					end
				end
			end
		end

	make_separate
		do
			create b.f
		end

	b: separate BB
		
end
