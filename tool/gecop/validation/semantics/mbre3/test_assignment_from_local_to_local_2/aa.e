class AA

create

	make

feature

	make
		local
			c: CC
			d: DD
		do
			d.set_value (2)
			print ("## copy expected%N")
			c := d
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			c.set_value (4)
			print ("d.value = " + d.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
		end

end
