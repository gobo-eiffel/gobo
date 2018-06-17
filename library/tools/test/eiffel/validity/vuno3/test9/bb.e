class BB

feature

	f: INTEGER
		external
			"C inline"
		alias
			"return 58;"
		ensure
			definition: Result = 58
		end

end
