class AA

create

	make

feature

	make
		local
			b: BB [EE]
			e: EE
			z: ZZ [EE]
		do
			create b
			create e
			create z.make (e)
			b.f (z)
		end

end
