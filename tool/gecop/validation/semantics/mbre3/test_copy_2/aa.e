class AA

create

	make

feature

	make
		local
			b1: BB
			b2: BB
		do
			create b1.make
			create b2.make
			b2.set_value (10)
			print ("## copy expected%N")
			b2.copy (b1)
			print ("##%N")
			print ("b1.value = " + b1.value.out + "%N")
			print ("b2.value = " + b2.value.out + "%N")
			b1.set_value (3)
			print ("b1.value = " + b1.value.out + "%N")
			print ("b2.value = " + b2.value.out + "%N")
			b2.set_value (4)
			print ("b1.value = " + b1.value.out + "%N")
			print ("b2.value = " + b2.value.out + "%N")
		end

end
