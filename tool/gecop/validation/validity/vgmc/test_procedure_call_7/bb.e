class BB [G -> {CC rename f as h end, CC rename g as h end}]

feature

	f (a: G)
		do
			a.h
		end

end
