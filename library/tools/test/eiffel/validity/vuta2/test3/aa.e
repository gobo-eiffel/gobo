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
			invariant
					-- `s' is considered as attached.
				s.count > 0
			until
				i > 2
			loop
				i := i + 1
			end
		end

	f2
		local
			s: detachable STRING
			i: INTEGER
		do
			from
				s := "gobo"
			invariant
					-- `s' is not considered as attached because
					-- after the first iteration it will be Void.
				s.count > 0
			until
				i > 2
			loop
				i := i + 1
				s := Void
			end
		end

end
