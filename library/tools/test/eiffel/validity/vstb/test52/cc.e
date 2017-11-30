class CC

inherit

	BB
		redefine
			f
		end

feature

	f: INTEGER
		do
			Result := 20
		end

end
