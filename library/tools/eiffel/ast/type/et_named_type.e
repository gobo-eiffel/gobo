indexing

	description:

		"Named Eiffel types (either the name of a class or %
		%the name of a formal generic parameter)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_NAMED_TYPE

inherit

	ET_TYPE
		redefine
			is_named_type
		end

feature -- Access

	name: ET_CLASS_NAME
			-- Name of type

	upper_name: STRING is
			-- Upper-name of type
			-- (May return the same object as `name.name' if already in upper case,
			-- otherwise return a new object at each call.)
		do
			Result := name.upper_name
		ensure
			upper_name_not_void: Result /= Void
			upper_name_not_empty: Result.count > 0
			definition: Result.is_equal (name.name.as_upper)
		end

	lower_name: STRING is
			-- Lower-name of type
			-- (May return the same object as `name.name' if already in lower case,
			-- otherwise return a new object at each call.)
		do
			Result := name.lower_name
		ensure
			upper_name_not_void: Result /= Void
			upper_name_not_empty: Result.count > 0
			definition: Result.is_equal (name.name.as_lower)
		end

feature -- Status report

	is_named_type: BOOLEAN is
			-- Is current type only made up of named types?
		do
			Result := True
		end

invariant

	name_not_void: name /= Void

end
