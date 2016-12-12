class DD

inherit

	CC [INTEGER]
		redefine
			f
		end

feature

	f: ARRAY [INTEGER]
		do
			Result := precursor
		end

end
