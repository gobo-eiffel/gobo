class BB

feature

	f: INTEGER
		require
			{BB}.g
		do
		end

	g: BOOLEAN
		do
			Result := True
		ensure
			class_feature: class
		end

end
