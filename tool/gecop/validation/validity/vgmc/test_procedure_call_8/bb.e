class BB [G -> {CC rename f as g end, CC rename f as g end}]

feature

	f (a: G)
		do
			a.g
		end

end
