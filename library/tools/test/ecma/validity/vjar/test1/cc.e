class CC

inherit

	BB
		redefine
			f, a
		end

feature

	f (s: STRING)
		do
			precursor (s)
		end

	a: ARRAY [STRING]

end
