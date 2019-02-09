class BB [G -> {CC, CC} create make end]

feature

	f
		local
			g: G
		do
			create g.make
		end

end
