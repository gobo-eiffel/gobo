class DD

create

	make

feature

	make (i: INTEGER)
		do
			attr := i
		end

	attr: INTEGER
	
	h alias "+" (d: DD): INTEGER
		do
			Result := attr + d.attr
		end
		
end
