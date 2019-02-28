class BB [G -> {CC, DD} create make end]

feature

	f
		local
			a: ANY
		do
			a := create {G}.make
		end

end
