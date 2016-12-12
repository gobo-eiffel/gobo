class AA

create

	make

feature

	make
		local
			c: CC2
		do
			create c.make
			c.f
		end

end
