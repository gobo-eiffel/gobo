class BB

create

	make

feature

	make
		do
			d.set_value (2)
		end
	
	d: DD

	value: INTEGER
		do
			Result := d.value
		end

end