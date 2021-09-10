class AA

create

	make

feature

	make
		local
			s1, s2: SPECIAL [DD]
			d, d2: DD
		do
			create s1.make_empty (1)
			d.set_value (2)
			print ("## copy expected%N")
			s1.extend (d)
			create s2.make_empty (1)
			d2.set_value (10)
			print ("## copy expected%N")
			s2.extend (d2)
			print ("## copy expected%N")
			s2.copy (s1)
			print ("##%N")
			print ("d.value = " + d.value.out + "%N")
			print ("s1.item (0).value = " + s1.item (0).value.out + "%N")
			print ("s2.item (0).value = " + s2.item (0).value.out + "%N")
			d.set_value (3)
			print ("d.value = " + d.value.out + "%N")
			print ("s1.item (0).value = " + s1.item (0).value.out + "%N")
			print ("s2.item (0).value = " + s2.item (0).value.out + "%N")
			s1.item (0).set_value (4)
			print ("d.value = " + d.value.out + "%N")
			print ("s1.item (0).value = " + s1.item (0).value.out + "%N")
			print ("s2.item (0).value = " + s2.item (0).value.out + "%N")
			s2.item (0).set_value (5)
			print ("d.value = " + d.value.out + "%N")
			print ("s1.item (0).value = " + s1.item (0).value.out + "%N")
			print ("s2.item (0).value = " + s2.item (0).value.out + "%N")
		end

end
