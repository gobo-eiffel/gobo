class CC

inherit

	BB
		redefine
			f
		end

feature

	f: INTEGER
		external
			"C inline"
		alias
			"return (EIF_INTEGER)60;"
		end

end
