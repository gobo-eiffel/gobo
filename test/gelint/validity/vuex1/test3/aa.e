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
		do
			if {a: STRING} "gobo" then
				p := agent
					do
						print (a)
					end
			end
		end

end
