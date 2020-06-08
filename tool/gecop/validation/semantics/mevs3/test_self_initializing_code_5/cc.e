class CC

inherit

	BB
		redefine
			g
		end

feature

	g: STRING
		do
			Result := "bar"
		end

end
