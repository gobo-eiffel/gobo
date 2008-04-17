class AA

create

	make

feature

	make is
		do
			f ("gobo")
		end

	f (a: ANY) is
		local
			p: PROCEDURE [ANY, TUPLE]
		do
			p := agent
				do
					print (a)
				end
		end

end
