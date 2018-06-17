class BB

feature

	f
		local
			p: POINTER
		do
			p := $attr
		ensure
			class_feature: class
		end

	attr: STRING

end
