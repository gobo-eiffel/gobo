indexing

	description:

		"Content model for element declaration in DTD"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_ELEMENT_CONTENT

inherit

	ANY
		redefine
			out
		end

	KL_SHARED_PLATFORM
		export
			{NONE} all
		undefine
			out
		end

	UC_UNICODE_FACTORY
		export
			{NONE} all
		undefine
			out
		end

	XM_UNICODE_STRUCTURE_FACTORY
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

create

	make_name, make_list,
	make_choice, make_sequence, make_mixed,
	make_any, make_empty

feature {NONE} -- Initialization

	make_name (a_name: like name) is
			-- Create a new name node.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			set_default
		ensure
			is_name: is_name
			name_set: name = a_name
		end

	make_list is
			-- Create a new list node.
		do
			create {DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT]} items.make
			set_default
		ensure
			not_name: not is_name
		end

	set_default is
			-- Set default for repetition and type.
		do
			set_sequence
			set_one
		end

feature {NONE} -- Initialization (derived)

	make_empty is
			-- Create a new empty content model.
		do
			make_list
			set_content_empty
		ensure
			list: not is_name
			set: is_content_empty
		end

	make_any is
			-- Create a new any content model.
		do
			make_list
			set_content_any
		ensure
			list: not is_name
			set: is_content_any
		end

	make_choice is
			-- Create a new choice list.
		do
			make_list
			set_choice
		ensure
			list: not is_name
			set: is_choice
		end

	make_sequence is
			-- Create a new sequence list.
		do
			make_list
			set_sequence
		ensure
			list: not is_name
			set: is_sequence
		end

	make_mixed is
			-- Create a new mixed content.
		do
			make_list
			set_content_mixed
		ensure
			list: not is_name
			set: is_content_mixed
		end

feature -- Data

	name: STRING
			-- Name, IF leaf item
		--require is_name
		--ensure Result /= Void

	items: DS_LIST [XM_DTD_ELEMENT_CONTENT]
			-- List of subitems
		--require not is_name
		--ensure Result /= Void

feature {NONE} -- Data (implementation)

	type: CHARACTER
			-- Sequence enumeration, see invariant.
			-- Internal type not exposed to client, character for convenience.

	repetition: CHARACTER
			-- Repetition enumeration, see invariant..
			-- Internal type not exposed to client, character for convenience.

feature -- Output

	out: STRING is
			-- Output as in DTD.
		local
			a_cursor: DS_LINEAR_CURSOR [XM_DTD_ELEMENT_CONTENT]
		do
			if is_name then
				Result := name
				if not is_one then
					Result.append_character (repetition)
				end
			elseif is_content_any then
				Result := "ANY"
			elseif is_content_empty then
				Result := "EMPTY"
			else
				Result := STRING_.cloned_string ("(")
				a_cursor := items.new_cursor
				from a_cursor.start until a_cursor.after loop
					Result := STRING_.appended_string (Result, a_cursor.item.out)
					a_cursor.forth
					if not a_cursor.after then
						if is_content_mixed then
							Result.append_character ('|')
						else
							Result.append_character (type)
						end
					end
				end
				Result.append_character (')')
				if not is_one then
					Result.append_character (repetition)
				end
			end
		end

feature -- Sequence/leaf

	is_name: BOOLEAN is
			-- Is this node a name leaf (list node otherwise)?
		do
			Result := name /= Void
		ensure
			leaf: Result implies name /= Void
			node: not Result implies items /= Void
		end

feature -- Repetition

	is_one: BOOLEAN is
			-- One occurrence exactly.
		do
			Result := repetition = ' '
		end

	is_one_or_more: BOOLEAN is
			-- One or more occurrences.
		do
			Result := repetition = '+'
		end

	is_zero_or_one: BOOLEAN is
			-- Zero or one occurrences.
		do
			Result := repetition = '?'
		end

	is_zero_or_more: BOOLEAN is
			-- Zero or more occurrences.
		do
			Result := repetition = '*'
		end

	set_one is
			-- One occurrence.
		do
			repetition := ' '
		ensure
			set: is_one
		end

	set_one_or_more is
			-- One or more occurrences.
		do
			repetition := '+'
		ensure
			set: is_one_or_more
		end

	set_zero_or_one is
			-- Zero or one occurrences.
		do
			repetition := '?'
		ensure
			set: is_zero_or_one
		end

	set_zero_or_more is
			-- Zero or more occurrences.
		do
			repetition := '*'
		ensure
			set: is_zero_or_more
		end

feature -- Repetition (derived)

	minimum_occurrences: INTEGER is
			-- Minimum occurrences
		do
			if is_one or is_one_or_more then
				Result := 1
			end
		ensure
			postive: Result >= 0
			ordered: Result <= maximum_occurrences
			one: is_one implies (Result = 1)
			zero_or_one: is_zero_or_one implies (Result = 0)
			one_or_more: is_one_or_more implies (Result = 1)
			zero_or_more: is_zero_or_more implies (Result = 0)
		end

	maximum_occurrences: INTEGER is
			-- Maximum occurrences
		do
			Result := 1
			if is_one_or_more or is_zero_or_more then
				Result := Platform.Maximum_integer
			end
		ensure
			positive: Result >= 0
			ordered: Result >= minimum_occurrences
			one: is_one implies (Result = 1)
			zero_or_one: is_zero_or_one implies (Result = 1)
			one_or_more: is_one_or_more implies (Result > 1)
			zero_or_more: is_zero_or_more implies (Result > 1)
		end

feature -- Content (compound)

	is_choice: BOOLEAN is
			-- Choice.
		do
			Result := type = '|'
		end

	is_sequence: BOOLEAN is
			-- Sequence.
		do
			Result := type = ','
		end

	set_choice is
			-- Choice.
		do
			type := '|'
		ensure
			set: is_choice
		end

	set_sequence is
			-- Sequence.
		do
			type := ','
		ensure
			set: is_sequence
		end

feature -- Content (final)

	is_content_any: BOOLEAN is
			-- ANY content.
		do
			Result := type = '?'
		ensure
			empty: Result implies (not is_name and items.count = 0)
			chardata: Result implies is_character_data_allowed
		end

	is_content_empty: BOOLEAN is
			-- EMPTY content.
		do
			Result := type = '0'
		ensure
			empty: Result implies (not is_name and items.count = 0)
		end

	set_content_any is
			-- ANY content.
		require
			list: not is_name
		do
			type := '?'
			is_character_data_allowed := True
		ensure
			set: is_content_any
		end

	set_content_empty is
			-- EMPTY content.
		require
			list: not is_name
		do
			type := '0'
		ensure
			set: is_content_empty
		end

feature -- Content (mixed)

	is_content_mixed: BOOLEAN is
			-- Is this mixed content?
		do
			Result := is_choice and is_character_data_allowed
		ensure
			empty: Result implies (not is_name)
		end

	set_content_mixed is
			-- Set mixed #PCDATA content.
		require
			list: not is_name
		do
			set_choice
			is_character_data_allowed := True
		ensure
			choice: is_choice
			set: is_content_mixed
		end

	is_character_data_allowed: BOOLEAN
			-- Is PCDATA allowed within this content?

invariant

	name: is_name = (name /= Void)
	chardata: is_character_data_allowed = (is_content_mixed or is_content_any)
	type_enumeration: ("|,?0").has (type)
	repetition_enumeration: (" +?*").has (repetition)
	leaf_or_items: is_name = (items = Void)

end
