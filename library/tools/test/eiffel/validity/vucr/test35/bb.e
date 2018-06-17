class BB

feature

	f: INTEGER
		require
			{BB}.g
		do
			if Current /= Void then
				Result := 1
			else
				Result := 2
			end
		end

	g: BOOLEAN
		do
			Result := True
		ensure
			class_feature: class
		end

end
