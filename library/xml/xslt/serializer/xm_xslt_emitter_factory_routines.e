indexing

	description:

		"Routines useful for implementing emitter factories."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_EMITTER_FACTORY_ROUTINES

inherit

	ANY

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

feature {NONE} -- Implementation

	character_map_expander (a_receiver: XM_XPATH_RECEIVER; a_properties: XM_XSLT_OUTPUT_PROPERTIES;
									a_character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER];
									a_null_characters_used: BOOLEAN): XM_XSLT_CHARACTER_MAP_EXPANDER is
			-- Character mapping filter
		require
			a_receiver_not_void: a_receiver /= Void
			a_properties_not_void: a_properties /= Void
			a_character_map_index: a_character_map_index /= Void
		local
			l_character_maps: DS_ARRAYED_LIST [STRING]
			l_character_map_list: DS_ARRAYED_LIST [DS_HASH_TABLE [STRING, INTEGER]]
			l_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			l_fingerprint: INTEGER
			l_character_map: DS_HASH_TABLE [STRING, INTEGER]
		do
			l_character_maps := a_properties.used_character_maps
			create l_character_map_list.make (l_character_maps.count)
			from
				l_cursor := l_character_maps.new_cursor; l_cursor.start
			until
				l_cursor.after
			loop
				l_fingerprint := shared_name_pool.fingerprint_from_expanded_name (l_cursor.item)
				check
					valid_character_map_fingerprint: l_fingerprint > -1
					character_map_compiled_in: a_character_map_index.has (l_fingerprint)
					-- These can only be justified with respect to code
					--  elsewhwere in the XSLT library, but they hold
					--  when `new_receiver' is called by {XM_XSLT_SERIALIZER}.selected_receiver
				end
				l_character_map := a_character_map_index.item (l_fingerprint)
				check
					valid_character_map: l_character_map /= Void
					-- ditto
				end
				l_character_map_list.put_last (l_character_map)
				l_cursor.forth
			variant
				l_character_maps.count + 1 - l_cursor.index
			end
			create Result.make (a_receiver, l_character_map_list, a_null_characters_used)
		ensure
			character_map_expander_not_void: Result /= Void
		end

end

