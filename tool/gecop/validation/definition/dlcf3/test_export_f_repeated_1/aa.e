class AA

create

	make

feature

	make
		local
			c: CC
			y: YY
			z: ZZ
		do
			
			create c
			create y.make (c)
			create z.make (c)
		end

end
