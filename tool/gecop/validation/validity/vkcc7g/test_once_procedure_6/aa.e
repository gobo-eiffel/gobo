class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f
			{BB}.g
			print ("Passed")
		end
		
end
