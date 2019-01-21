note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_CONSTRAINT

inherit

	ET_CONSTRAINT
		rename
			has_formal_parameter as is_formal_parameter,
			are_named_types as is_named_type
		end

	ET_TYPE_CONSTRAINT_ITEM
		rename
			type_constraint as current_type_constraint
		end

feature -- Access

	type_constraint (i: INTEGER): ET_TYPE_CONSTRAINT
			-- `i'-th type constraint
		do
			Result := Current
		end

	current_type_constraint: ET_TYPE_CONSTRAINT
			-- Type constraint in comma-separated list
		do
			Result := Current
		end

feature -- Measurement

	count: INTEGER = 1
			-- Number of type constraints in current constraint

feature -- Conformance

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of the types
			-- in current constraint and `other' is overridden by `a_type_mark' and
			-- `other_type_mark', if not Void
		do
			Result := type.conforms_to_type_with_type_marks (other, other_type_mark, other_context, a_type_mark, a_context, a_system_processor)
		end

feature -- Output

	append_types_to_string (a_string: STRING)
			-- Append to `a_string' the textual representation
			-- of the types in current constraint.
		do
			type.append_to_string (a_string)
		end

end
