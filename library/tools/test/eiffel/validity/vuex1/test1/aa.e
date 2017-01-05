class AA

create

	make

feature

	make
		do
			f ("gobo")
		end

	f (a: ANY)
		local
			p: PROCEDURE [ANY, TUPLE]
		do
			p := agent
				do
					print (a)
				end
		end

end
