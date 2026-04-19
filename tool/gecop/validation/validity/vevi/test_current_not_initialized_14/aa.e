class AA

create

	make

feature

	make
		do
			create b.make (Current)
			print ("Failed")
		end

	b: BB

end
