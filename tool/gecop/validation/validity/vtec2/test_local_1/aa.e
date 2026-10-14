class AA

create

	make

feature

	make
		local
			b: BB
		do
			b.f
			print ("Failed")
		end
		
end
