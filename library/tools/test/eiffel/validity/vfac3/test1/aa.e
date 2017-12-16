class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.xxx := "gobo"
			b.yyy := "eiffel"
		end

end
