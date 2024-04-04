class CC

create

	make

feature

	make
		do
		end

	h: INTEGER
		local
			d: DD
		do
			create d.make
			Result := d.z
		end

end
