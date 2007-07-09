indexing

	description:

		"Eiffel entity declarations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ENTITY_DECLARATION

inherit

	ET_AST_NODE

feature -- Access

	name: ET_IDENTIFIER is
			-- Name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE is
			-- Type
		deferred
		ensure
			type_not_void: Result /= Void
		end

feature -- Status report

	is_last_entity: BOOLEAN is
			-- Is current entity the last entity in an
			-- entity declaration group?
		do
			Result := True
		end

end
