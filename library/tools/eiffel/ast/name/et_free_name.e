note

	description:

		"Eiffel 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FREE_NAME

inherit

	ET_CALL_NAME

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	lower_name: STRING is
			-- Lower-name of feature call
			-- (May return the same object as `name' if already in lower case.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := name
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if c >= 'A' and c <= 'Z' then
					Result := Result.as_lower
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	free_operator_name: STRING is
			-- Name of free operator
		deferred
		ensure
			free_operator_name_not_void: Result /= Void
			free_operator_name_not_empty: Result.count > 0
		end

	hash_code: INTEGER
			-- Hash code value

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature call name?
			-- (case insensitive)
		local
			op: ET_FREE_NAME
		do
			if other = Current then
				Result := True
			else
				op ?= other
				if op /= Void then
					if hash_code = op.hash_code then
						if is_infix_freeop /= op.is_infix_freeop then
							Result := False
						elseif op.free_operator_name = free_operator_name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (free_operator_name, op.free_operator_name)
						end
					end
				end
			end
		end

invariant

	is_freeop: is_infix_freeop xor is_prefix_freeop

end
