class BB [G -> {CC rename f as fc end, DD rename f as fd end}]

feature

	g (a: G)
		local
			c: like a.fc
		do
			c := create {CC}
		end

end
