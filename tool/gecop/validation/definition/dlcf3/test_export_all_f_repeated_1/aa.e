class AA

create

	make

feature

	make
		local
			c: CC
			z: ZZ
		do
			
			create c
			create z.make (c)
		end

end
