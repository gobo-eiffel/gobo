class CC

inherit

	BB
		redefine
			f
		end

feature

	f
		do
			Precursor
		ensure then
			class_feature: class
		end

end
