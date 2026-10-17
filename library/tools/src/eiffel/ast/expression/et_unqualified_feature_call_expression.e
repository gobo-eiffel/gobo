note

	description:

		"Eiffel unqualified feature call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014-2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION

inherit

	ET_FEATURE_CALL_EXPRESSION
		undefine
			is_qualified_call,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions,
			add_formal_arguments
		redefine
			is_false_expression,
			is_true_expression
		end

	ET_UNQUALIFIED_FEATURE_CALL
		undefine
			parenthesis_call
		end

feature -- Status report

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
				l_base_class := a_context.base_class
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
				l_base_class := a_context.base_class
				if attached {ET_CONSTANT_ATTRIBUTE} l_base_class.seeded_query (l_seed) as l_context_attribute then
					Result := l_context_attribute.constant.is_true
				end
			end
		end

end
