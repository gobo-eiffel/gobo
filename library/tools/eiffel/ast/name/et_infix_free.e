indexing

	description:

		"Eiffel infix 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INFIX_FREE

inherit

	ET_OPERATOR
		undefine
			hash_code
		redefine
			name, same_feature_name
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	name: STRING is
			-- Name of feature
		do
			create Result.make (free_operator_name.count + 8)
			Result.append_string (infix_double_quote)
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

	free_operator_name: STRING is
			-- Name of free operator
		deferred
		ensure
			free_operator_name_not_void: Result /= Void
			free_operator_name_not_empty: Result.count > 0
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			op: ET_INFIX_FREE
		do
			if other = Current then
				Result := True
			else
				op ?= other
				if op /= Void and then op.is_infix_freeop then
					if hash_code = op.hash_code then
						if op.free_operator_name = free_operator_name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (free_operator_name, op.free_operator_name)
						end
					end
				end
			end
		end

feature {NONE} -- Constants

	infix_double_quote: STRING is "infix %""

end
