class BB

create

	make

feature

	make (a: AA)
		require
			a.b.is_valid
		do
		end

	is_valid: BOOLEAN
		do
			Result := True
		end

end
