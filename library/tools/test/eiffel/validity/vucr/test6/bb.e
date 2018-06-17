class BB

feature

	f
		local
			i: INTEGER
		do
			i := attr
		ensure
			class_feature: class
		end
		
	attr: INTEGER

end
