class AA

create

	make

feature

	make
		do
			create b.make (Current)
			print ("Passed")
		end

	b: BB

end
