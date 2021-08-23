class BB [G -> {TUPLE [f: INTEGER], TUPLE [f: INTEGER; g: BOOLEAN]}]

feature

	f (a: G)
		local
			i: INTEGER
		do
			i := a.f
		end

end
