class AA

create

	make

feature

	make
		local
			c: CC
			d: DD
		do
			create d.make (2)
			print ("## copy expected%N")
			c := d
			print ("##%N")
			print ("d.to_c.value = " + d.to_c.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			d.to_c.set_value (3)
			print ("d.to_c.value = " + d.to_c.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			c.set_value (4)
			print ("d.to_c.value = " + d.to_c.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
		end
		
end
