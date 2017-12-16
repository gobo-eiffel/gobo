class AA

create

	make

feature

	make
		local
			s1: detachable STRING
			bb: BB
			a: detachable ANY
		do
			s1 := "eiffel"
			create bb
			if attached s1 as x then
				across
					bb
				as
					x
				loop
					a := x
				end
			end
		end

end
