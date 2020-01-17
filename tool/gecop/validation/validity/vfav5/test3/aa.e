class AA

create

	make

feature

	make
		local
			b: BB
			i: INTEGER
		do
			create b.make (2)
			i := + b
			print ("Failed")
		end

end
