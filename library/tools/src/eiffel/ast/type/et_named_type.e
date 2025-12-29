note

	description:

		"Named Eiffel types (either the name of a class or %
		%the name of a formal generic parameter)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"

deferred class ET_NAMED_TYPE

inherit

	ET_TYPE
		redefine
			is_named_type,
			type_with_type_mark
		end

feature -- Access

	name: ET_CLASS_NAME
			-- Name of type

	upper_name: STRING
			-- Upper-name of type
			-- (May return the same object as `name.name' if already in upper case,
			-- otherwise return a new object at each call.)
		do
			Result := name.upper_name
		ensure
			upper_name_not_void: Result /= Void
			upper_name_not_empty: Result.count > 0
			definition: Result.same_string (name.name.as_upper)
		end

	lower_name: STRING
			-- Lower-name of type
			-- (May return the same object as `name.name' if already in lower case,
			-- otherwise return a new object at each call.)
		do
			Result := name.lower_name
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			definition: Result.same_string (name.name.as_lower)
		end

	type_with_type_mark (a_type_mark: detachable ET_TYPE_MARK): ET_NAMED_TYPE
			-- Current type whose type mark status is
			-- overridden by `a_type_mark', if not Void
		do
			Result := Current
		end

feature -- Status report

	is_named_type: BOOLEAN
			-- Is current type only made up of named types?
		do
			Result := True
		end

invariant

	name_not_void: name /= Void

end
