note

	description:

		"Total order comparators"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
	license: "MIT License"

deferred class KL_COMPARATOR [G]

inherit

	KL_PART_COMPARATOR [G]

	KL_EQUALITY_TESTER [G]
		redefine
			test
		end

feature -- Status report

	attached_order_equal (u, v: attached G): BOOLEAN
			-- Are `u' and `v' considered equal?
		require
			u_not_void: u /= Void
			v_not_void: v /= Void
		do
			Result := not attached_less_than (u, v) and not attached_less_than (v, u)
		ensure
			definition: Result = (not attached_less_than (u, v) and not attached_greater_than (u, v))
		end

	attached_less_equal (u, v: attached G): BOOLEAN
			-- Is `u' considered less than or equal to `v'?
		require
			u_not_void: u /= Void
			v_not_void: v /= Void
		do
			Result := not attached_less_than (v, u)
		ensure
			definition: Result = (attached_less_than (u, v) or attached_order_equal (u, v))
		end

	attached_greater_equal (u, v: attached G): BOOLEAN
			-- Is `u' considered greater than or equal to `v'?
		require
			u_not_void: u /= Void
			v_not_void: v /= Void
		do
			Result := not attached_less_than (u, v)
		ensure
			definition: Result = (attached_greater_than (u, v) or attached_order_equal (u, v))
		end

	test (v, u: detachable G): BOOLEAN
			-- Are `v' and `u' considered equal?
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := attached_order_equal (u, v)
			end
		end

end
