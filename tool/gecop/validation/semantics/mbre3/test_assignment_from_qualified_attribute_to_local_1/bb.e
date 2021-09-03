class BB

create

	make

feature

	make
		local
			d: DD
		do
			if condition then
				d.set_value (2)
				print ("## copy expected%N")
				attr := d
			else
				attr := create {CC}
			end
		end
	
	attr: CC

	value: INTEGER
		do
			Result := attr.value
		end
		
	set_value (i: INTEGER)
		do
			attr.set_value (i)
		end
		
	condition: BOOLEAN
		local
			s: STRING
		do
			s := "gobo"
			Result := s.count \\ 2 = 0
		end
		
end