class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
			d: PROCEDURE [BB]
			t: TUPLE [b: BB]
		do
			c.set_value (2)
			print ("## copy expected%N")
			b := c
			d := agent {BB}.f
			print ("b.value = " + b.value.out + "%N")
			print ("## copy expected%N")
			t := [b]
			d.call (t)
			print ("t.b.value = " + t.b.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			print ("## copy expected%N")
			d.call ([b])
			print ("b.value = " + b.value.out + "%N")
		end

end
