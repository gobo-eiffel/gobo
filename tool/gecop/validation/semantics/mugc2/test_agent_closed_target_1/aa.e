class AA

create

	make

feature

	make
		local
			b: BB
			c: PROCEDURE
		do
			b.set_value (2)
			print ("## copy expected%N")
			c := agent b.f
			print ("##%N")
			print ("b.value = " + b.value.out + "%N")
			c.call ([])
			print ("b.value = " + b.value.out + "%N")
			c.call ([])
			print ("b.value = " + b.value.out + "%N")
		end

end
