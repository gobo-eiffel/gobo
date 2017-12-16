class BB [G]

create

	make

feature

	make (a: G)
		do
			g := a
		end
		
	f: G
		once ("OBJECT")
			Result := g
		end

	g: G

end
