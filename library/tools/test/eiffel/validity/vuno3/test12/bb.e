class BB

feature

	f: INTEGER
		require
			{BB}.g
		external
			"C inline"
		alias
			"return (EIF_INTEGER)60;"
		end

	g: BOOLEAN
		do
			Result := True
		ensure
			class_feature: class
		end

end
