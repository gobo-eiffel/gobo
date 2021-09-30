class AA

create

	make

feature

	make
		local
			b: BB
			d: DD
		do
			create d.make (2)
			print ("## copy expected%N")
			b := d
			print ("##%N")
			print ("d.to_c.value = " + d.to_c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			d.to_c.set_value (3)
			print ("d.to_c.value = " + d.to_c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			b.set_value (4)
			print ("d.to_c.value = " + d.to_c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
		end
		
end
