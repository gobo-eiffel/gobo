class AA

create

	make

feature

	make
		local
			c: CC
			d: PROCEDURE [BB]
			t: TUPLE [BB]
		do
			c.set_value (2)
			print ("## copy expected%N")
			b := c
			d := agent f
			print ("## copy expected%N")
			t := [b]
			print ("## copy expected%N")
			d.call (t)
			print ("## 2 copies expected%N")
			d.call ([b])
		end

	b: BB

	f (a: BB)
		do
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
