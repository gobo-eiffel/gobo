class AA

create

	make

feature

	make
		local
			d: DD
			y: YY
			z: ZZ
		do
			
			create d
			create y.make (d)
			create z.make (d)
		end

end
