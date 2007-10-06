indexing

	description:

		"Eiffel constants that are declared inside a feature or an invariant, such %
		%as a once manifest string, instead of in a constant attribute of its own."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INLINE_CONSTANT

inherit

	ET_EXPRESSION
		redefine
			is_never_void
		end

	HASHABLE

feature -- Access

	constant: ET_CONSTANT is
			-- Constant value
		deferred
		ensure
			constant_not_void: Result /= Void
		end

	id: INTEGER
			-- Constant id in surrounding universe

	hash_code: INTEGER is
			-- Hash code
		do
			Result := id
		end

feature -- Status report

	is_never_void: BOOLEAN is True
			-- Can current expression never be void?

feature -- Setting

	set_id (i: INTEGER) is
			-- Set `id' to `i'.
		require
			i_not_negative: i >= 0
		do
			id := i
		ensure
			id_set: id = i
		end

invariant

	id_not_negative: id >= 0

end
