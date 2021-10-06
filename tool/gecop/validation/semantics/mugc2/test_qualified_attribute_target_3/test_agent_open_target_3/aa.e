class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
			d: PROCEDURE [BB]
			t: TUPLE [BB]
		do
			c.set_value (2)
			print ("## copy expected%N")
			b := c
			d := agent {BB}.f
			print ("b.value = " + b.value.out + "%N")
			print ("## copy expected%N")
			t := [b]
			d.call (t)
			print ("b.value = " + b.value.out + "%N")
			print ("## copy expected%N")
			d.call ([b])
			print ("b.value = " + b.value.out + "%N")
		end

end
