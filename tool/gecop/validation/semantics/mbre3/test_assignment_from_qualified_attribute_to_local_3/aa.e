class AA

create

	make

feature

	make
		local
			b: BB
			d: DD
		do
			create b.make
			print ("## copy expected%N")
			d := b.attr
			print ("##%N")
			print ("b.value = " + b.value.out + "%N")
			print ("d.value = " + d.value.out + "%N")
			b.set_value (3)
			print ("b.value = " + b.value.out + "%N")
			print ("d.value = " + d.value.out + "%N")
			d.set_value (4)
			print ("b.value = " + b.value.out + "%N")
			print ("d.value = " + d.value.out + "%N")
		end
		
end
