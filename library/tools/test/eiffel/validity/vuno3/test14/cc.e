class CC

inherit

	BB

feature

	f: INTEGER
		external
			"C inline"
		alias
			"return 58;"
		end

end
