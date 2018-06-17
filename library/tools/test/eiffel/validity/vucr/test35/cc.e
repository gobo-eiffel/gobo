class CC

inherit

	BB
		redefine
			f
		end

feature

	f: INTEGER
		do
			Result := 35
		ensure then
			class_feature: class
		end

end
