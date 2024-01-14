note

	description:

		"Eiffel note terms which appear in a comma-separated list of note terms"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2017, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INDEXING_TERM_ITEM

inherit

	ET_AST_NODE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	indexing_term: ET_INDEXING_TERM
			-- Note term in comma-separated list
		deferred
		ensure
			indexing_term_not_void: Result /= Void
		end

	indexing_term_value: STRING
			-- Value of current indexing term
		deferred
		ensure
			indexing_term_value_not_void: Result /= Void
		end

feature -- Status report

	has_indexing_term_value (a_value: STRING): BOOLEAN
			-- Does current indexing term have value `a_value'?
			-- (case-insensitive comparison)
		require
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		deferred
		end

end
