class BB

create

	make

feature

	make (i: INTEGER)
		do
			attr := i
		end

	attr: INTEGER

	f (c: CC): INTEGER
		do
			Result := attr + c.attr
		end

end
