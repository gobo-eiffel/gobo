note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		which is a base type.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BASE_TYPE_CONSTRAINT

inherit

	ET_CONSTRAINT_BASE_TYPES
		rename
			has_formal_parameter as is_formal_parameter,
			has_expanded_type as is_type_expanded,
			has_attached_type as is_type_attached,
			are_named_types as is_named_type
		end

	ET_TYPE_CONSTRAINT
		redefine
			type_constraint,
			type
		end

	ET_ADAPTED_CLASS
		rename
			base_type as type
		redefine
			type
		end

feature -- Access

	type_constraint (i: INTEGER): ET_BASE_TYPE_CONSTRAINT
			-- `i'-th type constraint
		do
			Result := Current
		end

	type: ET_BASE_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform
		deferred
		ensure then
			is_named_type: Result.is_named_type
		end

	base_class: ET_CLASS
			-- Base class of `type'
		do
			Result := type.base_class
		ensure then
			definition: Result = type.base_class
		end

end
