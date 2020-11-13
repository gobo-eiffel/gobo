class BB [G -> {TUPLE [f: INTEGER], TUPLE [f: INTEGER]}]

feature

	f (a: G)
		local
			i: INTEGER
		do
			i := a.f
		end

end
