note

	description:

		"Tuple-type-unfolding type resolvers, phase 1 (and phase 2 when no identifier anchored types are involved)."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS_RESOLVER1

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class_type,
			process_qualified_like_type,
			process_qualified_like_braced_type,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new Tuple-type-unfolding resolver for types of given classes.
		do
			precursor (a_system_processor)
			create constraint_context.make_with_capacity (current_class, 1)
		end

feature -- Tuple-type-unfolding

	resolve_type (a_type: ET_TYPE; a_class: ET_CLASS)
			-- First phase of Tuple-type-unfolding in actual parameters of class types
			-- in `a_type' written in `a_class', if not already done.
			-- Perform syntactical transformations only:
			-- * Resolve cases where the number of actual and formal generic parameters
			--   are different.
			-- * Also resolve the use of obsolete routine types (with an extra
			--   first generic parameter).
			--
			-- If the type conformance needed to perform the second phase of Tuple-type-unfolding
			-- does not involve identifier anchored types (e.g. "like foo" or "like {A}.foo")
			-- then perform the second phase as well, if not already done:
			-- * Resolve the case: "FOO [A, B, C]" -> "FOO [A, TUPLE [B], C]".
		require
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			a_type.process (Current)
			current_class := old_class
		end

feature {NONE} -- Tuple-type-unfolding

	resolve_class_type (a_type: ET_CLASS_TYPE)
			-- First phase of Tuple-type-unfolding in actual parameters of class types
			-- in `a_type' written in `current_class', if not already done.
			-- Perform syntactical transformations only:
			-- * Resolve cases where the number of actual and formal generic parameters
			--   are different.
			-- * Also resolve the use of obsolete routine types (with an extra
			--   first generic parameter).
			--
			-- If the type conformance needed to perform the second phase of Tuple-type-unfolding
			-- does not involve identifier anchored types (e.g. "like foo" or "like {A}.foo")
			-- then perform the second phase as well, if not already done:
			-- * Resolve the case: "FOO [A, B, C]" -> "FOO [A, TUPLE [B], C]".
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actual: ET_TYPE
			l_base_class: ET_CLASS
			l_tuple_constraint_position: INTEGER
		do
			if attached a_type.actual_parameters as an_actuals then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.type (i)
					an_actual.process (Current)
					i := i + 1
				end
			end
			l_base_class := a_type.base_class
			l_base_class.process (system_processor.eiffel_parser)
			a_type.resolve_unfolded_tuple_actual_parameters_1 (current_universe)
			if not a_type.tuple_actual_parameters_unfolded_2 then
				l_tuple_constraint_position := l_base_class.tuple_constraint_position
				if l_tuple_constraint_position /= 0 and then attached a_type.actual_parameters as an_actuals and then l_base_class.formal_parameter_count = an_actuals.count then
					an_actual := an_actuals.type (l_tuple_constraint_position)
					if not an_actual.has_identifier_anchored_type then
						constraint_context.set (a_type, current_class)
						a_type.resolve_unfolded_tuple_actual_parameters_2 (current_class, constraint_context, system_processor)
					end
				end
			end
		end

	resolve_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- First phase of Tuple-type-unfolding in actual parameters of class types
			-- in `a_type' written in `current_class', if not already done.
			-- Perform syntactical transformations only:
			-- * Resolve cases where the number of actual and formal generic parameters
			--   are different.
			-- * Also resolve the use of obsolete routine types (with an extra
			--   first generic parameter).
			--
			-- If the type conformance needed to perform the second phase of Tuple-type-unfolding
			-- does not involve identifier anchored types (e.g. "like foo" or "like {A}.foo")
			-- then perform the second phase as well, if not already done:
			-- * Resolve the case: "FOO [A, B, C]" -> "FOO [A, TUPLE [B], C]".
		require
			a_type_not_void: a_type /= Void
		do
			a_type.target_type.process (Current)
		end

	resolve_tuple_type (a_type: ET_TUPLE_TYPE)
			-- First phase of Tuple-type-unfolding in actual parameters of class types
			-- in `a_type' written in `current_class', if not already done.
			-- Perform syntactical transformations only:
			-- * Resolve cases where the number of actual and formal generic parameters
			--   are different.
			-- * Also resolve the use of obsolete routine types (with an extra
			--   first generic parameter).
			--
			-- If the type conformance needed to perform the second phase of Tuple-type-unfolding
			-- does not involve identifier anchored types (e.g. "like foo" or "like {A}.foo")
			-- then perform the second phase as well, if not already done:
			-- * Resolve the case: "FOO [A, B, C]" -> "FOO [A, TUPLE [B], C]".
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			an_actual: ET_TYPE
		do
			if attached a_type.actual_parameters as an_actuals then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					an_actual := an_actuals.type (i)
					an_actual.process (Current)
					i := i + 1
				end
			end
		end

feature {ET_AST_NODE} -- Type processing

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			resolve_class_type (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			resolve_qualified_like_identifier (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			resolve_qualified_like_identifier (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			resolve_tuple_type (a_type)
		end

feature {NONE} -- Implementation

	constraint_context: ET_NESTED_TYPE_CONTEXT
			-- Constraint context for type conformance checking

invariant

	constraint_context_not_void: constraint_context /= Void

end
