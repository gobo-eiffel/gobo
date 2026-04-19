class AA

create

	make

feature

	make
		local
			a: BOOLEAN
			b: BB
		do
			create b.make (Current)
			a := b = b
			c := ""
			print ("Failed")
		end

	c: STRING

end
