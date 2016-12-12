class AA

create

	make

feature

	make
		local
			s1: detachable STRING
			s2: detachable STRING
		do
			s1 := "eiffel"
			s2 := "gobo"
			if (attached s1 as l) and (attached s2 as l) then
			end
		end

end
