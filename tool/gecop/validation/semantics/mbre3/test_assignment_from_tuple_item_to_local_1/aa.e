class AA

create

	make

feature

	make
		local
			t: TUPLE [v: CC]
			d: DD
			c1, c2: CC
		do
			d.set_value (2)
			create t
			if condition then
				print ("## copy expected%N")
				t.v := d
			else
				t.v := create {CC}
			end
			print ("## copy expected%N")
			c1 := t.v
			print ("## copy expected%N")
			c2 := t.v
			print ("##%N")
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			c1.set_value (3)
			print ("c1.value = " + c1.value.out + "%N")
			print ("c2.value = " + c2.value.out + "%N")
			c2.set_value (4)
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
