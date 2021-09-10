class AA

create

	make

feature

	make
		local
			t1, t2: TUPLE [v: DD]
			d: DD
		do
			create t1
			create t2
			d.set_value (2)
			print ("## copy expected%N")
			t1.v := d
			print ("## copy expected%N")
			t2.copy (t1)
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("t1.v.value = " + t1.v.value.out + "%N")
			print ("t2.v.value = " + t2.v.value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("t1.v.value = " + t1.v.value.out + "%N")
			print ("t2.v.value = " + t2.v.value.out + "%N")
			t1.v.set_value (4)
			print ("d.value = " + d.value.out + "%N")
			print ("t1.v.value = " + t1.v.value.out + "%N")
			print ("t2.v.value = " + t2.v.value.out + "%N")
			t2.v.set_value (5)
			print ("d.value = " + d.value.out + "%N")
			print ("t1.v.value = " + t1.v.value.out + "%N")
			print ("t2.v.value = " + t2.v.value.out + "%N")
		end

end
