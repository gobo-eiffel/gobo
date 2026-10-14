class AA

create

	make

feature

	make
		local
			c: CC
		do
			create c.f
			print ("Failed")
		end
		
end
