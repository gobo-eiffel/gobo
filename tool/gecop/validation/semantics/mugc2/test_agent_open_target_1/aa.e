class AA

create

	make

feature

	make
		local
			b: BB
			c: PROCEDURE [BB]
			t: TUPLE [b: BB]
		do
			b.set_value (2)
			c := agent {BB}.f
			print ("b.value = " + b.value.out + "%N")
			print ("## copy expected%N")
			t := [b]
			c.call (t)
			print ("t.b.value = " + t.b.value.out + "%N")
			print ("b.value = " + b.value.out + "%N")
			print ("## copy expected%N")
			c.call ([b])
			print ("b.value = " + b.value.out + "%N")
		end

end
