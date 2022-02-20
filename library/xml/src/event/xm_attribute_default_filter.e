note

	description:

		"Fill default attribute values"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

	-- TODO: forward namespaces (currently problem with void in list)
	-- if namespaces are used this filter should be before the
	-- namespace resolver if default attribute namespaces are
	-- to be resolved.

class XM_ATTRIBUTE_DEFAULT_FILTER

inherit

	XM_DTD_CALLBACKS_FILTER
		rename
			make_next as make_dtd_next,
			make_null as make_dtd_null,
			initialize as initialize_dtd,
			set_next as set_next_dtd,
			next as dtd_callbacks
		redefine
			on_attribute_declaration
		end

	XM_CALLBACKS_FILTER
		rename
			make_next as make_callbacks_next,
			make_null as make_callbacks_null,
			initialize as initialize_callbacks,
			set_next as set_next_callbacks
		redefine
			on_start_tag,
			on_attribute,
			on_start_tag_finish
		end

	UC_UNICODE_FACTORY
		export {NONE} all end

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_next,
	make_null

feature {NONE} -- Initialization

	make_next (a_next: like next)
			-- Create a new event filter with `a_next' as next filter.
		require
			a_next_not_void: a_next /= Void
		do
			make_callbacks_next (a_next)
			make_dtd_null
		ensure
			next_set: next = a_next
		end

	make_null
			-- Next is null processor.
		do
			make_callbacks_null
			make_dtd_null
		end

feature -- Setting

	set_next (a_callbacks: XM_CALLBACKS)
			-- Client will receive callbacks to.
		require
			a_callbacks_not_void: a_callbacks /= Void
		do
			set_next_callbacks (a_callbacks)
			set_next_dtd (null_dtd_callbacks)
		ensure
			next_set: next = a_callbacks
		end

feature -- DTD

	on_attribute_declaration (a_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT)
			-- Attribute declaration, one event per attribute.
		local
			l_sub: DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]
			l_defaults: like defaults
		do
				-- Default attribute values.
			if a_model.has_default_value then
				l_defaults := defaults
				if l_defaults = Void then
					l_defaults := new_dtd_attribute_content_list_table
					defaults := l_defaults
				end
				if not l_defaults.has (a_element_name) then
					create l_sub.make_default
					l_defaults.force_new (l_sub, a_element_name)
				end
					-- First declaration is binding.
				if not has_attribute (l_defaults.item (a_element_name), a_name) then
					l_defaults.item (a_element_name).force_last (a_model)
				end
			end
				-- NMTOKEN values.
			token_on_attribute_declaration (a_element_name, a_name, a_model)
			Precursor (a_element_name, a_name, a_model)
		end


feature {NONE} -- DTD implementation

	defaults: detachable DS_HASH_TABLE [DS_LIST [XM_DTD_ATTRIBUTE_CONTENT], STRING]
			-- Attributes defaults

	has_attribute (a_sub: DS_LIST [XM_DTD_ATTRIBUTE_CONTENT]; a_name: STRING): BOOLEAN
			-- Has element level attribute?
		require
			a_sub_not_void: a_sub /= Void
			a_name_not_void: a_name /= Void
		local
			it: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			it := a_sub.new_cursor
			from it.start until it.after loop
				if same_string (it.item.name, a_name) then
					Result := True
					it.go_after
				else
					it.forth
				end
			end
		end

feature -- Content

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Start of start tag.
			-- Store name of current element.
		local
			it: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			reset_attributes
			if attached defaults as l_defaults and then l_defaults.has (dtd_name (a_prefix, a_local_part)) then
				it := l_defaults.item (dtd_name (a_prefix, a_local_part)).new_cursor
				from it.start until it.after loop
					check invariant_has_default_value: attached it.item.default_value as l_default_value then
						push_attribute (Void,
							dtd_prefix (it.item.name),
							dtd_local (it.item.name),
							l_default_value)
						end
					it.forth
				end
			end
			token_on_start_tag (a_prefix, a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Remove from defaults attributes which are explicitely
			-- declared.
		do
			if names = Void then
					-- No defaulting necessary.
				forward_attribute (a_namespace, a_prefix, a_local_part, a_value)
			else
				push_attribute (a_namespace, a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish
			-- Issue default attributes.
		do
			pop_attributes
			Precursor
		end

feature {NONE} -- Attribute queue

	reset_attributes
			-- Clear attributes queue.
		do
			names := Void
			values := Void
		end

	is_space (a: NATURAL_32): BOOLEAN
			-- Is this a space character?
		do
			Result := a = Lf_char.natural_32_code
				or a = Cr_char.natural_32_code
				or a = Tab_char.natural_32_code
				or a = Space_char.natural_32_code
		end

	push_attribute (a_ns, a_prefix: detachable STRING; a_local, a_value: STRING)
			-- Push attributes, if attribute name already
			-- in list overwrite the value.
		require
			a_local_not_void: a_local /= Void
			a_value_not_void: a_value /= Void
		local
			found: BOOLEAN
			i, nb: INTEGER
			l_names: like names
			l_values: like values
		do
				-- Create structure if not.
			l_names := names
			if l_names = Void then
				l_names := new_string_arrayed_list
				names := l_names
			end
			l_values := values
			if l_values = Void then
				l_values := new_string_arrayed_list
				values := l_values
			end
				-- Replace existing attribute.
			nb := l_names.count
			from i := 1 until i > nb loop
				if same_string (dtd_name (a_prefix, a_local), l_names.item (i)) then
					l_values.replace (a_value, i)
					found := True
				end
				i := i + 1
			end
			if not found then
				l_names.force_last (dtd_name (a_prefix, a_local))
				l_values.force_last (a_value)
			end
		end

	pop_attributes
			-- Pop attributes queued.
		local
			i, nb: INTEGER
		do
			if attached names as l_names and attached values as l_values then
				nb := l_names.count
				from i := 1 until i > nb loop
					forward_attribute (Void,
						dtd_prefix (l_names.item (i)),
						dtd_local (l_names.item (i)),
						l_values.item (i))
					i := i + 1
				end
			end
		end

	names, values: detachable DS_LIST [STRING]
			-- Mean version of DS_ARRAYED_LIST [ATTRIBUTE_EVENT]

feature {NONE} -- Content implementation

	dtd_name (a_prefix: detachable STRING; a_local: STRING): STRING
			-- Name for DTD (without namespaces)
		require
			a_local_not_void: a_local /= Void
		do
			if a_prefix /= Void and then has_prefix (a_prefix) then
				Result := STRING_.concat (a_prefix, Prefix_separator)
				Result := STRING_.appended_string (Result, a_local)
			else
				Result := a_local
			end
		ensure
			dtd_name_not_void: Result /= Void
			no_prefix_same: not has_prefix (a_prefix) implies (Result = a_local)
		end

	dtd_prefix (a_dtd_name: STRING): detachable STRING
			-- Prefix from a DTD name
		require
			a_dtd_name_not_void: a_dtd_name /= Void
		local
			an_index: INTEGER
		do
			an_index := a_dtd_name.index_of (Colon_char, 1)
			if an_index > 0 then
				Result := a_dtd_name.substring (1, an_index - 1)
			end
		end

	dtd_local (a_dtd_name: STRING): STRING
			-- Local part from a DTD name
		require
			a_dtd_name_not_void: a_dtd_name /= Void
		local
			an_index: INTEGER
		do
			an_index := a_dtd_name.index_of (Colon_char, 1)
			if an_index > 0 then
				Result := a_dtd_name.substring (an_index + 1, a_dtd_name.count)
			else
				Result := a_dtd_name
			end
		ensure
			dtd_local_not_void: Result /= Void
		end

	Colon_char: CHARACTER
			-- Colon char
		once
			Result := Prefix_separator.item (1)
		end

feature {NONE} -- Tokens implementation

	tokens: detachable DS_HASH_TABLE [DS_HASH_TABLE [BOOLEAN, STRING], STRING]
			-- NMTOKENs for space normalisation, table of
			-- is_token for (element, attribute).

	element_tokens: detachable DS_HASH_TABLE [BOOLEAN, STRING]
			-- Set of token attributes for current element.

	token_on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT)
			-- Attribute declaration, one event per attribute.
		require
			an_element_name_not_void: an_element_name /= Void
			a_name_not_void: a_name /= Void
			a_model_not_void: a_model /= Void
		local
			a_token_sub: like element_tokens
			l_tokens: like tokens
		do
				-- NMTOKEN values.
			l_tokens := tokens
			if l_tokens = Void then
				l_tokens := new_tokens_table
				tokens := l_tokens
			end
			if not l_tokens.has (an_element_name) then
				a_token_sub := new_boolean_string_table
				l_tokens.force_new (a_token_sub, an_element_name)
			end
				-- First precedes.
			if not l_tokens.item (an_element_name).has (a_name) then
				l_tokens.item (an_element_name).force_new (a_model.is_token, a_name)
			end
		end

	token_on_start_tag (a_prefix: detachable STRING; a_local: STRING)
			-- Initialize at start tag.
		require
			a_local_not_void: a_local /= Void
		do
			element_tokens := Void
			if attached tokens as l_tokens and then l_tokens.has (dtd_name (a_prefix, a_local)) then
				element_tokens := l_tokens.item (dtd_name (a_prefix, a_local))
			end
		end

	forward_attribute (a_ns, a_prefix: detachable STRING; a_local, a_value: STRING)
			-- Push attributes, if attribute name already
			-- in list overwrite the value.
		require
			a_local_not_void: a_local /= Void
			a_value_not_void: a_value /= Void
		local
			a_string: STRING
			i, nb: INTEGER
		do
			if
				attached element_tokens as l_element_tokens and then
				l_element_tokens.has (dtd_name (a_prefix, a_local)) and then
				l_element_tokens.item (dtd_name (a_prefix, a_local))
			then
					-- Normalize value.
				a_string := STRING_.cloned_string (a_value)
					-- Within string
					-- Keep the first space of a repetition
					-- Should we also replace with a space character?
				nb := a_string.count
				from i := 2 until i > nb loop
					if is_space (a_string.code (i - 1)) and is_space (a_string.code (i)) then
						a_string.remove (i)
						nb := nb - 1
					else
						i := i + 1
					end
				end
					-- At ends of string.
				if a_string.count > 0 and then is_space (a_string.code (1)) then
					a_string.remove (1)
				end
				if a_string.count > 0 and then is_space (a_string.code (a_string.count)) then
					a_string.remove (a_string.count)
				end
			else
				a_string := a_value
			end
			next.on_attribute (a_ns, a_prefix, a_local, a_string)
		end

invariant

	has_default_value: attached defaults as l_defaults implies l_defaults.for_all (agent {DS_LIST [XM_DTD_ATTRIBUTE_CONTENT]}.for_all (agent {XM_DTD_ATTRIBUTE_CONTENT}.has_default_value))

end
