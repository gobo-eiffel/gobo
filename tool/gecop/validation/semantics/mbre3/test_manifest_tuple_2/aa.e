class AA

create

	make

feature

	make
		local
			t: TUPLE [v: DD]
			d: DD
		do
			d.set_value (2)
			print ("## copy expected%N")
			t := [d]
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("t.v.value = " + t.v.value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("t.v.value = " + t.v.value.out + "%N")
			t.v.set_value (4)
			print ("d.value = " + d.value.out + "%N")
			print ("t.v.value = " + t.v.value.out + "%N")
		end

end
