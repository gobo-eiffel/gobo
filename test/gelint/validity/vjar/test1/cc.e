class CC

inherit

	BB
		redefine
			f, a
		end

feature

	f (s: STRING) is
		do
			precursor (s)
		end

	a: ARRAY [STRING]

end
