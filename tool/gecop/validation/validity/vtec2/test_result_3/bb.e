expanded class BB

inherit

	ANY
		redefine
			default_create
		end

feature

	default_create
		do
			attr := "Passed"
		end

	attr: STRING

	f
		do
			print (attr)
		end

end
