class AA

create

	make

feature

	make
		local
			b: BB [STRING]
			c: separate CC [STRING]
		do
			create b.make ("gobo")
			create c.make
			b.g (c)
		end

end
