class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.make
			print ("b.value = " + b.value.out + "%N")
			b.d.set_value (3)
			print ("b.value = " + b.value.out + "%N")
		end
		
end
