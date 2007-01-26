indexing

	description:

		"Routines that ought to be in class BOOLEAN"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_BOOLEAN_ROUTINES

feature -- Access

	nxor (a_booleans: ARRAY [BOOLEAN]): BOOLEAN is
			-- N-ary exclusive or
		require
			a_booleans_not_void: a_booleans /= Void
		local
			i, nb: INTEGER
		do
			i := a_booleans.lower
			nb := a_booleans.upper
			from until i > nb loop
				if a_booleans.item (i) then
					if Result then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						Result := True
						i := i + 1
					end
				else
					i := i + 1
				end
			end
		ensure
			zero: a_booleans.count = 0 implies not Result
			unary: a_booleans.count = 1 implies Result = a_booleans.item (a_booleans.lower)
			binary: a_booleans.count = 2 implies Result = (a_booleans.item (a_booleans.lower) xor a_booleans.item (a_booleans.upper))
			-- more: there exists one and only one `i' in a_boolean.lower..a_boolean.upper so that a_boolean.item (i) = True
		end

end
