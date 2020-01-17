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
			i := b [5]
			print ("Failed")
		end

end
