class AA

create

	make

feature

	make
		local
			d1, d2: DD
		do
			print ("## copy expected%N")
			d1 := f
			print ("## copy expected%N")
			d2 := f
			print ("##%N")
			print ("d1.value = " + d1.value.out + "%N")
			print ("d2.value = " + d2.value.out + "%N")
			d1.set_value (3)
			print ("d1.value = " + d1.value.out + "%N")
			print ("d2.value = " + d2.value.out + "%N")
			d2.set_value (4)
			print ("d1.value = " + d1.value.out + "%N")
			print ("d2.value = " + d2.value.out + "%N")
		end

	f: DD
		do
			Result.set_value (2)
		end
		
end
