deferred class BB

feature

	f: INTEGER
		require
			g
		deferred
		end

	g: BOOLEAN
		do
			Result := True
		ensure
			class_feature: class
		end

end
