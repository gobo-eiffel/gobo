once class BB

create

	f

feature

	f
		once
			attr := attr + 1
		end

	g
		once ("OBJECT")
			attr := attr + 2
		end

	attr: INTEGER

end
