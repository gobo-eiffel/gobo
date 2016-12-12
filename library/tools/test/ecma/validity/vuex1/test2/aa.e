class AA

create

	make

feature

	make
		do
			f
		end

	f
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
