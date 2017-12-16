class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
			b.xxx := Current
			b.yyy := "eiffel"
		end

end
