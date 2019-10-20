class AA

create

	make

feature

	make
		local
			c: CC
			y: YY
		do
			
			create c
			create y.make (c)
		end

end
