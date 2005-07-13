indexing

	description:
	
		"Fill default attribute values"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

	-- TODO: forward namespaces (currently problem with void in list)
	-- if namespaces are used this filter should be before the
	-- namespace resolver if default attribute namespaces are
	-- to be resolved.

class XM_ATTRIBUTE_DEFAULT_FILTER

inherit

	XM_DTD_CALLBACKS

	XM_CALLBACKS_FILTER
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

	make_null,
	set_next
	
feature -- DTD

	on_doctype (name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
		end

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		do
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			a_sub: DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]
		do
				-- Default attribute values.
			if a_model.has_default_value then
				if defaults = Void then
					defaults := new_dtd_attribute_content_list_table
				end
				if not defaults.has (an_element_name) then
					create a_sub.make_default
					defaults.force_new (a_sub, an_element_name)
				end
					-- First declaration is binding.
				if not has_attribute (defaults.item (an_element_name),a_name) then
					defaults.item (an_element_name).force_last (a_model)
				end
			end
				-- NMTOKEN values.
			token_on_attribute_declaration (an_element_name, a_name, a_model)
		end

	on_entity_declaration (entity_name: STRING; is_parameter: BOOLEAN; value: STRING;
		an_id: XM_DTD_EXTERNAL_ID; notation_name: STRING) is
			-- Entity declaration.
		do
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
		end
		
	on_dtd_comment (a_comment: STRING) is
			-- Comment.
		do
		end
		
	on_dtd_processing_instruction (a_target: STRING; a_content: STRING) is
			-- PI.
		do
		end
		
	on_dtd_end is
			-- Last DTD event.
		do
		end

feature {NONE} -- DTD implementation

	defaults: DS_HASH_TABLE [DS_LIST [XM_DTD_ATTRIBUTE_CONTENT], STRING]
			-- Attributes defaults

	has_attribute (a_sub: DS_LIST [XM_DTD_ATTRIBUTE_CONTENT]; a_name: STRING): BOOLEAN is
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

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
			-- Store name of current element.
		local
			it: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			reset_attributes
			if defaults /= Void and then defaults.has (dtd_name (a_prefix, a_local_part)) then
				it := defaults.item (dtd_name (a_prefix, a_local_part)).new_cursor
				from it.start until it.after loop
					push_attribute (Void,
						dtd_prefix (it.item.name),
						dtd_local (it.item.name),
						it.item.default_value)
					it.forth
				end
			end
			token_on_start_tag (a_prefix, a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
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

	on_start_tag_finish is
			-- Issue default attributes.
		do
			pop_attributes
			Precursor
		end

feature {NONE} -- Attribute queue

	reset_attributes is
			-- Clear attributes queue.
		do
			namespaces := Void
			names := Void
			values := Void
		end

	is_space (a: INTEGER): BOOLEAN is
			-- Is this a space character?
		do
			Result := a = Lf_char.code
				or a = Cr_char.code
				or a = Tab_char.code
				or a = Space_char.code
		end

	push_attribute (a_ns, a_prefix, a_local, a_value: STRING) is
			-- Push attributes, if attribute name already
			-- in list overwrite the value.
		local
			found: BOOLEAN
			i, nb: INTEGER
		do
				-- Create structure if not.
			if names = Void then
				namespaces := new_string_arrayed_list
				names := new_string_arrayed_list
				values := new_string_arrayed_list
			end
				-- Replace existing attribute.
			nb := names.count
			from i := 1 until i > nb loop
				if same_string (dtd_name (a_prefix, a_local), names.item (i)) then
					values.replace (a_value, i)
					found := True
				end
				i := i + 1
			end
			if not found then
				--namespaces.force_last (a_ns)
				names.force_last (a_local)
				values.force_last (a_value)
			end
		end

	pop_attributes is
			-- Pop attributes queued.
		local
			i, nb: INTEGER
		do
			if names /= Void then
				nb := names.count
				from i := 1 until i > nb loop
					forward_attribute (Void, --namespaces.item (i),
						dtd_prefix (names.item (i)),
						dtd_local (names.item (i)),
						values.item (i))
					i := i + 1
				end
			end
		end

	namespaces, names, values: DS_LIST [STRING]
			-- Mean version of DS_ARRAYED_LIST [ATTRIBUTE_EVENT]

feature {NONE} -- Content implementation

	dtd_name (a_prefix, a_local: STRING): STRING is
			-- Name for DTD (without namespaces)
		require
			a_local_not_void: a_local /= Void
		do
			if has_prefix (a_prefix) then
				Result := STRING_.concat (a_prefix, Prefix_separator)
				Result := STRING_.appended_string (Result, a_local)
			else
				Result := a_local
			end
		ensure
			dtd_name_not_void: Result /= Void
			no_prefix_same: not has_prefix (a_prefix) implies (Result = a_local)
		end
	
	dtd_prefix (a_dtd_name: STRING): STRING is
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

	dtd_local (a_dtd_name: STRING): STRING is
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

	Colon_char: CHARACTER is
			-- Colon char
		once
			Result := Prefix_separator.item (1)
		end

feature {NONE} -- Tokens implementation

	tokens: DS_HASH_TABLE [DS_HASH_TABLE [BOOLEAN, STRING], STRING]
			-- NMTOKENs for space normalisation, table of
			-- is_token for (element, attribute).

	element_tokens: DS_HASH_TABLE [BOOLEAN, STRING]
			-- Set of token attributes for current element.

	token_on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			a_token_sub: like element_tokens
		do
				-- NMTOKEN values.
			if tokens = Void then
				tokens := new_tokens_table
			end
			if not tokens.has (an_element_name) then
				a_token_sub := new_boolean_string_table
				tokens.force_new (a_token_sub, an_element_name)
			end
				-- First precedes.
			if not tokens.item (an_element_name).has (a_name) then
				tokens.item (an_element_name).force_new (a_model.is_token, a_name)
			end
		end

	token_on_start_tag (a_prefix, a_local: STRING) is
			-- Initialize at start tag.
		do
			element_tokens := Void
			if tokens /= Void and then tokens.has (dtd_name (a_prefix, a_local)) then
				element_tokens := tokens.item (dtd_name (a_prefix, a_local))
			end
		end

	forward_attribute (a_ns, a_prefix, a_local, a_value: STRING) is
			-- Push attributes, if attribute name already
			-- in list overwrite the value.
		require
			a_value_not_void: a_value /= Void
		local
			a_string: STRING
			i, nb: INTEGER
		do
			if
				element_tokens /= Void and then
				element_tokens.has (dtd_name (a_prefix, a_local)) and then
				element_tokens.item (dtd_name (a_prefix, a_local))
			then
					-- Normalize value.
				a_string := STRING_.cloned_string (a_value)
					-- Within string
					-- Keep the first space of a repetition
					-- Should we also replace with a space character?
				nb := a_string.count
				from i := 2 until i > nb loop
					if is_space (a_string.item_code (i - 1)) and is_space (a_string.item_code (i)) then
						a_string.remove (i)
						nb := nb - 1
					else
						i := i + 1
					end
				end
					-- At ends of string.
				if a_string.count > 0 and then is_space (a_string.item_code (1)) then
					a_string.remove (1)
				end
				if a_string.count > 0 and then is_space (a_string.item_code (a_string.count)) then
					a_string.remove (a_string.count)
				end
			else
				a_string := a_value
			end
			next.on_attribute (a_ns, a_prefix, a_local, a_string)
		end

end
