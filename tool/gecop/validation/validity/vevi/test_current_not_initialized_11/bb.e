class BB

create

	make

feature

	make (a: AA)
		do
		ensure
			a.b.is_valid
		end

	is_valid: BOOLEAN
		do
			Result := True
		end

end
