expanded class BB

inherit

	ANY
		redefine
			is_equal
		end

create

	default_create,
	make

feature

	make (a: AA)
		do
			aa := a
		end

	aa: detachable separate AA

	is_equal (other: like Current): BOOLEAN
		do
			if attached {AA} aa as a then
				Result := a.c.is_empty
			end
		end

end
