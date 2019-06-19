note

	description:

		"Eiffel class names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_NAME

inherit

	ET_AST_NODE
	ET_PRECURSOR_CLASS_NAME
	HASHABLE

feature -- Access

	name: STRING
			-- Name of class
			-- (using UTF-8 encoding)
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
			name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	upper_name: STRING
			-- Upper-name of class
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in upper case,
			-- otherwise return a new object at each call.)
		deferred
		ensure
			upper_name_not_void: Result /= Void
			upper_name_not_empty: Result.count > 0
			upper_name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_upper_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
			definition: Result.is_equal (name.as_upper)
		end

	lower_name: STRING
			-- Lower-name of class
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in upper case,
			-- otherwise return a new object at each call.)
		deferred
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			lower_name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_lower_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
			definition: Result.is_equal (name.as_lower)
		end

	class_name: ET_CLASS_NAME
			-- Class name
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Status report

	is_identifier: BOOLEAN
			-- Is current class name an identifier?
		do
			-- Result := False
		end

	is_none: BOOLEAN
			-- Is current class name "NONE"?
		do
			Result := same_class_name (tokens.none_class_name)
		end

feature -- Comparison

	same_class_name (other: ET_CLASS_NAME): BOOLEAN
			-- Are class name and `other' the same class name?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		deferred
		end

end
