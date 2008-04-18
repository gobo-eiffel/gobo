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
				p := agent (a: STRING)
					do
					end
			end
		end

end
