class AA

create

	make

feature

	make
		local
			b1: BB
			b2: BB
		do
			create b1.f
			b1.g
			create b2.g
			print ("Failed")
		end

end
