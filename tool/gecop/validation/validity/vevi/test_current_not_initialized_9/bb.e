class BB

create

	make

feature

	make (a: AA)
		local
			b: BOOLEAN
		do
			b := a.b.is_valid
		end

	is_valid: BOOLEAN
		do
			Result := True
		end

end
