indexing

	description:

		"Routines useful for implementing emitter factories."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_EMITTER_FACTORY_ROUTINES

inherit

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

feature {NONE} -- Implementation

	character_map_expander (some_properties: XM_XSLT_OUTPUT_PROPERTIES;
									a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER];
									null_characters_used: BOOLEAN): XM_XSLT_CHARACTER_MAP_EXPANDER is
			-- Optional character map expander
		require
			properties_not_void: some_properties /= Void
			character_map_index: some_properties.used_character_maps.count > 0 implies a_character_map_index /= Void
		local
			some_character_maps: DS_ARRAYED_LIST [STRING]
			a_character_map_list: DS_ARRAYED_LIST [DS_HASH_TABLE [STRING, INTEGER]]
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_fingerprint: INTEGER
			a_character_map: DS_HASH_TABLE [STRING, INTEGER]
		do
			some_character_maps := some_properties.used_character_maps
			if some_character_maps.count > 0 then
				create a_character_map_list.make (some_character_maps.count)
				from
					a_cursor := some_character_maps.new_cursor; a_cursor.start
				variant
					some_character_maps.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_fingerprint := shared_name_pool.fingerprint_from_expanded_name (a_cursor.item)
					check
						valid_character_map_fingerprint: a_fingerprint > -1
						character_map_compiled_in: a_character_map_index.has (a_fingerprint)
						-- These can only be justified with respect to code
						--  elsewhwere in the XSLT library, but they hold
						--  when `new_receiver' is called by {XM_XSLT_TRANSFORMER}.selected_receiver
					end
					a_character_map := a_character_map_index.item (a_fingerprint)
					check
						valid_character_map: a_character_map /= Void
						-- ditto
					end
					a_character_map_list.put_last (a_character_map)
					a_cursor.forth
				end
				create Result.make (a_character_map_list, null_characters_used)
			end
		ensure
			maybe_void: True
		end

end
	
