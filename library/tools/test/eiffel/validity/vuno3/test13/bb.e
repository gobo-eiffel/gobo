class BB

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
		external
			"C inline"
		alias
			"return 1;"
		end

end
