class BB [G -> {CC, DD}]

feature

	f (a: TUPLE [b: G])
		local
			i: ANY
		do
			i := a.b (5)
		end

end
