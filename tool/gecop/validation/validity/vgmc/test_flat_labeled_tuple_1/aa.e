class AA

create

	make

feature

	make
		local
			b: BB [TUPLE [EE]]
			e: EE
		do
			create b
			create e
			b.f ([e])
		end

end
