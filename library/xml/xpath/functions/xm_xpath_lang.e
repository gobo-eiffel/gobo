indexing

	description:

		"Objects that implement the XPath lang() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LANG

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, compute_intrinsic_dependencies, pre_evaluate
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "lang"; namespace_uri := Xpath_standard_functions_uri
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_single_string
			else
				create Result.make_single_node
			end
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_item, another_item: XM_XPATH_ITEM
			a_language: STRING
		do
			last_evaluated_item := Void
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_context)
				an_item := arguments.item (2).last_evaluated_item
			else
				an_item := a_context.context_item
			end
			if an_item = Void then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is undefined", Xpath_errors_uri, "FONC0001", Dynamic_error)
			elseif an_item.is_error then
				last_evaluated_item := an_item
			else
				if not an_item.is_node then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is not a node", Xpath_errors_uri, "FOTY0011", Dynamic_error)
				else
					arguments.item (1).evaluate_item (a_context)
					another_item := arguments.item (1).last_evaluated_item
					if another_item = Void then
						a_language := ""
					elseif another_item.is_error then
						last_evaluated_item := another_item
					else
						a_language := another_item.string_value
					end
				end
				if last_evaluated_item = Void then -- no error
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (is_lang (a_language, an_item.as_node))
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- do_nothing
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	is_lang (a_language: STRING; a_target: XM_XPATH_NODE): BOOLEAN is
			-- Is `a_language' the xml:lang language in effect for `a_target'?
		require
			language_not_void: a_language /= Void
			target_node_not_void: a_target /= Void
		local
			a_node: XM_XPATH_NODE
			found: BOOLEAN
			a_language_attribute: STRING
			a_hyphen: INTEGER
		do
			from
				a_node := a_target
			until
				a_node = Void or else found
			loop
				if a_node.is_element then
					a_language_attribute :=	a_node.as_element.attribute_value (Xml_lang_type_code)
					if a_language_attribute /= Void then
						found := True
					end
				end
				if not found then
					a_node := a_node.parent
				end
			end
			if found then
				if STRING_.same_case_insensitive (a_language_attribute, a_language) then
					Result := True
				else
					a_hyphen := a_language_attribute.index_of ('-', 1)
					if a_hyphen > 0 and then STRING_.same_case_insensitive (a_language_attribute.substring (1, a_hyphen - 1), a_language) then
						Result := True
					end
				end
			end
		end
	
end
	
