class BB

feature

	f
		do
			attr ?= "gobo"
		ensure
			class_feature: class
		end
		
	attr: STRING

end
