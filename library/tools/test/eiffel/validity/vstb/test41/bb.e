class BB

feature

	f
		local
			p: POINTER
		do
			p := $Current
		ensure
			class_feature: class
		end

end
