class BB

feature

	f: INTEGER
		require
			g
		external
			"C inline"
		alias
			"return 59;"
		end

	g: BOOLEAN
		do
			Result := True
		ensure
			class_feature: class
		end

end
