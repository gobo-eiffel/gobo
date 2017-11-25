deferred class BB

feature

	f
		deferred
		ensure
			g
		end
		
	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
