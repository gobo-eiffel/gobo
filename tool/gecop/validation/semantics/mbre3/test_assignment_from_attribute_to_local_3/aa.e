class AA

create

	make

feature

	make
		local
			d: DD
		do
			attr.set_value (2)
			print ("## copy expected%N")
			d := attr
			print ("##%N")
			print ("attr.value = " + attr.value.out + "%N")
			print ("d.value = " + d.value.out + "%N")
			attr.set_value (3)
			print ("attr.value = " + attr.value.out + "%N")
			print ("d.value = " + d.value.out + "%N")
			d.set_value (4)
			print ("attr.value = " + attr.value.out + "%N")
			print ("d.value = " + d.value.out + "%N")
		end

	attr: DD
		
end
