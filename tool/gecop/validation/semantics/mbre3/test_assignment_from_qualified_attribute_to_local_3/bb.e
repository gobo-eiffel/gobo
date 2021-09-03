class BB

create

	make

feature

	make
		do
			attr.set_value (2)
		end
	
	attr: DD

	value: INTEGER
		do
			Result := attr.value
		end
		
	set_value (i: INTEGER)
		do
			attr.set_value (i)
		end
		
end