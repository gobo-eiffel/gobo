class BB

feature

	f
		local
			b: BB
		do
			b := Current
		ensure
			class_feature: class
		end

end
