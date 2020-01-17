class BB

create

	make
	
convert

	to_c: {CC}

feature

	make (i: INTEGER)
		do
			attr := i
		end

	attr: INTEGER

	f alias "+" convert (b: BB): INTEGER
		do
			Result := attr + b.attr
		end
	
	to_c: CC
		do
			create Result.make (attr * 10)
		end

end
