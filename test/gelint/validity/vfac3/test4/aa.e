class AA

create

	make

feature

	make
		local
			b: BB
			s: detachable STRING
		do
			create b.make
			b.xxx := s
			b.yyy := "eiffel"
			b.zzz := "zzz"
		end

end
