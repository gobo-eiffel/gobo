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

	f: DD
		do
			Result.set_value (2)
		end
		
end
