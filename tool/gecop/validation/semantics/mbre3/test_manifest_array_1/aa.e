class AA

create

	make

feature

	make
		local
			a: ARRAY [CC]
			c: CC
			d: DD
		do
			d.set_value (2)
			print ("## copy expected%N")
			c := d
			print ("## copy expected%N")
			a := <<c>>
			print ("##%N")
			print ("c.value = " + c.value.out + "%N")
			print ("a.area.item (0).value = " + a.area.item (0).value.out + "%N")
			c.set_value (3)
			print ("c.value = " + c.value.out + "%N")
			print ("a.area.item (0).value = " + a.area.item (0).value.out + "%N")
		end

end
