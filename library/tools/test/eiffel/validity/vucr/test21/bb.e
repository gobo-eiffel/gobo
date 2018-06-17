class BB

feature

	f: like Current
		do
				-- It's OK to use 'like Current' in instance-free features.
			create Result
		ensure
			class_feature: class
		end

	g: INTEGER
		do
			Result := 16
		end

end
