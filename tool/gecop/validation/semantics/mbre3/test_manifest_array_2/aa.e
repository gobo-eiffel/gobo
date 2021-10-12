class AA

create

	make

feature

	make
		local
			a: ARRAY [DD]
			d: DD
		do
			d.set_value (2)
			print ("## copy expected%N")
			a := <<d>>
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("a.area.item (0).value = " + a.area.item (0).value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("a.area.item (0).value = " + a.area.item (0).value.out + "%N")
		end

end
