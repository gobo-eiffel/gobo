class BB [G -> {CC [COMPARABLE], CC [NUMERIC]} create make end]

feature

	f
		local
			g: G
		do
			create g.make
		end

end
