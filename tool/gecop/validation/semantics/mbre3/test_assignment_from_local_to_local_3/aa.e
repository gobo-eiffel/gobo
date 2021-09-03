class AA

create

	make

feature

	make
		local
			d1, d2: DD
		do
			d1.set_value (2)
			print ("## copy expected%N")
			d2 := d1
			print ("##%N")
			print ("d1.value = " + d1.value.out + "%N")
			print ("d2.value = " + d2.value.out + "%N")
			d1.set_value (3)
			print ("d1.value = " + d1.value.out + "%N")
			print ("d2.value = " + d2.value.out + "%N")
			d2.set_value (4)
			print ("d1.value = " + d1.value.out + "%N")
			print ("d2.value = " + d2.value.out + "%N")
		end
		
end
