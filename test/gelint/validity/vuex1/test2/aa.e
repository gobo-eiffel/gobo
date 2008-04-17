class AA

create

	make

feature

	make is
		do
			f
		end

	f is
		local
			p: PROCEDURE [ANY, TUPLE]
			a: ANY
		do
			a := "gobo"
			p := agent
				do
					print (a)
				end
		end

end
