class CC

create

	make

feature

	make (i: INTEGER)
		do
			attr := i
		end

	attr: INTEGER
	
	g alias "+" (c: CC): INTEGER
		do
			Result := attr + c.attr
		end
		
end
