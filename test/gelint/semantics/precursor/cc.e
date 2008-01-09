class CC [G]

inherit

	BB [G]
		redefine
			f
		end

feature

	f: ARRAY [G] is
		do
			Result := precursor
		end

end
