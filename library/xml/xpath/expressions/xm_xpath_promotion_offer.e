indexing

	description:

		"Promotion offer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PROMOTION_OFFER

	-- `XM_XPATH_PROMOTION_OFFER' is an object used transiently during compilation of an expression. It contains
	-- information passed by a containing expression to its subexpressions, when looking for subexpressions
	-- that can be promoted to a higher level because they are not dependent on the context established
	-- by the containing expression. The object is also used to pass back return information when the
	-- promotion actually takes place.

inherit

	XM_XPATH_PROMOTION_ACTIONS

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (requested_action: INTEGER; binding: XM_XPATH_BINDING; containing: XM_XPATH_EXPRESSION; eliminate: BOOLEAN; dependent: BOOLEAN) is
			-- Set defaults
		require
			action: requested_action = Range_independent
				or else requested_action = Focus_independent
				or else requested_action = Inline_variable_references
				or else requested_action = Unordered
			binding:	requested_action = Range_independent implies binding /= Void
			containing: requested_action /= Unordered implies containing /= Void
		do
			action := requested_action
			binding_expression := binding
			containing_expression := containing
			must_eliminate_duplicates := eliminate
			promote_document_dependent := dependent
		ensure
			eliminate_duplicates_set: must_eliminate_duplicates = eliminate
			promote_document_dependent_set: promote_document_dependent = dependent
			action_set: action = requested_action
			binding_set: binding_expression = binding
			containing_set: containing_expression = containing
		end

feature -- Access

	action: INTEGER
			-- Promotion action

	binding_expression: XM_XPATH_BINDING
			-- In the case of `Range_independent', identifies the range variable whose dependencies we are looking for

	containing_expression: XM_XPATH_EXPRESSION
			-- In the case of identifies the level to which the promotion should occur;
			-- When a subexpression is promoted, an expression of the form let $VAR := SUB return ORIG is created,
			--  and this replaces the original `containing_expression' within `Current'.

	accept (child: XM_XPATH_EXPRESSION): XM_XPATH_EXPRESSION is
			-- Test whether a subexpression qualifies for promotion, and if so, accept the promotion
		require
			sub_expression_dependencies_and_cardinalities_computed: child /= Void and then child.are_dependencies_computed and then child.are_cardinalities_computed
		local
			variable_reference: XM_XPATH_VARIABLE_REFERENCE
			reverser: XM_XPATH_REVERSER
			document_sorter: XM_XPATH_DOCUMENT_SORTER
		do
			inspect
				action
			when Range_independent then
				if depends_upon_variable (child, binding_expression) then
					Result := child
				else
					Result := promote (child)
				end
			when Focus_independent then
				if not child.depends_upon_focus then
					Result := promote (child)
				elseif promote_document_dependent and not child.depends_upon_non_document_focus then
					Result := promote (child)
				else
					Result := child
				end
			when Inline_variable_references then
				variable_reference ?= child
				if variable_reference /= Void and then variable_reference.binding.is_equal (binding_expression) then
					Result := containing_expression
				else
					Result := child
				end
			when Unordered then
				reverser ?= child
				if reverser /= Void then
					Result := reverser.base_expression
				elseif not must_eliminate_duplicates then
					document_sorter ?= child
					if document_sorter /= Void then
						Result := document_sorter.base_expression
					else
						Result := child
					end
				else
					Result := child
				end
			end			
		end

feature -- Status report

	promote_document_dependent: BOOLEAN
			-- In the case of `Focus_indpendent', is it safe to promote a subexpression
			--  that depends on the context document but not on other aspects of the focus?
			-- This is the case, for example, in a filter expression when it is known that
			--  all the nodes selected by the expression will be in the same document,
			--  as happens when the filter is applied to a path expression.
			-- This allows subexpressions such as key() to be promoted

	must_eliminate_duplicates: BOOLEAN
			-- In the case of Unordered, can the nodes can be delivered in any order so long as there are no duplicates?
			-- For example, as required by the count() function. If `False', the
			--  nodes can be delivered in any order and duplicates are allowed (for example, as
			--  required by the boolean() function).

feature {NONE} -- Implementation

	promote (child: XM_XPATH_EXPRESSION): XM_XPATH_EXPRESSION is
			-- Promote `child'
		require
			sub_expression_cardinalities_computed: child /= Void and then child.are_cardinalities_computed
		local
			declaration: XM_XPATH_RANGE_VARIABLE_DECLARATION
			variable: XM_XPATH_VARIABLE_REFERENCE
			type: XM_XPATH_SEQUENCE_TYPE
			variable_name: STRING
			clock: DT_SYSTEM_CLOCK
			let: XM_XPATH_LET_EXPRESSION
		do
			create type.make (child.item_type, child.cardinality)
			create clock.make
			variable_name := clock.time_now.out
			variable_name := STRING_.appended_string ("zz:",variable_name)
			create declaration.make (variable_name, -1, type)

			create variable.make (declaration)
			Result := variable

			create let.make (declaration, child, containing_expression)
			containing_expression := let
		end

	depends_upon_variable (child: XM_XPATH_EXPRESSION; binding: XM_XPATH_BINDING):BOOLEAN is
			-- Does `child' depend upon `binding'?
		require
			child_not_void: child /= Void
			binding_not_void: binding /= Void
		local
			variable: XM_XPATH_VARIABLE_REFERENCE
			children: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			finished: BOOLEAN
			an_index: INTEGER
		do
			variable ?= child
			if variable /= Void then
				Result := variable.binding.is_equal (binding)
			else
				from
					children := child.sub_expressions
					an_index := 1
				variant
					children.count + 1 - an_index
				until
					finished or else an_index > children.count
				loop
					if depends_upon_variable (children.item (an_index), binding) then
						Result := True
						finished := True
					end
					an_index := an_index + 1
				end
			end
		end

invariant

	action: action = Range_independent or else action = Focus_independent
		or else action = Inline_variable_references or else action = Unordered
	binding: action = Range_independent implies binding_expression /= Void
	containing_expression: action /= Unordered implies containing_expression /= Void

end
	
