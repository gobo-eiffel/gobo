class BB [G -> {CC rename f as make, g as p end, CC rename f as make, g as q end} create make end]

feature

	f
		local
			g: G
		do
			create g.make
			g.p
			g.q
		end

end
