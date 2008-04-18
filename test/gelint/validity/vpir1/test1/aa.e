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
		do
			if {a: STRING} "gobo" then
				p := agent
					local
						a: STRING
					do
						print (a)
					end
			end
		end

end
