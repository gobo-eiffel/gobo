class AA

create

	make

feature

	make
		local
			b: BB
		do
			{BB}.default_create
			create b
			print ("Failed")
		end
		
end
