class BB [G -> {CC, DD} create make end]

feature

	f
		local
			g: G
		do
			create g.make
		end

end
