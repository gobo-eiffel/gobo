class AA

create

	make

feature

	make
		local
			b: BB
		do
			{BB}.f
			create b.f
			print ("Failed")
		end
		
end
