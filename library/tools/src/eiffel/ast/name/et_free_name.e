note

	description:

		"Eiffel 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_FREE_NAME

inherit

	ET_CALL_NAME

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	lower_name: STRING
			-- Lower-name of feature call
			-- (using UTF-8 encoding)
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

	operator_name: STRING
			-- Name of operator
			-- (using UTF-8 encoding)
		deferred
		ensure
			operator_name_not_void: Result /= Void
			operator_name_not_empty: Result.count > 0
			operator_name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_operator_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	operator_lower_name: STRING
			-- Lower-name of operator
			-- (using UTF-8 encoding)
			-- (May return the same object as `operator_name' if already in lower case.)
		do
			Result := operator_name
		ensure
			operator_lower_name_not_void: Result /= Void
			operator_lower_name_not_empty: Result.count > 0
			operator_lower_name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_operator_lower_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
			definition: Result.is_equal (operator_name.as_lower)
		end

	hash_code: INTEGER
			-- Hash code value

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are feature name and `other' the same feature call name?
			-- (case insensitive)
		do
			if other = Current then
				Result := True
			elseif attached {ET_FREE_NAME} other as op then
				if hash_code = op.hash_code then
					if is_infix_freeop /= op.is_infix_freeop then
						Result := False
					elseif op.operator_name = operator_name then
						Result := True
					else
						Result := STRING_.same_case_insensitive (operator_name, op.operator_name)
					end
				end
			end
		end

invariant

	is_freeop: is_infix_freeop xor is_prefix_freeop

end
