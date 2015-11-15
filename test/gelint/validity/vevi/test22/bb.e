expanded class BB

inherit

	ANY
		redefine
			default_create,
			copy
		end
create

	default_create

feature

	default_create
		do
			create c.make (Current)
		end
		
	c: CC

	copy (other: like Current)
		local
			s: ANY
		do
			s := other.c.out
		end

end
