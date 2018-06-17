class BB

feature

	f: INTEGER
		do
			Result := 55
		ensure
			foo: agent require pre: 1 /= 2 do end /= Void
			class_feature: class
		end

end
