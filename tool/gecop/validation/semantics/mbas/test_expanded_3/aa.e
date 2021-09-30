class AA

create

	make

feature

	make
		local
			a: BB
			b: BB
			c: CC
		do
			if ("gobo").count = 4 then
				c.set_value (2)
				print ("## copy expected%N")
				b := c
			else
				create b
			end
			print ("## copy expected%N")
			a := b
			print ("##%N")
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			print ("a.value = " + a.value.out + "%N")
			c.set_value (3)
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			print ("a.value = " + a.value.out + "%N")
			b.set_value (4)
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			print ("a.value = " + a.value.out + "%N")
			a.set_value (5)
			print ("c.value = " + c.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			print ("a.value = " + a.value.out + "%N")
		end
		
end
