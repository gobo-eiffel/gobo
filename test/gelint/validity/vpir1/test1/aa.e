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
			p: detachable PROCEDURE [ANY, TUPLE]
			s: detachable STRING
		do
			s := "gobo"
			if attached s as a then
				p := agent
					local
						a: detachable STRING
					do
						print (a)
					end
			end
		end

end
