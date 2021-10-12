class AA

create

	make

feature

	make
		local
			t: TUPLE [v: CC]
			c: CC
			d: DD
		do
			d.set_value (2)
			print ("## copy expected%N")
			c := d
			print ("## copy expected%N")
			t := [c]
			print ("##%N")
			print ("c.value = " + c.value.out + "%N")
			print ("t.v.value = " + t.v.value.out + "%N")
			c.set_value (3)
			print ("c.value = " + c.value.out + "%N")
			print ("t.v.value = " + t.v.value.out + "%N")
			t.v.set_value (4)
			print ("c.value = " + c.value.out + "%N")
			print ("t.v.value = " + t.v.value.out + "%N")
		end

end
