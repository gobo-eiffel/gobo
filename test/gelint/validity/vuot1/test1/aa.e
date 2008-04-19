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
					do
						print ({a: ANY} "foo")
					end
			end
		end

end
