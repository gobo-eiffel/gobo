class BB [G -> {CC, DD}]

feature

	f
		local
			p: ANY
		do
			p := agent {G}.f
		end

end
