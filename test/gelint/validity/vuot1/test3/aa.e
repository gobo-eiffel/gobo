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
			s1, s2: detachable STRING
		do
			s1 := "foo"
			s2 := "bar"
			if not attached s1 as x1 or not attached s2 as x1 then
			else
				x1.append_string ("gobo")
			end
		end

end
