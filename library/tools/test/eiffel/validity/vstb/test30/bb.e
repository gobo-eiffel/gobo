class BB

feature

	f: INTEGER
		do
				-- It's OK to call an instance-free feature
				-- from another instance-free feature.
			Result := g
		ensure
			class_feature: class
		end
		
	g: INTEGER
		do
			Result := 8
		ensure
			class_feature: class
		end

end
