class AA

create

	make

feature

	make
		local
			c: PROCEDURE [BB]
			t: TUPLE [BB]
		do
			b.set_value (2)
			c := agent f
			print ("## copy expected%N")
			t := [b]
			print ("## copy expected%N")
			c.call (t)
			print ("## 2 copies expected%N")
			c.call ([b])
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
