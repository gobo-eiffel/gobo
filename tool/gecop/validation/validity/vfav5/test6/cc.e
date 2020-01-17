class CC

create

	make

feature

	make (i: INTEGER)
		do
			attr := i
		end

	attr: INTEGER

	f (i: INTEGER): INTEGER
		do
			Result := attr + i
		end

end
