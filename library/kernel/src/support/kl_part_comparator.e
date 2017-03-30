note

	description:

		"Partial order comparators"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_PART_COMPARATOR [G]

feature -- Status report

	less_than (u, v: G): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := detachable_less_than (u, v)
		ensure
			asymmetric: Result implies not less_than (v, u)
		end

	detachable_less_than (u, v: detachable G): BOOLEAN
			-- Is `u' considered less than `v'?
			-- Void is considered less than non-Void values.
		do
			if u = Void then
				Result := v /= Void
			elseif v = Void then
				Result := True
			else
				Result := attached_less_than (u, v)
			end
		ensure
			asymmetric: Result implies not detachable_less_than (v, u)
		end

	attached_less_than (u, v: attached G): BOOLEAN
			-- Is `u' considered less than `v'?
		require
			u_not_void: u /= Void
			v_not_void: v /= Void
		deferred
		ensure
			asymmetric: Result implies not attached_less_than (v, u)
		end

	greater_than (u, v: G): BOOLEAN
			-- Is `u' considered greater than `v'?
		do
			Result := less_than (v, u)
		ensure
			definition: Result = less_than (v, u)
		end

	detachable_greater_than (u, v: detachable G): BOOLEAN
			-- Is `u' considered greater than `v'?
			-- Void is considered less than non-Void values.
		do
			Result := detachable_less_than (v, u)
		ensure
			definition: Result = detachable_less_than (v, u)
		end

	attached_greater_than (u, v: attached G): BOOLEAN
			-- Is `u' considered greater than `v'?
		require
			u_not_void: u /= Void
			v_not_void: v /= Void
		do
			Result := attached_less_than (v, u)
		ensure
			definition: Result = attached_less_than (v, u)
		end

end
