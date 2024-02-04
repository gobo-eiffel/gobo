note

	description:

		"Eiffel creation expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CREATION_EXPRESSION

inherit

	ET_EXPRESSION
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		redefine
			is_never_void
		end

	ET_CREATION_COMPONENT
		redefine
			type
		end

feature -- Access

	type: ET_TYPE
			-- Creation type
		deferred
		ensure then
			type_not_void: Result /= Void
		end

	type_position: ET_POSITION
			-- Position of `type'
		deferred
		ensure
			type_position_not_void: Result /= Void
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

end
