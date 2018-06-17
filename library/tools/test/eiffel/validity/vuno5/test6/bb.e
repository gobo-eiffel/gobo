deferred class BB

feature

	f: INTEGER
		require
			{BB}.g
		external
			"C inline"
		alias
			"return 59;"
		end

	g: BOOLEAN
		external
			"C inline"
		alias
			"return 1;"
		end

end
