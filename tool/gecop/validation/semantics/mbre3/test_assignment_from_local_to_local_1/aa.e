class AA

create

	make

feature

	make
		local
			c1, c2: CC
			d: DD
		do
			d.set_value (2)
			if condition then
				print ("## copy expected%N")
				c1 := d
			else
				c1 := create {CC}
			end
			print ("## copy expected%N")
			c2 := c1
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			c1.set_value (4)
			print ("d.value = " + d.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			c2.set_value (5)
			print ("d.value = " + d.value.out + "%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
		end

	condition: BOOLEAN
		local
			s: STRING
		do
			s := "gobo"
			Result := s.count \\ 2 = 0
		end
		
end
