class AA

create

	make

feature

	make
		local
			b: CC
		do
			b.set_value (2)
			print ("## copy expected%N")
			if attached {BB} b as a then
				print ("##%N")
				print ("b.value = " + b.value.out + "%N")
				print ("a.value = " + a.value.out + "%N")
				b.set_value (3)
				print ("b.value = " + b.value.out + "%N")
				print ("a.value = " + a.value.out + "%N")
				a.set_value (4)
				print ("b.value = " + b.value.out + "%N")
				print ("a.value = " + a.value.out + "%N")
			end
		end
		
end
