class BB [G -> {CC, DD} create make end]

feature

	f
		local
			a: G
		do
			create a.make
		end

end
