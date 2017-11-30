class CC

inherit

	BB
		redefine
			f
		end

feature

	f: DD
		do
			Precursor (5)
			create Result
		ensure then
			class_feature: class
		end

end
