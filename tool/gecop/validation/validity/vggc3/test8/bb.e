class BB [G -> {attached CC, detachable CC} create make end]

feature

	f
		local
			g: G
		do
			create g.make
		end

end
