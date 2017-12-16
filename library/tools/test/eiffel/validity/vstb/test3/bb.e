class BB

feature

	f
		note
			option: "instance_free"
		local
			a: STRING
		do
			a := g.out
		end
		
	g: BOOLEAN
		do
			Result := Current /= Void
		end

end
