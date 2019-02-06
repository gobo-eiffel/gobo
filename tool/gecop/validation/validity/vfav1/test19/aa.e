class AA

create

	make

feature

	make
		local
			b: BB
			i: INTEGER
		do
			create b
			i := b + 4
			print ("Failed")
		end

end
