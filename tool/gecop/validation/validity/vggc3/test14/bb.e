class BB [G -> {CC [ANY], CC [ANY]} create make end]

feature

	f
		local
			g: G
		do
			create g.make
		end

end
