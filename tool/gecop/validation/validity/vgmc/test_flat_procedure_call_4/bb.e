class BB [G -> {CC rename f as fc end, DD rename f as fd end}]

feature

	g (a: G; c: CC)
		do
			a.fc (c)
		end

end
