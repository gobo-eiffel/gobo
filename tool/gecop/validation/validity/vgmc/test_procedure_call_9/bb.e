class BB [G -> {CC rename f as h, g as p end, CC rename f as h, g as q end}]

feature

	f (a: G)
		do
			a.h
			a.p
			a.q
		end

end
