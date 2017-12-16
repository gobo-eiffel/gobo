deferred class BB

feature

	f: INTEGER
		deferred
		ensure
			g
		end

	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
