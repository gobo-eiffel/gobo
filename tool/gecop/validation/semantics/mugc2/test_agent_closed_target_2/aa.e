class AA

create

	make

feature

	make
		local
			b: BB
			c: CC
			d: PROCEDURE
		do
			c.set_value (2)
			print ("## copy expected%N")
			b := c
			print ("## copy expected%N")
			d := agent b.f
			print ("##%N")
			print ("b.value = " + b.value.out + "%N")
			d.call ([])
			print ("b.value = " + b.value.out + "%N")
			d.call ([])
			print ("b.value = " + b.value.out + "%N")
		end

end
