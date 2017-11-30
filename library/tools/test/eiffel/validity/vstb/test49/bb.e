class BB

feature

	f
		local
			a: ANY
		do
			a := agent g
		ensure
			class_feature: class
		end

	g
		do
		ensure
			class_feature: class
		end

end
