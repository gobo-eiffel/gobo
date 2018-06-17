class BB

feature

	f
		do
			create attr.make (0)
		ensure
			class_feature: class
		end
		
	attr: STRING

end
