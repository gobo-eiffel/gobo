class AA

create

	make

feature

	make
		local
			b: BB [TUPLE [INTEGER, INTEGER]]
		do
			create b
			b.f ([4, 5])
			print ("Passed")
		end

end
