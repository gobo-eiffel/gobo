class AA

create

	make

feature

	make
		local
			c: PROCEDURE
		do
			b.set_value (2)
			print ("## copy expected%N")
			c := agent f (b)
			print ("## copy expected%N")
			c.call ([])
			print ("## copy expected%N")
			c.call ([])
		end

	b: CC

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
