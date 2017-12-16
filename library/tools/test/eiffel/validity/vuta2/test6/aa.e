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
			s := "gobo"
		rescue
			s := "gobo"
			i := s.count
		end

	f2
		local
			s: detachable STRING
			i: INTEGER
		do
			s := "gobo"
		rescue
			i := s.count
		end

end
