indexing

	description:

		"Media types as defined in RFC2045. %
		%No facility is provided for parsing the MIME Content-Type %
		%header at present. Nor is the syntax of names rigidly %
		%checked at present."

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_MEDIA_TYPE

inherit

	ANY

	HASHABLE

	KL_IMPORTED_ANY_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_type, a_subtype: STRING) is
			-- Create a new media type.
		require
			a_type_not_void: a_type /= Void
			a_type_not_empty: a_type.count > 0
			a_type_string: ANY_.same_types (a_type, "")
			a_subtype_not_void: a_subtype /= Void
			a_subtype_not_empty: a_subtype.count > 0
			a_subtype_string: ANY_.same_types (a_subtype, "")
			-- TODO: should these be printable ASCII, or some subset? RFC2045 does not appear to say.
		do
			type := a_type.as_lower
			subtype := a_subtype.as_lower
			create parameters.make_map (10)
			parameters.set_key_equality_tester (string_equality_tester)
		ensure
			type_set: type.is_equal (a_type.as_lower)
			subtype_set: subtype.is_equal (a_subtype.as_lower)
		end

feature -- Access

	type: STRING
			-- Type

	subtype: STRING
			-- Subtype

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := subtype.hash_code
		end

	parameter (a_name: STRING): STRING is
			-- Value of parameter named `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_string: ANY_.same_types (a_name, "")
			valid_parameter_name: is_valid_parameter_name (a_name)
			has_parameter: has_parameter (a_name)
		do
			Result := parameters.item (a_name.as_lower)
		ensure
			parameter_not_void: Result /= Void
		end

feature -- Status report

	has_parameter (a_name: STRING): BOOLEAN is
			-- Does `Current' have a parameter named `a_name'?
		require
			a_name_not_void: a_name /= Void
			a_name_string: ANY_.same_types (a_name, "")
			valid_parameter_name: is_valid_parameter_name (a_name)
		do
			Result := parameters.has (a_name.as_lower)
		end

	is_valid_parameter_name (a_name: STRING): BOOLEAN is
			-- Is `a_name' a legitimate parameter name?
		require
			a_name_not_void: a_name /= Void
			a_name_string: ANY_.same_types (a_name, "")
		do
			Result := is_token (a_name, False)
		end

	is_token (a_string: STRING; allow_specials: BOOLEAN): BOOLEAN is
			-- Is `a_string' a token?
		require
			a_string_not_void: a_string /= Void
		local
			an_index, a_count, a_code: INTEGER
		do
			from
				Result := True
				a_count := a_string.count
				an_index := 1
			until
				Result = False or else an_index > a_count
			loop
				a_code := a_string.item_code (an_index)
				if a_code < 21 then
					Result := False
				elseif a_code > 126 then
					Result := False
				else
					inspect a_string.item (an_index)
					when ')', '(', '<', '>', '@', ',', ';', ':', '\', '"', '/', '%(', '%)', '?', '=' then
						Result := allow_specials
					else
						Result := True
					end
					an_index := an_index + 1
				end
			variant
				a_count + 1 - an_index
			end
		end

feature -- Element change

	add_parameter (a_name, a_value: STRING) is
			-- Add new parameter `a_name' with value `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_string: ANY_.same_types (a_name, "")
			valid_parameter_name: is_valid_parameter_name (a_name)
			not_has_parameter: not has_parameter (a_name)
			a_value_not_void: a_value /= Void
			a_value_string: ANY_.same_types (a_value, "")
			valid_value: is_token (a_value, True)
		do
			parameters.force (a_value, a_name.as_lower)
		ensure
			has_parameter: has_parameter (a_name)
			parameter_set: parameter (a_name) = a_value
		end

feature {NONE} -- Implementation

	parameters: DS_HASH_TABLE [STRING, STRING]
			-- Defined parameters

invariant

	type_not_void: type /= Void
	type_not_empty: type.count > 0
	type_is_lower_case: type.is_equal (type.as_lower)
	subtype_not_void: subtype /= Void
	subtype_not_empty: subtype.count > 0
	subtype_is_lower_case: subtype.is_equal (subtype.as_lower)
	parameters_not_void: parameters /= Void
	no_void_parameter: not parameters.has_void_item

end
