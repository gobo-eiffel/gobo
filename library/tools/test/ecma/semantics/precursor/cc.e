class CC [G]

inherit

	BB [G]
		redefine
			f
		end

feature

	f: ARRAY [G]
		do
			Result := precursor
		end

end
