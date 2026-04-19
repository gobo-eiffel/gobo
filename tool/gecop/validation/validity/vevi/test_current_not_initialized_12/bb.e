class BB

create

	make

feature

	make (a: AA)
		do
			aa := a
		end

	aa: AA

	is_valid: BOOLEAN
		do
			Result := True
		end

invariant

	aa.b.is_valid

end
