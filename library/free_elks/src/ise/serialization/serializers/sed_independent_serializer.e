note
	description: "Encoding of arbitrary objects graphs between different version %
		%of programs containing the same types."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2013-06-27 12:21:14 +0000 (Thu, 27 Jun 2013) $"
	revision: "$Revision: 92746 $"

class
	SED_INDEPENDENT_SERIALIZER

obsolete
	"Use SED_RECOVERABLE_SERIALIZER instead."

inherit
	SED_BASIC_SERIALIZER
		redefine
			write_header, is_store_settings_enabled, set_version
		end

create
	make

feature {NONE} -- Status Report

	is_store_settings_enabled: BOOLEAN
			-- <Precursor>
		do
			Result := False
		end

feature {NONE} -- Implementation: Setting

	set_version (v: like version)
			-- <Precursor>
		do
				-- Artificially set to 5.6 as we are dropping support for this format in the future.
			version := {SED_VERSIONS}.version_5_6
		end

feature {NONE} -- Implementation

	write_header (a_list: ARRAYED_LIST [separate ANY]; a_type_table: HASH_TABLE [INTEGER, INTEGER])
			-- Write header of storable.
		local
			l_attr_dtype_table: like attributes_dynamic_types
			l_dtype: INTEGER
			l_ser: like serializer
			l_reflector: like reflector
			l_is_independent_serializer: BOOLEAN
		do
			l_ser := serializer
			l_reflector := reflector

				-- Store settings
			write_settings

			l_is_independent_serializer := not is_store_settings_enabled

				-- Record all types that are alive
				-- Keep track of other type of attributes for alive object
				-- (note that attributes that are expanded are added back to `a_type_table'
				-- as they are alive but not directly reachable).
			l_attr_dtype_table := attributes_dynamic_types (a_type_table)

				-- Write mapping dynamic type and their string representation for alive objects.
			from
					-- Write number of types being written
				l_ser.write_compressed_natural_32 (a_type_table.count.to_natural_32)
				a_type_table.start
			until
				a_type_table.after
			loop
					-- Write dynamic type
				l_dtype := a_type_table.item_for_iteration
				l_ser.write_compressed_natural_32 (l_dtype.to_natural_32)
					-- Write type name
				l_ser.write_string_8 (l_reflector.type_name_of_type (l_dtype))
				a_type_table.forth
					-- Write the storable version number for that type, but only
					-- if the format supports it.
				if not l_is_independent_serializer and then version >= {SED_VERSIONS}.version_6_6 then
					if attached l_reflector.storable_version_of_type (l_dtype) as l_version and then not l_version.is_empty then
						l_ser.write_boolean (True)
						l_ser.write_string_8 (l_version)
					else
						l_ser.write_boolean (False)
					end
				end
			end

				-- Write mapping dynamic type and their string representation for static type
				-- of attributes of alive objects. We do not store the version number because
				-- there is no instances of those types present in the storable.
			from
					-- Write number of types being written
				l_ser.write_compressed_natural_32 (l_attr_dtype_table.count.to_natural_32)
				l_attr_dtype_table.start
			until
				l_attr_dtype_table.after
			loop
					-- Write dynamic type
				l_dtype := l_attr_dtype_table.item_for_iteration
				l_ser.write_compressed_natural_32 (l_dtype.to_natural_32)
					-- Write type name
				l_ser.write_string_8 (l_reflector.type_name_of_type (l_dtype))
				l_attr_dtype_table.forth
			end

				-- Write attribute description mapping
			from
				l_ser.write_compressed_natural_32 (a_type_table.count.to_natural_32)
				a_type_table.start
			until
				a_type_table.after
			loop
					-- Write dynamic type
				l_dtype := a_type_table.item_for_iteration
				l_ser.write_compressed_natural_32 (l_dtype.to_natural_32)
					-- Write attributes description
				write_attributes (l_dtype)
				a_type_table.forth
			end

				-- Write object table if necessary.
			write_object_table (a_list)
		end

	attributes_dynamic_types (a_type_table: HASH_TABLE [INTEGER, INTEGER]): HASH_TABLE [INTEGER, INTEGER]
			-- Table of dynamic types of attributes appearing in `a_type_table'.
			-- If encountering an expanded type inside one of the type of `a_type_table',
			-- we add it to `a_type_table'.
		require
			a_type_table_not_void: a_type_table /= Void
		local
			l_reflector: like reflector
			i, nb: INTEGER
			l_dtype, l_obj_dtype: INTEGER
		do
			l_reflector := reflector
			from
				a_type_table.start
				create Result.make (500)
			until
				a_type_table.after
			loop
				from
					i := 1
					l_obj_dtype := a_type_table.item_for_iteration
					nb := l_reflector.field_count_of_type (l_obj_dtype)
					nb := nb + 1
				until
					i = nb
				loop
					if not l_reflector.is_field_transient_of_type (i, l_obj_dtype) then
						l_dtype := l_reflector.field_static_type_of_type (i, l_obj_dtype)
						if not a_type_table.has (l_dtype) then
								-- Only add types that are not already in `a_type_table' and
								-- if they are not expanded, otherwise add it to `a_type_table'.
							if l_reflector.is_field_expanded_of_type (i, l_obj_dtype) then
								a_type_table.put (l_dtype, l_dtype)
							else
								Result.put (l_dtype, l_dtype)
							end
						end
					end
					i := i + 1
				end
				a_type_table.forth
			end
		ensure
			attributes_dynamic_types_not_void: Result /= Void
		end

	write_attributes (a_dtype: INTEGER)
			-- Write attribute description for type whose dynamic type id is `a_dtype'.
		require
			a_dtype_non_negative: a_dtype >= 0
		local
			l_reflector: like reflector
			l_ser: like serializer
			i, nb: INTEGER
		do
			l_reflector := reflector
			l_ser := serializer
			from
				i := 1
				l_ser.write_compressed_natural_32 (l_reflector.persistent_field_count_of_type (a_dtype).to_natural_32)
				nb := l_reflector.field_count_of_type (a_dtype) + 1
			until
				i = nb
			loop
				if not l_reflector.is_field_transient_of_type (i, a_dtype) then
						-- Write attribute static type
					l_ser.write_compressed_natural_32 (l_reflector.field_static_type_of_type (i, a_dtype).to_natural_32)
						-- Write attribute name
					l_ser.write_string_8 (l_reflector.field_name_of_type (i, a_dtype))
				end
				i := i + 1
			end
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2013, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
