class BB [G -> {TUPLE [x: INTEGER] rename x as y end, ANY}]

feature

	f (t: G)
		local
			i: INTEGER
		do
			i := t.y
		end

end
