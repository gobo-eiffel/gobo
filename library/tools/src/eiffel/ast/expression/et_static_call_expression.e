note

	description:

		"Eiffel static call expressions (or once creation expressions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2026, Eric Bezault and others"
	license: "MIT License"

class ET_STATIC_CALL_EXPRESSION

inherit

	ET_STATIC_FEATURE_CALL
		redefine
			parenthesis_call,
			reset
		end

	ET_CALL_EXPRESSION_WITH_ACTUAL_ARGUMENT_LIST
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_formal_arguments
		redefine
			reset,
			is_never_void,
			is_false_expression,
			is_true_expression
		end

	ET_CHOICE_CONSTANT
		undefine
			reset,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_formal_arguments,
			is_never_void,
			is_false_expression,
			is_true_expression
		end

	ET_CREATION_EXPRESSION
		undefine
			name,
			arguments,
			reset,
			is_never_void,
			is_false_expression,
			is_true_expression
		end

create

	make

feature -- Initialization

	reset
			-- Reset call as it was when it was last parsed.
		do
			precursor {ET_CALL_EXPRESSION_WITH_ACTUAL_ARGUMENT_LIST}
			precursor {ET_STATIC_FEATURE_CALL}
			is_once_creation_call := False
		end

feature -- Status report

	is_once_creation_call: BOOLEAN
			-- Is the current component '{T}.f' a short-hand for
			-- 'create {T}.f' where the base class of 'T' is a once class?

	is_never_void: BOOLEAN
			-- Can current expression never be void?
		do
			if is_once_creation_call then
				Result := True
			end
		end

	is_false_expression (a_context: ET_TYPE_CONTEXT; a_no_call: BOOLEAN): BOOLEAN
			-- Can current expression be proven to be False statically when viewed from `a_context'?
			-- If `a_no_call` is True, then return False if some calls could be executed
			-- even if current expression can be proven to be False statically.
		local
			l_base_class: ET_CLASS
			l_seed: INTEGER
		do
			l_seed := name.seed
			if l_seed /= 0 and arguments_count = 0 then
				l_base_class := type.adapted_base_class_with_seeded_feature (l_seed, a_context).base_class
				if attached {ET_CONSTANT_ATTRIBUTE} l_base_class.seeded_query (l_seed) as l_context_attribute then
					Result := l_context_attribute.constant.is_false
				end
			end
		end

	is_true_expression (a_context: ET_TYPE_CONTEXT; a_no_call: BOOLEAN): BOOLEAN
			-- Can current expression be proven to be True statically when viewed from `a_context'?
			-- If `a_no_call` is True, then return False if some calls could be executed
			-- even if current expression can be proven to be True statically.
		local
			l_base_class: ET_CLASS
			l_seed: INTEGER
		do
			l_seed := name.seed
			if l_seed /= 0 and arguments_count = 0 then
				l_base_class := type.adapted_base_class_with_seeded_feature (l_seed, a_context).base_class
				if attached {ET_CONSTANT_ATTRIBUTE} l_base_class.seeded_query (l_seed) as l_context_attribute then
					Result := l_context_attribute.constant.is_true
				end
			end
		end

feature -- Access

	parenthesis_call: detachable ET_PARENTHESIS_EXPRESSION
			-- <Precursor>

	creation_call: detachable ET_CREATION_CALL
			-- Call to creation procedure
		do
			Result := Current
		end

	type_position: ET_POSITION
			-- Position of `type'
		do
			Result := type.position
		end

feature -- Setting

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- <Precursor>
		do
			create parenthesis_call.make (a_target, a_name, a_arguments)
		end

	set_is_once_creation_call (b: BOOLEAN)
			-- Set `is_once_creation_call` to `b`.
		do
			is_once_creation_call := b
		ensure
			is_once_creation_call_set: is_once_creation_call = b
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_static_call_expression (Current)
		end

end
