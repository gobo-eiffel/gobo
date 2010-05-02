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
				p := agent (a: STRING)
					do
					end
			end
		end

end
