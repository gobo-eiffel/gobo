indexing

	description:

		"Attribute collection for standard tree element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATTRIBUTE_COLLECTION

inherit
	
	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

create

	make

	
feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create attribute_name_codes.make (Size_increment)
			create attribute_type_codes.make (Size_increment)
			create attribute_values.make (Size_increment)
			create internal_attribute_properties.make (Size_increment)
		end

feature -- Access

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		local
			an_index: INTEGER
		do
			an_index := attribute_index (a_fingerprint)
			if an_index /= -1 then
				Result := attribute_values.item (an_index)
			end
		end
	
	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := shared_name_pool.fingerprint (a_uri, a_local_name)
			if a_fingerprint /= -1 then
				Result := attribute_value (a_fingerprint)
			end
		end

	attribute_value_by_index (an_attribute_index: INTEGER): STRING is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_values.item (an_attribute_index)
		ensure
			attribute_value_not_void: Result /= Void
		end

	attribute_name_code (an_attribute_index: INTEGER): INTEGER is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_name_codes.item (an_attribute_index)
		end

	attribute_type_code (an_attribute_index: INTEGER): INTEGER is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_type_codes.item (an_attribute_index)
		end

	attribute_properties (a_attribute_index: INTEGER): INTEGER is
		-- Event properties associated with attribute
		require
			valid_attribute_index: is_attribute_index_valid (a_attribute_index)
		do
			Result := internal_attribute_properties.item (a_attribute_index)
		ensure
			definition: Result = internal_attribute_properties.item (a_attribute_index)
		end

	is_id (an_attribute_index: INTEGER): BOOLEAN is
		-- Is the is-id property set?
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_ids /= Void and then attribute_ids.item (an_attribute_index) = Id_property
		end

	is_idrefs (an_attribute_index: INTEGER): BOOLEAN is
			-- Is the is-idrefs property set?
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_ids /= Void and then attribute_ids.item (an_attribute_index) = Idrefs_property
		end

	name_code_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER] is
			-- A cursor over the name codes
		do
			Result := attribute_name_codes.new_cursor
		end

feature -- Measurement

	number_of_attributes: INTEGER is
			-- Number of attributes in `Current'
		do
			Result := attribute_name_codes.count
		ensure
			positive_result: Result >= 0
		end

feature -- Status report
	
	is_attribute_index_valid (an_attribute_index: INTEGER): BOOLEAN is
		do
			Result := an_attribute_index > 0 and then an_attribute_index <= attribute_values.count
		end

feature -- Element change

	add_attribute (a_name_code, a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER) is
			-- Add an attribute.
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
			value_not_void: a_value /= Void
		local
			l_splitter: ST_SPLITTER
			l_idrefs: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			i: INTEGER
			l_type_code: like a_type_code
			l_all_idrefs: BOOLEAN
			l_value: STRING
		do
			l_type_code := Untyped_atomic_type_code
			ensure_extensible
			attribute_name_codes.put_last (a_name_code)
			attribute_type_codes.put_last (l_type_code)
			attribute_values.put_last (a_value)
			internal_attribute_properties.put_last (a_properties)
			if a_type_code = Id_type_code or a_type_code = Idref_type_code or a_type_code = Idrefs_type_code then
				if attribute_ids = Void then
					create attribute_ids.make (attribute_name_codes.capacity)
					from i:= 1 until i = attribute_name_codes.count loop
						attribute_ids.put_last (No_dtd_property)
						i := i + 1
					end
				end

				-- The attribute is marked as being an ID/IDREF/IDREFS. But we don't trust it - it
				--  might come from a non-validating parser. Before adding it to the index, we
				--  check that it really is an ID/IDREF/IDREFS, and if it is an ID,
				--  that there is not already an ID with that value (this is checked when
				--  the id table is built)

				l_value := STRING_.cloned_string (a_value)
				STRING_.left_adjust (l_value)
				STRING_.right_adjust (l_value)
				inspect
					a_type_code
				when Id_type_code then
					if is_ncname (l_value) then
						attribute_ids.put_last (Id_property)
					else
						attribute_ids.put_last (No_dtd_property)
					end
				when Idref_type_code then
					if is_ncname (l_value) then
						attribute_ids.put_last (Idrefs_property)
					else
						attribute_ids.put_last (No_dtd_property)
					end
				when Idrefs_type_code then
					create l_splitter.make
					l_idrefs := l_splitter.split (a_value)
					from
						l_all_idrefs := l_idrefs.count > 0
						l_cursor := l_idrefs.new_cursor; l_cursor.start
					until
						not l_all_idrefs or else l_cursor.after
					loop
						l_all_idrefs := is_ncname (l_cursor.item)
						l_cursor.forth
					end
					if l_all_idrefs then
						attribute_ids.put_last (Idrefs_property)
					else
						attribute_ids.put_last (No_dtd_property)
					end
				end
			elseif attribute_ids /= Void then
				attribute_ids.put_last (No_dtd_property)
			end
		ensure
			attribute_name_code_added: attribute_name_codes.has (a_name_code)
			attribute_value_added: attribute_values.has (a_value)
		end

feature -- Removal

	wipe_out is
			-- Clear all arrayed lists.
		do
			attribute_values.wipe_out
			attribute_name_codes.wipe_out
			attribute_type_codes.wipe_out
			internal_attribute_properties.wipe_out
			if attribute_ids /= Void then
				attribute_ids.wipe_out
			end
		end

feature {NONE} -- Implementation

	Size_increment: INTEGER is 4
			-- Allocation extent size for all arrays

	No_dtd_property: INTEGER is 0
	Id_property: INTEGER is 1
	Idrefs_property: INTEGER is 2

	-- The next five lists are quintuples - i.e. item number n in all four lists forms a quintuple

	attribute_ids: DS_ARRAYED_LIST [INTEGER]
			-- Are these ID, IDREF or IDREFS attributes?
	
	attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes of attributes

	attribute_type_codes: DS_ARRAYED_LIST [INTEGER]
			-- Type codes of attributes

	attribute_values: DS_ARRAYED_LIST [STRING]
			-- Values of attributes

	internal_attribute_properties: DS_ARRAYED_LIST [INTEGER]
			-- Event properties associated with attribute

	ensure_extensible is
			-- Ensure 1 attribute may be added.
		local
			l_new: INTEGER
		do
			if not attribute_name_codes.extendible (1) then
				l_new := attribute_name_codes.count + Size_increment
				attribute_name_codes.resize (l_new)
				attribute_type_codes.resize (l_new)
				attribute_values.resize (l_new)
				internal_attribute_properties.resize (l_new)
				if attribute_ids /= Void then
					attribute_ids.resize (l_new)
				end
			end
		ensure
			attribute_ids_extendible: attribute_ids /= Void implies attribute_ids.extendible (1)
			attribute_name_codes_extendible: attribute_name_codes.extendible (1)
			attribute_type_codes_extendible: attribute_type_codes.extendible (1)
			attribute_values_extendible: attribute_values.extendible (1)
			internal_attribute_properties_extendible: internal_attribute_properties.extendible (1)
		end

	attribute_index (a_fingerprint: INTEGER): INTEGER is
			-- Index number of attribute with fingerprint `a_fingerprint'
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			found: BOOLEAN
		do
			from
				l_cursor := attribute_name_codes.new_cursor
				l_cursor.start
			variant
				attribute_name_codes.count + 1 - l_cursor.index
			until
				found or else l_cursor.after
			loop
				if shared_name_pool.fingerprint_from_name_code (l_cursor.item) = a_fingerprint then
					found := true
					Result := l_cursor.index
				end
				l_cursor.forth
			end
			if not found then Result := -1 end
		ensure
			nearly_positive_result: Result > -2
		end

invariant

	attribute_name_codes_not_void: attribute_name_codes /= Void
	attribute_type_codes_not_void: attribute_type_codes /= Void
	attribute_values_not_void: attribute_values /= Void
	internal_attribute_properties_not_void: internal_attribute_properties /= Void
	same_length: attribute_name_codes.count = attribute_type_codes.count
		and attribute_name_codes.count = attribute_values.count
		and internal_attribute_properties.count = attribute_values.count
	ids: attribute_ids /= Void implies attribute_name_codes.count = attribute_ids.count

end
	
