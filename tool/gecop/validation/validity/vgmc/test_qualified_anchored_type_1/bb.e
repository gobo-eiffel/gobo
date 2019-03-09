class BB [G -> {CC, DD}]

feature

	f
		local
			i: like a.f
		do
			i := 4
		end

	a: detachable G
		do
		end

end
