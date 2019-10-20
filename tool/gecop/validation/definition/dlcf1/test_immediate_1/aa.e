class AA

create

	make

feature

	make
		local
			b: BB
			z: ZZ
		do
			
			create b
			create z.make (b)
		end

end
