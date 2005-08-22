indexing

	description:

		"Attribute collection for standard tree element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			create attribute_name_codes.make (5)
			create attribute_type_codes.make (5)
			create attribute_values.make (5)
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

	add_attribute (a_name_code, a_type_code: INTEGER; a_value: STRING) is
			-- Add an attribute.
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
			value_not_void: a_value /= Void
		local
			a_splitter: ST_SPLITTER
			some_idrefs: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			new_size: INTEGER
			another_type_code: like a_type_code
			all_idrefs: BOOLEAN
		do
			another_type_code := Untyped_atomic_type_code
			if not attribute_name_codes.extendible (1) then
				new_size := 2* attribute_name_codes.count
				attribute_name_codes.resize (new_size)
				attribute_type_codes.resize (new_size)
				attribute_values.resize (new_size)
				if attribute_ids /= Void then
					attribute_ids.resize (new_size)
				end
			end
			attribute_name_codes.put_last (a_name_code)
			attribute_type_codes.put_last (another_type_code)
			attribute_values.put_last (a_value)
			if a_type_code = Id_type_code or else a_type_code = Idref_type_code
				or else a_type_code = Idrefs_type_code then
				if attribute_ids = Void then
					create attribute_ids.make (attribute_name_codes.capacity)
				end

				-- The attribute is marked as being an ID/IDREF/IDREFS. But we don't trust it - it
				--  might come from a non-validating parser. Before adding it to the index, we
				--  check that it really is an ID/IDREF/IDREFS, and if it is an ID,
				--  that there is not already an ID with that value (this is checked when
				--  the id table is built)
				
				inspect
					a_type_code
				when Id_type_code then
					if is_ncname (a_value) then
						attribute_ids.put_last (Id_property)
					else
						attribute_ids.put_last (No_dtd_property)
					end
				when Idref_type_code then
					if is_ncname (a_value) then
						attribute_ids.put_last (Idrefs_property)
					else
						attribute_ids.put_last (No_dtd_property)
					end
				when Idrefs_type_code then
					create a_splitter.make
					some_idrefs := a_splitter.split (a_value)
					from
						all_idrefs := some_idrefs.count > 0
						a_cursor := some_idrefs.new_cursor; a_cursor.start
					until
						not all_idrefs or else a_cursor.after
					loop
						all_idrefs := is_ncname (a_cursor.item)
						a_cursor.forth
					end
					if all_idrefs then
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

feature {NONE} -- Implementation

	No_dtd_property: INTEGER is 0
	Id_property: INTEGER is 1
	Idrefs_property: INTEGER is 2

	-- The next four lists are quaruples - i.e. item number n in all three lists forms a triple

	attribute_ids: DS_ARRAYED_LIST [INTEGER]
			-- Are these ID, IDREF or IDREFS attributes?
	
	attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes of attributes

	attribute_type_codes: DS_ARRAYED_LIST [INTEGER]
			-- Type codes of attributes

	attribute_values: DS_ARRAYED_LIST [STRING]
			-- Values of attributes

	attribute_index (a_fingerprint: INTEGER): INTEGER is
			-- Index number of attribute with fingerprint `a_fingerprint'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			found: BOOLEAN
		do
			from
				a_cursor := attribute_name_codes.new_cursor
				a_cursor.start
			variant
				attribute_name_codes.count + 1 - a_cursor.index
			until
				found or else a_cursor.after
			loop
				if shared_name_pool.fingerprint_from_name_code (a_cursor.item) = a_fingerprint then
					found := true
					Result := a_cursor.index
				end
				a_cursor.forth
			end
			if not found then Result := -1 end
		ensure
			nearly_positive_result: Result > -2
		end

invariant

	attribute_name_codes_not_void: attribute_name_codes /= Void
	attribute_type_codes_not_void: attribute_type_codes /= Void
	attribute_values_not_void: attribute_values /= Void
	same_length: attribute_name_codes.count = attribute_type_codes.count and attribute_name_codes.count = attribute_values.count
	ids: attribute_ids /= Void implies attribute_name_codes.count = attribute_ids.count

end
	
