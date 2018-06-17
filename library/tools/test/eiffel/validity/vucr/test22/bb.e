class BB

feature

	f: like attr
		do
				-- It's OK to use 'like attr' in instance-free features.
			Result := 17
		ensure
			class_feature: class
		end

	attr: INTEGER

end
