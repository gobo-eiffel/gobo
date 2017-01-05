class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.make
			b.xxx := "gobo"
			b.yyy := "eiffel"
			b.zzz := "zzz"
		end

end
