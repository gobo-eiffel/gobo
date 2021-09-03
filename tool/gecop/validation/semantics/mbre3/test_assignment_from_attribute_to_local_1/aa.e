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
			if condition then
				print ("## copy expected%N")
				attr := d
			else
				attr := create {CC}
			end
			print ("## copy expected%N")
			c := attr
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			attr.set_value (4)
			print ("d.value = " + d.value.out + "%N")
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
			c.set_value (5)
			print ("d.value = " + d.value.out + "%N")
			print ("attr.value = " + attr.value.out + "%N")
			print ("c.value = " + c.value.out + "%N")
		end

	attr: CC
	
	condition: BOOLEAN
		local
			s: STRING
		do
			s := "gobo"
			Result := s.count \\ 2 = 0
		end
		
end
