indexing

	description:

		"Declarations of attribute content in DTD"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_ATTRIBUTE_CONTENT

inherit

	ANY
		redefine
			out
		end

	UC_UNICODE_FACTORY
		export
			{NONE} all
		undefine
			out
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			out
		end

	KL_IMPORTED_BOOLEAN_ROUTINES
		undefine
			out
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new DTD attribute content.
		do
			set_data
			set_value_implied
		ensure
			no_name: not has_name
			no_default: not has_default_value
			data: is_data
			implied: is_value_implied
		end

feature -- Output

	out: STRING is
			-- Like in DTD.
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
		do
				-- Name.
			if has_name then
				Result := STRING_.cloned_string (STRING_.as_string (name))
			else
				Result := STRING_.cloned_string ("?")
			end
				-- Type.
			Result.append_character (' ')
			if is_data then
				Result := STRING_.appended_string (Result, "CDATA")
			elseif is_id then
				Result := STRING_.appended_string (Result, "ID")
			elseif is_id_ref then
				Result := STRING_.appended_string (Result, "IDREF")
			elseif is_entity then
				Result := STRING_.appended_string (Result, "ENTITY")
			elseif is_token then
				Result := STRING_.appended_string (Result, "NMTOKEN")
			elseif is_notation then
				Result := STRING_.appended_string (Result, "NOTATION")
			elseif is_enumeration then
				Result.append_character ('(')
				from
					a_cursor := enumeration.new_cursor
					a_cursor.start
				until
					a_cursor.after
				loop
					if not a_cursor.is_first then
						Result.append_character ('|')
					end
					Result := STRING_.appended_string (Result, a_cursor.item)
					a_cursor.forth
				end
				Result.append_character (')')
			end
			if is_list_type then
				Result.append_character ('S')
			end
			Result.append_character (' ')
				-- Default.
			if is_value_required then
				Result := STRING_.appended_string (Result, "#REQUIRED")
			elseif is_value_implied then
				Result := STRING_.appended_string (Result, "#IMPLIED")
			elseif is_value_fixed then
				Result := STRING_.appended_string (Result, "#FIXED ")
			end
			if has_default_value then
				Result.append_character (' ')
				Result.append_character ('%"')
				Result := STRING_.appended_string (Result, default_value)
				Result.append_character ('%"')
			end
		end

feature -- Name content type

	name: STRING
			-- Attribute name

	set_name (a_name: like name) is
			-- Set name.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	has_name: BOOLEAN is
			-- Has name been set?
		do
			Result := name /= Void
		end

feature {NONE} -- Implementation

	type: CHARACTER
			-- Enumeration for type

	value: CHARACTER
			-- Enumeration for default value

feature -- Default value

	default_value: STRING
			-- require has_default_value
			-- ensure Result /= Void

	set_default_value (a_value: like default_value) is
			-- Set default value.
		require
			a_value_not_void: a_value /= Void
		do
			value := 'D'
			default_value := a_value
		ensure
			default_value_set: default_value = a_value
		end

	has_default_value: BOOLEAN is
			-- Is there a default value?
		do
			Result := default_value /= Void
		end

	copy_default (other: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Copy default value settings from 'other'.
		require
			other_not_void: other /= Void
		do
			if other.is_value_fixed then
				set_value_fixed (other.default_value)
			elseif other.has_default_value then
				set_default_value (other.default_value)
			end
			if other.is_value_required then
				set_value_required
			elseif other.is_value_implied then
				set_value_implied
			end
		end

feature -- Defaults

	is_value_required: BOOLEAN is
			-- Is attribute value required?
		local
			a_value: CHARACTER
		do
				-- This is a workaround to avoid a crash with ISE 5.2.1123
				-- under Windows NT. The crash is due to a memory corruption
				-- because of a bug in the GC (Current has been moved when
				-- executing the invariant, but this routine still has a
				-- pointer to the old location).
			a_value := value
			Result := a_value = 'R'
		end

	set_value_required is
			-- Attribute value required.
		do
			value := 'R'
		ensure
			set: is_value_required
		end

	is_value_implied: BOOLEAN is
			-- Is attribute value implied?
		do
			Result := value = 'I'
		end

	set_value_implied is
			-- Attribute value implied.
		do
			value := 'I'
		ensure
			set: is_value_implied
		end

	is_value_fixed: BOOLEAN is
			-- Is value fixed?
		do
			Result := value = 'F'
		end

	set_value_fixed (a_value: like default_value) is
			-- Set fixed value.
		require
			a_value_not_void: a_value /= Void
		do
			set_default_value (a_value)
			value := 'F'
		ensure
			set: is_value_fixed
			has_default: has_default_value
		end

feature -- String content type

	is_data: BOOLEAN is
			-- CDATA, arbitrary character data?
		do
			Result := type = 'C'
		end

	set_data is
			-- CDATA.
		do
			type := 'C'
		ensure
			set: is_data
		end

feature -- Enumerated content type

	is_notation: BOOLEAN is
			-- NOTATION?
		do
			Result := type = 'N'
		end

	set_notation is
			-- NOTATION.
		do
			type := 'N'
		ensure
			set: is_notation
		end

	is_enumeration: BOOLEAN is
			-- Fixed enumeration?
		do
			Result := type = 'U'
		end

	set_enumeration is
			-- Fixed enumeration.
		do
			type := 'U'
			enumeration_list := Default_enumeration_list
		ensure
			set: is_enumeration
		end

feature -- Tokenized content type

	is_id: BOOLEAN is
			-- ID (identifier declaration)?
		do
			Result := type = 'I'
		end

	set_id is
			-- ID.
		do
			type := 'I'
		ensure
			set: is_id
		end

	is_id_ref: BOOLEAN is
			-- IDREF (identifier reference)?
		do
			Result := type = 'R'
		end

	set_id_ref is
			-- IDREF.
		do
			type := 'R'
		ensure
			set: is_id_ref
		end

	is_entity: BOOLEAN is
			-- ENTITY?
		do
			Result := type = 'E'
		end

	set_entity is
			-- ENTITY.
		do
			type := 'E'
		ensure
			set: is_entity
		end

	is_token: BOOLEAN is
			-- NMTOKEN?
		do
			Result := type = 'T'
		end

	set_token is
			-- NMTOKEN.
		do
			type := 'T'
		ensure
			set: is_token
		end

	is_list_type: BOOLEAN
			-- Is the type a list (NMTOKENS, ENTITIES, IDREFS)?

	set_list_type is
			-- Set type to list.
		require
			valid: is_token or is_entity or is_id_ref
		do
			is_list_type := True
		ensure
			set: is_list_type
		end

feature -- Enumeration

	enumeration: DS_LIST [STRING] is
			-- List of allowed values for fixed enumeration.
		require
			is_enumeration: is_enumeration
		do
			Result := enumeration_list
		ensure
			result_not_void: Result /= Void
		end
	
	set_enumeration_list (a_list: like enumeration) is
			-- Set enumeration type and associated list.
		require
			not_void: a_list /= Void
		do
			set_enumeration
			enumeration_list := a_list
		ensure
			enumeration_type_forced: is_enumeration
			list_set: enumeration_list = a_list
		end
		
feature {NONE} -- Enumeration list

	enumeration_list: like enumeration
			-- List of allowed values for fixed enumeration.
			
	Default_enumeration_list: DS_LINKED_LIST [STRING] is
			-- Default for 'enumeration_list'.
		once
			create Result.make
		ensure
			not_void: Result /= Void
		end
	
invariant

	exclusive: BOOLEAN_.nxor (<<is_token, is_entity, is_id_ref, is_id, is_data, is_notation, is_enumeration>>)
	list_ok: is_list_type implies (is_token or is_entity or is_id_ref)
	impl_type_enumeration: ("CIRETNU").has (type)
	impl_default_enumeration: ("DRIF").has (value)

end
