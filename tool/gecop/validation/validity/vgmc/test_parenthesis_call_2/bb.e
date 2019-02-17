class BB [G -> {CC, DD}]

feature

	f (a: TUPLE [b: G])
		local
			i: INTEGER
		do
			i := a.b (5)
		end

end
