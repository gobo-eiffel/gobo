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
			a: detachable ANY
			s: attached STRING
		do
			s := "gobo"
		rescue
			a := s
		end
		
end
