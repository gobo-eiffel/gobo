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
				c := d
			else
				c := create {CC}
			end
		end
	
	c: CC

	value: INTEGER
		do
			Result := c.value
		end
		
	set_value (i: INTEGER)
		do
			c.set_value (i)
		end
		
	condition: BOOLEAN
		local
			s: STRING
		do
			s := "gobo"
			Result := s.count \\ 2 = 0
		end
		
end