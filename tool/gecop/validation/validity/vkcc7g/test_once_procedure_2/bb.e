once class BB

create

	f, g

feature

	f
		once
			attr := attr + 1
		end

	g
		once
			attr := attr + 2
		end

	h
		do
			g
		end

	attr: INTEGER

end
