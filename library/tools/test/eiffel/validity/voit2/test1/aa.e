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
			if attached s1 as xx then
				p := agent
					local
						bb: BB
					do
						create bb
						across
							bb
						as
							xx
						loop
							print (xx)
						end
					end
			end
		end

end
