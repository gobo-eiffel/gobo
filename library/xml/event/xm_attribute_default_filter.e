indexing

	description:
	
		"Fill default attribute values"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
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
	
	XM_MARKUP_CONSTANTS
		export {NONE} all end
	
creation

	make_null,
	set_next
	
feature -- DTD

	on_doctype (name: UC_STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
		end

	on_element_declaration (a_name: UC_STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
			-- Element declaration.
		do
		end

	on_attribute_declaration (an_element_name, a_name: UC_STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			a_sub: DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]
		do
			-- default attribute values
			if a_model.has_default_value then
				if defaults = Void then
					!! defaults.make_default
				end

				if not defaults.has (an_element_name) then
					!! a_sub.make_default
					defaults.force_new (a_sub, an_element_name)
				end
				
				-- first declaration is binding
				if not has_attribute (defaults.item (an_element_name),a_name) then
					defaults.item (an_element_name).force_last (a_model)
				end
			end
			
			-- NMTOKEN values
			token_on_attribute_declaration (an_element_name, a_name, a_model)
		end

	on_entity_declaration (entity_name: UC_STRING; is_parameter: BOOLEAN; value: UC_STRING; 
			an_id: XM_DTD_EXTERNAL_ID; notation_name: UC_STRING) is
			 -- Entity declaration.
		do
		end

	on_notation_declaration (notation_name: UC_STRING; an_id: XM_DTD_EXTERNAL_ID) is
			-- Notation declaration.
		do
		end
		
feature {NONE} -- DTD implementation

	defaults: DS_HASH_TABLE [DS_LIST [XM_DTD_ATTRIBUTE_CONTENT], UC_STRING]
			-- Attributes defaults.
			
	has_attribute (a_sub: DS_LIST [XM_DTD_ATTRIBUTE_CONTENT]; a_name: UC_STRING): BOOLEAN is
			-- Has element level attribute?
		require
			not_void: a_sub /= Void
			name_not_void: a_name /= Void
		local
			it: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			from
				it := a_sub.new_cursor
				it.start
			until
				it.after
			loop
				if it.item.name.is_equal (a_name) then
					Result := true
					it.go_after
				else
					it.forth
				end
			end
		end
			
feature -- Content

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Start of start tag.
			-- Store name of current element.
		local
			it: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			reset_attributes
			if defaults /= Void and then defaults.has (dtd_name (a_prefix, a_local_part)) then
				from
					it := defaults.item (dtd_name (a_prefix, a_local_part)).new_cursor
					it.start
				until
					it.after
				loop
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

	on_attribute (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING;
				a_value: UC_STRING) is
			-- Remove from defaults attributes which are explicitely
			-- declared.
		do
			if namespaces = Void then
				-- no defaulting necessary
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
			prefixes := Void
			locals := Void
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
		
	push_attribute (a_ns, a_prefix, a_local, a_value: UC_STRING) is
			-- Push attributes, if attribute name already 
			-- in list overwrite the value.
		local
			found: BOOLEAN
			i: INTEGER
		do
			-- create structure if not
			if namespaces = Void then
				!! namespaces.make_default
				!! prefixes.make_default
				!! locals.make_default
				!! values.make_default
			end
			
			-- replace existing attribute
			from
				i := 1 
			until
				i > namespaces.count
			loop
				if equal (a_prefix, prefixes.item (i))
					and a_local.is_equal (locals.item (i))
				then
					values.replace (a_value, i)
					found := True
				end 
				i := i + 1
			end
			
			if not found then
				namespaces.force_last (a_ns)
				prefixes.force_last (a_prefix)
				locals.force_last (a_local)
				values.force_last (a_value)
			end
		end
	
	pop_attributes is
			-- Pop attributes queued.
		local
			i: INTEGER
		do
			if namespaces /= Void then
				from
					i := 1
				until
					i > namespaces.count
				loop
					forward_attribute (namespaces.item (i),
							prefixes.item (i),
							locals.item (i),
							values.item (i))
					i := i + 1
				end
			end
		end
		
	namespaces, locals, prefixes, values: DS_ARRAYED_LIST [UC_STRING]
			-- Mean version of DS_ARRAYED_LIST [ATTRIBUTE_EVENT]
		
feature {NONE} -- Content implementation

	dtd_name (a_prefix, a_local: UC_STRING): UC_STRING is
			-- Name for DTD (without namespaces).
		require
			a_local_not_void: a_local /= Void
		do
			if has_prefix (a_prefix) then
				Result := new_unicode_string ("")
				Result.append_string (a_prefix)
				Result.append_character (Colon_char)
				Result.append_string (a_local)
			else
				Result := a_local
			end
		ensure
			not_void: Result /= Void
			no_prefix_same: not has_prefix (a_prefix) implies (Result = a_local) 
		end
	
	dtd_prefix (a: UC_STRING): UC_STRING is
			-- Prefix from a DTD name.
		require
			a_not_void: a /= Void
		do
			if a.index_of (Colon_char, 1) > 0 then
				Result := a.substring (1, a.index_of (Colon_char,1) - 1)
			end
		end
		
	dtd_local (a: UC_STRING): UC_STRING is
			-- Local part from a DTD name.
		require
			a_not_void: a /= Void
		do
			if a.index_of (Colon_char, 1) > 0 then
				Result := a.substring (a.index_of (Colon_char,1) + 1, a.count)
			else
				Result := a
			end
		end
		
	Colon_char: UC_CHARACTER is
			-- Colon char
		once
			Result := new_unicode_string (Prefix_separator).item (1)
		end
		
feature {NONE} -- Tokens implementation

	tokens: DS_HASH_TABLE [DS_HASH_TABLE [BOOLEAN, UC_STRING], UC_STRING]
			-- NMTOKENs for space normalisation.
			
	element_tokens: DS_HASH_TABLE [BOOLEAN, UC_STRING]
			-- Set of token attributes for current element.
			
	token_on_attribute_declaration (an_element_name, a_name: UC_STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		local
			a_token_sub: like element_tokens
		do
			-- NMTOKEN values
			if tokens = Void then
				!! tokens.make_default
			end
			if not tokens.has (an_element_name) then
				!! a_token_sub.make_equal (0)
				tokens.force_new (a_token_sub, an_element_name)
			end
			-- first precedes
			if not tokens.item (an_element_name).has (a_name) then
				tokens.item (an_element_name).force_new (a_model.is_token, a_name)
			end
		end
		
	token_on_start_tag (a_prefix, a_local: UC_STRING) is
			-- Initialise at start tag.
		do
			element_tokens := Void
			if tokens /= Void and then tokens.has (dtd_name (a_prefix, a_local)) then
				element_tokens := tokens.item (dtd_name (a_prefix, a_local))
			end
		end
		
	forward_attribute (a_ns, a_prefix, a_local, a_value: UC_STRING) is
			-- Push attributes, if attribute name already 
			-- in list overwrite the value.
		local
			a_string: UC_STRING
			i: INTEGER
		do
			if element_tokens /= Void and then
				element_tokens.has (dtd_name (a_prefix, a_local)) and then
					element_tokens.item (dtd_name (a_prefix, a_local))
			then
				-- normalize value
				a_string := clone (a_value)

				-- within string
				-- keep the first space of a repetition
				-- should we also replace with a space character?
				from
					i := 2
				until
					i > a_string.count
				loop
					if is_space (a_string.item (i - 1).code) 
							and is_space (a_string.item (i).code)
					then
						a_string.remove (i)
					else
						i := i + 1
					end
				end
				
				-- at end of string
				if a_string.count > 0 
						and then is_space (a_string.item (1).code) 
				then
					a_string.remove (1)
				end
				if a_string.count > 0
						and then is_space (a_string.item (a_string.count).code)
				then
					a_string.remove (a_string.count)
				end
			else
				a_string := a_value
			end
				
			next.on_attribute (a_ns, a_prefix, a_local, a_string)
		end
		
end
