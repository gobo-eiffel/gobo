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
		do
			from
				s := "gobo"
			until
					-- `s' is considered as attached.
				s.count = 3
			loop
				s := "foo"
			end
		end

	f2
		local
			s: detachable STRING
		do
			from
				s := "gobo"
			until
					-- `s' is not considered as attached because
					-- after the first iteration it will be Void.
				s.count = 3
			loop
				s := Void
			end
		end

end
