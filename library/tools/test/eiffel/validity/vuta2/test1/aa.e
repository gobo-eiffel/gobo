class AA

create

	make

feature

	make
		do
			f1
			f2
		end
		
	f1
		local
			s: detachable STRING
			i: INTEGER
		do
			from
				s := "gobo"
			until
				i > 5
			loop
					-- `s' is considered as attached.
				i := i + s.count
			end
		end

	f2
		local
			s: detachable STRING
			i: INTEGER
		do
			from
				s := "gobo"
			until
				i > 5
			loop
					-- `s' is not considered as attached because
					-- after the first iteration it will be Void.
				i := i + s.count
				s := Void
			end
		end

end
