class BB [G -> {CC rename f as fc end, DD rename f as fd end}]

feature

	g (a: G)
		do
			a.fc (a)
		end

end
