indexing

	description:

		"Objects that expand characters via character-maps."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_CHARACTER_MAP_EXPANDER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_character_map_list: DS_ARRAYED_LIST [DS_HASH_TABLE [STRING, INTEGER]]; use_null_characters: BOOLEAN) is
			-- Establish invariant.
		require
			at_least_one_map: a_character_map_list /= Void and then a_character_map_list.count > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [DS_HASH_TABLE [STRING, INTEGER]]
			a_character_map: DS_HASH_TABLE [STRING, INTEGER]
			another_cursor: DS_HASH_TABLE_CURSOR [STRING, INTEGER]
		do
			are_null_characters_used := use_null_characters
			if a_character_map_list.count = 1 then
				character_map := a_character_map_list.item (1)
			else
				create character_map.make_with_equality_testers (10, string_equality_tester, Void)

				-- Now merge all character maps - later definitions override earlier ones

				from
					a_cursor := a_character_map_list.new_cursor; a_cursor.start
				variant
					a_character_map_list.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if a_cursor.index = 1 then
						character_map.copy (a_cursor.item)
					else
						a_character_map := a_cursor.item
						from
							another_cursor := a_character_map.new_cursor; another_cursor.start
						until
							another_cursor.after
						loop
							character_map.force (another_cursor.item, another_cursor.key)
							another_cursor.forth
						end
					end
					a_cursor.forth
				end
			end
		end

feature -- Access

	mapped_string (an_unmapped_string: STRING): STRING is
			-- Expanded version of `an_unmapped_string'
		require
			input_string_not_void: an_unmapped_string /= Void
		local
			an_index, a_code: INTEGER
			were_any_substitutions_made, disabled: BOOLEAN
		do
			create Result.make (an_unmapped_string.count)  -- it might be larger, but never smaller
			from
				an_index := 1
			variant
				an_unmapped_string.count + 1 - an_index
			until
				an_index > an_unmapped_string.count
			loop
				a_code := an_unmapped_string.item_code (an_index)
				if a_code = 0 then
					check
						null_characters_used: are_null_characters_used
						-- or there is a logic error in the XSLT library
					end

					-- toggle escape-disabling

					disabled := not disabled

					-- and retain the NUL to supress XML/HTML escaping

					Result := STRING_.appended_string (Result, "%U")
				elseif not disabled and then character_map.has (a_code) then
					if are_null_characters_used then
						Result := STRING_.appended_string (Result, "%U")
					end
					Result := STRING_.appended_string (Result, character_map.item (a_code))
					if are_null_characters_used then
						Result := STRING_.appended_string (Result, "%U")
					end
					were_any_substitutions_made := True
				else
					Result := STRING_.appended_string (Result, an_unmapped_string.substring (an_index, an_index))
				end
				an_index := an_index + 1
			end
			if not were_any_substitutions_made then

				-- Enable caller to detect no substitutions were performed

				Result := an_unmapped_string
			end
		end

feature {NONE} -- Implementation

	character_map: DS_HASH_TABLE [STRING, INTEGER]
			-- Character map used for expansion

	are_null_characters_used: BOOLEAN
			-- Should we surround expanded characters with ASCII NUL markers?

invariant

	character_map_not_void: character_map /= Void

end
