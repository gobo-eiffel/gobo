class BB [G -> {CC, DD}]

feature

	f (a: G)
		local
			p: ANY
		do
			p := agent a.f
		end

end
