class AA

create

	make

feature

	make
		local
			b: expanded BB
		do
			b.f
			print ("Failed")
		end
		
end
