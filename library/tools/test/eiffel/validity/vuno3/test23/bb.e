deferred class BB

feature

	f: INTEGER
		require
			g
		deferred
		ensure
			class_feature: class
		end

	g: BOOLEAN = True

end
