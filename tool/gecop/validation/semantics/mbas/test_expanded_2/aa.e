class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
		do
			c.set_value (2)
			print ("## copy expected%N")
			b := c
			print ("##%N")
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			c.set_value (3)
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			b.set_value (4)
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
		end
		
end
