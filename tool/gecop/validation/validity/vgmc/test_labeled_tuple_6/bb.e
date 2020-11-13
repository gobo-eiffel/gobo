class BB [G -> {TUPLE [f: INTEGER; g: INTEGER], TUPLE [g: INTEGER; f: INTEGER]}]

feature

	f (a: G)
		local
			i: INTEGER
		do
			i := a.f
		end

end
