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
				i > 2
			loop
				i := i + 1
			variant
					-- `s' is considered as attached.
				s.count - i
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
				i > 2
			loop
				i := i + 1
				s := Void
			variant
					-- `s' is not considered as attached because
					-- after the first iteration it will be Void.
				s.count - i
			end
		end

end
