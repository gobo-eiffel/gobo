class AA

create

	make

feature

	make
		local
			b: BB [CC [ANY]]
			c: CC [ANY]
		do
			create b
			create c
			b.f (c)
		end

end
