class AA

create

	make

feature

	make
		local
			a: BB
			b: BB
		do
			create b
			a := b
			if a = b then
				print ("Passed")
			else
				print ("Failed")
			end
		end
		
end
