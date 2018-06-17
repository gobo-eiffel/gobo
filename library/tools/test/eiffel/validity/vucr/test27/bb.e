class BB

feature

	f
		local
			a: ANY
		do
			a := agent do end
		ensure
			class_feature: class
		end

end
