note
	description: "Encoding of arbitrary objects graphs between sessions of a same program."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2020-05-19 14:29:33 +0000 (Tue, 19 May 2020) $"
	revision: "$Revision: 104259 $"

class
	SED_BASIC_SERIALIZER

inherit
	SED_SESSION_SERIALIZER
		redefine
			write_header
		end

create
	make

feature {NONE} -- Implementation

	write_header (a_list: ARRAYED_LIST [separate ANY]; a_type_table: HASH_TABLE [INTEGER, INTEGER])
			-- Write header of storable.
		local
			l_ser: like serializer
			l_reflector: like reflector
			l_dtype: INTEGER
		do
				-- Store settings.
			write_settings

				-- We write some type description in case the dynamic types changes between two runs of the same
				-- program.
			l_ser := serializer
			from
				l_reflector := reflector
				l_ser.write_compressed_natural_32 (a_type_table.count.to_natural_32)
				a_type_table.start
			until
				a_type_table.after
			loop
					-- Write dynamic type
				l_dtype := a_type_table.item_for_iteration
				l_ser.write_compressed_natural_32 (l_dtype.to_natural_32)
					-- Write type name
				l_ser.write_string_8 (l_reflector.type_name_8_of_type (l_dtype))
				a_type_table.forth
			end

			write_object_table (a_list)
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2020, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
