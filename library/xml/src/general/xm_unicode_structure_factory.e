note

	description:

		"Factories for structures allowing string polymorphism"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2018, Andreas Leitner and others"
	license: "MIT License"

class XM_UNICODE_STRUCTURE_FACTORY

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

feature -- Status report

	same_string (a_string, other: STRING): BOOLEAN
			-- Do the strings hold the same characters?
			-- (polymorphically safe)
		require
			a_string_not_void: a_string /= Void
			other_not_void: other /= Void
		do
			Result := string_equality_tester.test (a_string, other)
		end

feature -- General structures

	new_string_set: DS_HASH_SET [STRING]
			-- New string set
		do
			create Result.make_default
			Result.set_equality_tester (string_equality_tester)
		ensure
			set_not_void: Result /= Void
			equality_tester: Result.equality_tester = string_equality_tester
		end

	new_string_bilinked_list: DS_BILINKED_LIST [STRING]
			-- New string list
		do
			create Result.make
			Result.set_equality_tester (string_equality_tester)
		ensure
			list_not_void: Result /= Void
			equality_tester: Result.equality_tester = string_equality_tester
		end

	new_string_arrayed_list: DS_ARRAYED_LIST [STRING]
			-- New string list
		do
			create Result.make_default
			Result.set_equality_tester (string_equality_tester)
		ensure
			list_not_void: Result /= Void
			equality_tester: Result.equality_tester = string_equality_tester
		end

	new_string_stack: DS_LINKED_STACK [STRING]
			-- New string stack
		do
			create Result.make_default
		ensure
			stack_not_void: Result /= Void
		end

	new_string_queue: DS_LINKED_QUEUE [STRING]
			-- New string queue
		do
			create Result.make
		ensure
			queue_not_void: Result /= Void
		end

	new_detachable_string_queue: DS_LINKED_QUEUE [detachable STRING]
			-- New queue of detachable strings
		do
			create Result.make
		ensure
			queue_not_void: Result /= Void
		end

	new_string_string_table: DS_HASH_TABLE [STRING, STRING]
			-- New table of strings
		do
			create Result.make_map_default
			Result.set_key_equality_tester (string_equality_tester)
			Result.set_equality_tester (string_equality_tester)
		ensure
			table_not_void: Result /= Void
			equality_tester: Result.equality_tester = string_equality_tester
			key_tester:  Result.key_equality_tester = string_equality_tester
		end

feature -- Specialized structures

	new_tokens_table: DS_HASH_TABLE [DS_HASH_TABLE [BOOLEAN, STRING], STRING]
			-- New tokens table
		do
			create Result.make_map_default
			Result.set_key_equality_tester (string_equality_tester)
		ensure
			table_not_void: Result /= Void
			equality_tester: Result.key_equality_tester = string_equality_tester
		end

	new_boolean_string_table: DS_HASH_TABLE [BOOLEAN, STRING]
			-- New boolean table
		do
			create Result.make_map_default
			Result.set_key_equality_tester (string_equality_tester)
		ensure
			table_not_void: Result /= Void
			equality_tester: Result.key_equality_tester = string_equality_tester
		end

	new_dtd_attribute_content_list_table: DS_HASH_TABLE [DS_LIST [XM_DTD_ATTRIBUTE_CONTENT], STRING]
			-- New attribute content table
		do
			create Result.make_map_default
			Result.set_key_equality_tester (string_equality_tester)
		ensure
			table_not_void: Result /= Void
			equality_tester: Result.key_equality_tester = string_equality_tester
		end

end
