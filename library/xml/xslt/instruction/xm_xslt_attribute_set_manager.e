indexing

	description:

		"Objects that manage compiled attribute sets"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ATTRIBUTE_SET_MANAGER

inherit

	XM_XPATH_SHARED_NAME_POOL

create

	make

feature {NONE} -- Initialization

	make is
			-- Initializate `Current'.
		do
			create attribute_set_table.make_default
		end

feature -- Access

	has (a_name_code: INTEGER): BOOLEAN is
			-- Does `Current' have an attribute set named by `a_name_code'?
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
		do
			Result := attribute_set_table.has (a_name_code)
		end

	attribute_sets (a_name_code: INTEGER): DS_LINKED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET] is
			-- All partial attribute sets named by `a_name_code'
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
			has_attribute_set: has (a_name_code)
		do
			Result := attribute_set_table.item (a_name_code)
		ensure
			attribute_sets_not_empty: Result /= Void and then not Result.is_empty
		end

feature -- Element change

	add_attributes (a_attribute_set: XM_XSLT_COMPILED_ATTRIBUTE_SET; a_name_code: INTEGER) is
			-- Add attributes defined in `a_attribute_set' to set named by `a_name_code'.
		require
			a_attribute_set_not_void: a_attribute_set /= Void
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
			not_already_present: has (a_name_code) implies not attribute_sets (a_name_code).has (a_attribute_set)
		local
			a_list: DS_LINKED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET]
		do
			if has (a_name_code) then
				a_list := attribute_sets (a_name_code)
			else
				create a_list.make_default
				attribute_set_table.force_new (a_list, a_name_code)
			end
			a_list.put_last (a_attribute_set)
		ensure
			attributes_added: has (a_name_code) and then attribute_sets (a_name_code).has (a_attribute_set)
		end

feature {NONE} -- Implementation

	attribute_set_table: DS_HASH_TABLE [DS_LINKED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET], INTEGER]
			-- Table of linked attribute sets

invariant

	attribute_set_table_not_void: attribute_set_table /= Void

end

	
