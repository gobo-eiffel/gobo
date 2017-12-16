deferred class BB

feature

	f
		require
			g
		deferred
		end
		
	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
