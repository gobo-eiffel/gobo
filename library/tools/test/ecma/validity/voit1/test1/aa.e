class AA

create

	make

feature

	make
		do
			f
		end

	f
		local
			exp: BB
			a: ANY
		do
			create exp
			across
				exp
			as
				c
			loop
				a := c
			end
		end

end
