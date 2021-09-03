class AA

create

	make

feature

	make
		local
			c: CC
		do
			attr.set_value (2)
			print ("## copy expected%N")
			c := attr
			print ("##%N")
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			attr.set_value (3)
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			c.set_value (4)
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
		end

	attr: DD
		
end
