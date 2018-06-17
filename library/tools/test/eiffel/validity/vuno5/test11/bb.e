deferred class BB

feature

	f: INTEGER
		require
			g
		deferred
		end

	g: BOOLEAN = True

end
