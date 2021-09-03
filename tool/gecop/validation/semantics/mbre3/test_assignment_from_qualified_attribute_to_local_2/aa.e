class AA

create

	make

feature

	make
		local
			b: BB
			c1, c2: CC
		do
			create b.make
			print ("## copy expected%N")
			c1 := b.attr
			print ("## copy expected%N")
			c2 := c1
			print ("##%N")
			print ("b.value = " + b.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			b.set_value (3)
			print ("b.value = " + b.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			c1.set_value (4)
			print ("b.value = " + b.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			c2.set_value (5)
			print ("b.value = " + b.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
		end
		
end
