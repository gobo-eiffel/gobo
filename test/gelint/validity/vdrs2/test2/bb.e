class BB

inherit

	CC
		redefine
			f
		end

feature

	f: INTEGER
		do
			Result := 4
		end

end -- class BB
