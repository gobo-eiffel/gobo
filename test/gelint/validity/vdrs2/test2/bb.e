class BB

inherit

	CC
		redefine
			f
		end

feature

	f: INTEGER is
		do
			Result := 4
		end

end -- class BB
