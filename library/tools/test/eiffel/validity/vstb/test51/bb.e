class BB

feature

	f
		local
			a: ANY
		do
			a := agent Current.out
		ensure
			class_feature: class
		end

end
