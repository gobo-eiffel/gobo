class CC

inherit

	BB
		redefine
			f
		end

feature

	f: BOOLEAN
		do
			Result := Precursor
		ensure then
			class_feature: class
		end

end
