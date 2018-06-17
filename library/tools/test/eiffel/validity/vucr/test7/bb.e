class BB

feature

	f
		do
			g
		ensure
			class_feature: class
		end
		
	g
		local
			a: BOOLEAN
		do
			a := Current /= Void
		end

end
