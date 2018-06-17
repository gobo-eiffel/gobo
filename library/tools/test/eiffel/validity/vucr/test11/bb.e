class BB

feature

	f
		do
				-- It's OK to call an instance-free feature
				-- from a non-instance-free feature.
			print (g)
		end

	g: INTEGER
		do
			Result := 6
		ensure
			class_feature: class
		end
		
end
