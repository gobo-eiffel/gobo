indexing

	description:

		"Media types as defined in RFC2045. %
		%No facility is provided for parsing the MIME Content-Type %
		%header at present. Nor is the syntax of names rigidly %
		%checked at present."

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_MEDIA_TYPE

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_type, a_subtype: STRING) is
			-- Establish invariant.
		require
			type_not_empty: a_type /= Void and then a_type.count > 0 and then ANY_.same_types (a_type, "")
			subtype_not_empty: subtype /= Void and then subtype.count > 0 and then ANY_.same_types (a_subtype, "")
			-- TODO: should these be printable ASCII, or some subset? RFC2045 does not appear to say.
		do
			type :=  a_type.as_lower
			subtype :=  a_subtype.as_lower
			create parameters.make_equal (10)
		ensure
			type_set: type.is_equal (a_type.as_lower)
			subtype_set: subtype.is_equal (a_subtype.as_lower)
		end

feature -- Access

	type: STRING
			-- Type

	subtype: STRING
			-- Subtype

	has (a_parameter: STRING): BOOLEAN is
			-- Does `Current' have a parameter named `a_parameter'?
		require
			valid_parameter_name: a_parameter /= Void and then ANY_.same_types (a_parameter, "")
				and then is_valid_parameter_name (a_parameter)
		do
			Result := parameters.has (a_parameter.as_lower)
		end

	is_valid_parameter_name (a_parameter: STRING): BOOLEAN is
			-- Is `a_parameter' a legitimate parameter name?
		require
			parameter_name_not_void: a_parameter /= Void and then ANY_.same_types (a_parameter, "")
		do
			Result := is_token (a_parameter, False)
		end

	value (a_parameter: STRING): STRING is
			-- Value for`a_parameter'?
		require
			valid_parameter_name: a_parameter /= Void and then ANY_.same_types (a_parameter, "")
				and then is_valid_parameter_name (a_parameter)
				and then has (a_parameter)
		do
			Result := parameters.item (a_parameter.as_lower)
		ensure
			value_found: Result /= Void
		end

	is_token (a_string: STRING; allow_specials: BOOLEAN): BOOLEAN is
			-- Is `a_string' a token?
		require
			token_not_void: a_string /= Void
		local
			an_index, a_count, a_code: INTEGER
			a_character: CHARACTER
		do
			from
				Result := True
				a_count := a_string.count
				an_index := 1
			variant
				a_count + 1 - an_index
			until
				Result = False or else an_index > a_count
			loop
				a_code := a_string.item_code (an_index)
				if a_code < 21 then
					Result := False
				elseif a_code > 126 then
					Result := False
				else
					a_character := a_string.item (an_index)
					inspect
						a_character
					when ')', '(', '<', '>', '@', ',', ';', ':', '\', '"', '/', '%(', '%)', '?', '=' then
                  Result := allow_specials
					else
						Result := True
					end
					an_index := an_index + 1
				end
			end
		end

feature -- Element change

	add_parameter (a_parameter, a_value: STRING) is
			-- Does `Current' have a parameter named `a_parameter'?
		require
			valid_parameter_name: a_parameter /= Void and then ANY_.same_types (a_parameter, "")
				and then is_valid_parameter_name (a_parameter)
			valid_value: a_value /= Void and then ANY_.same_types (a_value, "") and then is_token (a_value, True)
			parameter_not_present: not has (a_parameter)
		do
			parameters.force (a_value, a_parameter.as_lower)
		ensure
			parameter_present: has (a_parameter)
			value_set: parameters.item (a_parameter.as_lower).is_equal (a_value)
		end

feature {NONE} -- Implementation

	parameters: DS_HASH_TABLE [STRING, STRING]
			-- Defined parameters

invariant

	type_is_lower_case: type /= Void and then type.count > 0 and then type.is_equal (type.as_lower)
	subtype_is_lower_case: subtype /= Void and then subtype.count > 0 and then subtype.is_equal (subtype.as_lower)
	parameters_not_void: parameters /= Void

end

