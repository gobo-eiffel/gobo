class AA

create

	make

feature

	make
		local
			b: BB
		do
			print ("## no copy expected%N")
			create b
			b.d.set_value (3)
			print ("##%N")
		end
		
end
