class BB [G -> {DD rename make as make_dd end, CC} create make end]

feature

	f
		local
			g: G
		do
			create g.make
		end

end
