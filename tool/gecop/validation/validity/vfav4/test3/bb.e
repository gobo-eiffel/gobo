class BB

create

	make

feature

	make (i: INTEGER)
		do
			attr := i
		end

	attr: INTEGER

	f alias "+" convert: INTEGER
		do
			Result := attr
		end

end
