class AA

create

	make

feature

	make
		local
			c1, c2: CC
		do
			print ("## copy expected%N")
			c1 := f
			print ("## copy expected%N")
			c2 := f
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

	f: CC
		once
			if condition then
				create {DD} Result
				Result.set_value (2)
			else
				create Result
			end
		end
	
	condition: BOOLEAN
		local
			s: STRING
		do
			s := "gobo"
			Result := s.count \\ 2 = 0
		end
		
end
