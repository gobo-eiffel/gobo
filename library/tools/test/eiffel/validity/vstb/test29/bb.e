class BB

feature

	f
		local
			a: STRING
		do
			a := g.out
		ensure
			class_feature: class
		end
		
	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
