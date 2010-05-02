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
			s1: detachable STRING
			p: PROCEDURE [ANY, TUPLE]
		do
			s1 := "gobo"
			if attached s1 as a then
				p := agent
					local
						s2: detachable STRING
					do
						s2 := "foo"
						print (attached s2 as a)
					end
			end
		end

end
