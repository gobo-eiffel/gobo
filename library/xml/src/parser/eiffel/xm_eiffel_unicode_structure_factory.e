note

	description:

		"Factories for structures allowing string polymorphism"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Andreas Leitner and others"
	license: "MIT License"

class XM_EIFFEL_UNICODE_STRUCTURE_FACTORY

inherit

	XM_UNICODE_STRUCTURE_FACTORY

feature -- Specialized structures

	new_entities_table: DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING]
			-- New entities table
		do
			create Result.make_map_default
			Result.set_key_equality_tester (string_equality_tester)
		ensure
			entities_tale_not_void: Result /= Void
			equality_tester: Result.key_equality_tester = string_equality_tester
		end

end
