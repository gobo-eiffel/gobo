class BB [G -> {CC rename f as fc end, DD rename f as fd end}]

feature

	f (a: G)
		local
			c: CC
		do
			c := a.fc
		end

end
