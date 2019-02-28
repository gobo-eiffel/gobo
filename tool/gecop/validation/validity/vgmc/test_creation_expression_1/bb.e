class BB [G -> {CC, DD}]

feature

	f
		local
			a: ANY
		do
			a := create {G}.make
		end

end
