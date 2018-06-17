deferred class BB

feature

	f: INTEGER
		require
			g
		external
			"C inline"
		alias
			"return (EIF_INTEGER)60;"
		ensure
			class_feature: class
		end

	g: BOOLEAN
		do
			Result := True
		ensure
			class_feature: class
		end

end
