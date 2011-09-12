class AA

create

	make

feature

	make
		local
			d: DD [INTEGER]
			a: ANY
		do
			create d.make
			a := d.f
		end

end
