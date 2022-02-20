note

	description:

		"Objects that expand characters via character-maps."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_CHARACTER_MAP_EXPANDER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			notify_attribute, notify_characters
		end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_receiver: like base_receiver; a_character_map_list: DS_ARRAYED_LIST [DS_HASH_TABLE [STRING, INTEGER]]; a_use_null_characters: BOOLEAN)
			-- Establish invariant.
		require
			a_receiver_not_void: a_receiver /= Void
			a_character_map_list_not_void: a_character_map_list /= Void
			a_character_map_list_not_empty: not a_character_map_list.is_empty
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [DS_HASH_TABLE [STRING, INTEGER]]
			l_character_map: DS_HASH_TABLE [STRING, INTEGER]
			l_other_cursor: DS_HASH_TABLE_CURSOR [STRING, INTEGER]
		do
			base_receiver := a_receiver
			base_uri := a_receiver.base_uri
			are_null_characters_used := a_use_null_characters
			if a_character_map_list.count = 1 then
				character_map := a_character_map_list.item (1)
			else
				create character_map.make_with_equality_testers (10, string_equality_tester, Void)

				-- Now merge all character maps - later definitions override earlier ones

				from
					l_cursor := a_character_map_list.new_cursor; l_cursor.start
				until
					l_cursor.after
				loop
					if l_cursor.index = 1 then
						character_map.copy (l_cursor.item)
					else
						l_character_map := l_cursor.item
						from
							l_other_cursor := l_character_map.new_cursor; l_other_cursor.start
						until
							l_other_cursor.after
						loop
							character_map.force (l_other_cursor.item, l_other_cursor.key)
							l_other_cursor.forth
						end
					end
					l_cursor.forth
				variant
					a_character_map_list.count + 1 - l_cursor.index
				end
			end
		ensure
			base_receiver_set: base_receiver = a_receiver
			are_null_characters_used_set: are_null_characters_used = a_use_null_characters
		end

feature -- Events

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER)
			-- Notify an attribute.
		local
			l_value: STRING
		do
			if not is_output_escaping_disabled (a_properties) then
				l_value := mapped_string (a_value)
				if l_value = a_value then
					Precursor (a_name_code, a_type_code, a_value, a_properties)
				else
					Precursor (a_name_code, a_type_code, l_value, INTEGER_.bit_and (INTEGER_.bit_or (a_properties, Use_null_markers), INTEGER_.bit_not (No_special_characters)))
				end
			else
				Precursor (a_name_code, a_type_code, a_value, a_properties)
			end
		end

	notify_characters (a_chars: STRING; a_properties: INTEGER)
			-- Notify character data.
		local
			l_value: STRING
		do
			if not is_output_escaping_disabled (a_properties) then
				l_value := mapped_string (a_chars)
				if l_value = a_chars then
					Precursor (a_chars, a_properties)
				else
					Precursor (l_value, INTEGER_.bit_and (INTEGER_.bit_or (a_properties, Use_null_markers), INTEGER_.bit_not (No_special_characters)))
				end
			else
				Precursor (a_chars, a_properties)
			end
		end

feature {NONE} -- Implementation

	character_map: DS_HASH_TABLE [STRING, INTEGER]
			-- Character map used for expansion

	are_null_characters_used: BOOLEAN
			-- Should we surround expanded characters with ASCII NUL markers?

	mapped_string (a_unmapped_string: STRING): STRING
			-- Expanded version of `a_unmapped_string'
		require
			input_string_not_void: a_unmapped_string /= Void
		local
			l_index, l_code: INTEGER
			l_any_substitutions_made, l_disabled: BOOLEAN
		do
			create Result.make (a_unmapped_string.count)  -- it might be larger, but never smaller
			from
				l_index := 1
			until
				l_index > a_unmapped_string.count
			loop
				l_code := a_unmapped_string.code (l_index).to_integer_32
				if l_code = 0 then
					check
						null_characters_used: are_null_characters_used
						-- or there is a logic error in the XSLT library
					end

					-- toggle escape-disabling

					l_disabled := not l_disabled

					-- and retain the NUL to supress XML/HTML escaping

					Result := STRING_.appended_string (Result, "%U")
				elseif not l_disabled and then character_map.has (l_code) then
					if are_null_characters_used then
						Result := STRING_.appended_string (Result, "%U")
					end
					Result := STRING_.appended_string (Result, character_map.item (l_code))
					if are_null_characters_used then
						Result := STRING_.appended_string (Result, "%U")
					end
					l_any_substitutions_made := True
				else
					Result := STRING_.appended_string (Result, a_unmapped_string.substring (l_index, l_index))
				end
				l_index := l_index + 1
			variant
				a_unmapped_string.count + 1 - l_index
			end
			if not l_any_substitutions_made then

				-- Enable caller to detect no substitutions were performed

				Result := a_unmapped_string
			end
		end

invariant

	character_map_not_void: character_map /= Void

end
