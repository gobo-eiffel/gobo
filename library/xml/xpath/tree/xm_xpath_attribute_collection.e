indexing

	description:

		"Attribute collection for standard tree element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATTRIBUTE_COLLECTION

creation

	make

	
feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Establish invariant.
		require
			name_pool_not_void: a_name_pool /= Void
		do
			name_pool := a_name_pool
			create attribute_name_codes.make (5)
			create attribute_type_codes.make (5)
			create attribute_values.make (5)
		ensure
			name_pool_set: name_pool = a_name_pool
		end

feature -- Access

	name_pool: XM_XPATH_NAME_POOL
			--Name pool in which the attribute names are defined

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
			a_fingerprint := name_pool.fingerprint (a_uri, a_local_name)
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
			valid_name_code: name_pool.is_valid_name_code (a_name_code)
			value_not_void: a_value /= Void
		local
			new_size: INTEGER
		do
			if not attribute_name_codes.extendible (1) then
				new_size := 2* attribute_name_codes.count
				attribute_name_codes.resize (new_size)
				attribute_type_codes.resize (new_size)
				attribute_values.resize (new_size)
			end
			attribute_name_codes.put_last (a_name_code)
			attribute_type_codes.put_last (a_type_code)
			attribute_values.put_last (a_value)
		ensure
			attribute_name_code_added: attribute_name_codes.has (a_name_code)
			attribute_type_code_added: attribute_type_codes.has (a_type_code)
			attribute_value_added: attribute_values.has (a_value)
		end

feature {NONE} -- Implementation

	-- The next three lists are triples - i.e. item number n in all three lists forms a triple
	
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
				if name_pool.fingerprint_from_name_code (a_cursor.item) = a_fingerprint then
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

	name_pool_not_void: name_pool /= Void
	attribute_name_codes_not_void: attribute_name_codes /= Void
	attribute_type_codes_not_void: attribute_type_codes /= Void
	attribute_values_not_void: attribute_values /= Void
	same_length: attribute_name_codes.count = attribute_type_codes.count and attribute_type_codes.count = attribute_values.count

end
	
