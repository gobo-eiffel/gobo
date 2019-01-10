class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.make
			b.f
			print ("Passed")
		end

end
