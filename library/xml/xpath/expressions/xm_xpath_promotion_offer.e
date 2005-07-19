indexing

	description:

		"Promotion offers"

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
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_requested_action: INTEGER; a_binding: XM_XPATH_BINDING; containing: XM_XPATH_EXPRESSION; eliminate: BOOLEAN; dependent: BOOLEAN) is
			-- Set defaults.
		require
			action: a_requested_action = Range_independent
				or else a_requested_action = Focus_independent
				or else a_requested_action = Inline_variable_references
				or else a_requested_action = Unordered
			binding:	a_requested_action = Range_independent implies a_binding /= Void
			containing: a_requested_action /= Unordered implies containing /= Void
		do
			may_promote_xslt_functions := True
			action := a_requested_action
			binding_expression := a_binding
			containing_expression := containing
			must_eliminate_duplicates := eliminate
			may_promote_document_dependent := dependent
		ensure
			eliminate_duplicates_set: must_eliminate_duplicates = eliminate
			may_promote_document_dependent_set: may_promote_document_dependent = dependent
			action_set: action = a_requested_action
			binding_set: binding_expression = a_binding
			containing_set: containing_expression = containing
			may_promote_xslt_functions: may_promote_xslt_functions
		end

feature -- Access

	action: INTEGER
			-- Promotion action

	binding_expression: XM_XPATH_BINDING
			-- In the case of `Range_independent', identifies the range variable whose dependencies we are looking for

	containing_expression: XM_XPATH_EXPRESSION
			-- In the case `Focus_independent' of identifies the level to which the promotion should occur;
			-- When a subexpression is promoted, an expression of the form let $VAR := SUB return ORIG is created,
			--  and this replaces the original `containing_expression' within `Current'.

	accepted_expression : XM_XPATH_EXPRESSION
			-- Result from `accept'
	
feature -- Status report

	may_promote_document_dependent: BOOLEAN
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

	may_promote_xslt_functions: BOOLEAN
			-- Is it OK to promote XSLT functions such as current()?


feature -- Status setting

	disallow_promoting_xslt_functions is
			-- Disallow promotion of XSLT functions such as current().
		do
			may_promote_xslt_functions := False
		ensure
			may_promote_xslt_functions: not may_promote_xslt_functions
		end

feature -- Optimization

	accept (a_child_expression: XM_XPATH_EXPRESSION) is
			-- Test whether a subexpression qualifies for promotion, and if so, accept the promotion
		require
			sub_expression_dependencies_and_cardinalities_computed: a_child_expression /= Void and then a_child_expression.are_dependencies_computed and then a_child_expression.are_cardinalities_computed
		do
			inspect
				action
			when Range_independent then
				if not a_child_expression.non_creating or else depends_upon_variable (a_child_expression, binding_expression) then
					accepted_expression := Void
				else
					promote (a_child_expression)
					accepted_expression := promoted_expression
				end
			when Focus_independent then 
				if not may_promote_xslt_functions and then a_child_expression.depends_upon_xslt_context then
					accepted_expression := Void
				elseif not a_child_expression.depends_upon_focus and then a_child_expression.non_creating then
					promote (a_child_expression)
					accepted_expression := promoted_expression
				elseif may_promote_document_dependent and not a_child_expression.depends_upon_non_document_focus and then a_child_expression.non_creating then
					promote (a_child_expression)
					accepted_expression := promoted_expression
				else
					accepted_expression := Void
				end
			when Inline_variable_references then
				if a_child_expression.is_variable_reference and then a_child_expression.as_variable_reference.binding = binding_expression then
					accepted_expression := containing_expression
				else
					accepted_expression := Void
				end
			when Unordered then
				if a_child_expression.is_reverser then
					accepted_expression := a_child_expression.as_reverser.base_expression
				elseif not must_eliminate_duplicates then
					if a_child_expression.is_document_sorter then
						accepted_expression := a_child_expression.as_document_sorter.base_expression
						accepted_expression.mark_unreplaced
					else
						accepted_expression := Void
					end
				else
					accepted_expression := Void
				end
			end			
		end

feature -- Element change

	set_containing_expression (exp:  XM_XPATH_EXPRESSION) is
			-- Set `containing_expression'.
		require
			expression_not_void: exp /= Void
		do
			containing_expression := exp
		ensure
			set: containing_expression = exp
		end

feature {NONE} -- Implementation

	promoted_expression: XM_XPATH_EXPRESSION
			-- Result from `promote'

	promote (a_child_expression: XM_XPATH_EXPRESSION) is
			-- Promote `a_child_expression'
		require
			sub_expression_cardinalities_computed: a_child_expression /= Void and then a_child_expression.are_cardinalities_computed
		local
			a_range_variable: XM_XPATH_RANGE_VARIABLE_DECLARATION
			a_variable: XM_XPATH_VARIABLE_REFERENCE
			a_type: XM_XPATH_SEQUENCE_TYPE
			a_variable_name: STRING
			a_clock: DT_SYSTEM_CLOCK
			a_let_expression: XM_XPATH_LET_EXPRESSION
		do
			create a_type.make (a_child_expression.item_type, a_child_expression.cardinality)
			create a_clock.make
			a_variable_name := a_clock.time_now.out
			a_variable_name := STRING_.appended_string ("zz:",a_variable_name)
			create a_range_variable.make (a_variable_name, -1, a_type)

			create a_variable.make (a_range_variable)
			promoted_expression := a_variable
			if containing_expression.is_computed_expression then
				containing_expression.as_computed_expression.copy_location_identifier (promoted_expression)
			end
			create a_let_expression.make (a_range_variable, a_child_expression, containing_expression)
			a_let_expression.adopt_child_expression (containing_expression)
			set_containing_expression (a_let_expression)
		end

	depends_upon_variable (a_child_expression: XM_XPATH_EXPRESSION; a_binding: XM_XPATH_BINDING):BOOLEAN is
			-- Does `a_child_expression' depend upon `a_binding'?
		require
			child_not_void: a_child_expression /= Void
			binding_not_void: a_binding /= Void
		local
			children: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			finished: BOOLEAN
			an_index: INTEGER
		do
			if a_child_expression.is_variable_reference then
				Result := a_child_expression.as_variable_reference.binding = a_binding
			else
				from
					children := a_child_expression.sub_expressions
					an_index := 1
				variant
					children.count + 1 - an_index
				until
					finished or else an_index > children.count
				loop
					if depends_upon_variable (children.item (an_index), a_binding) then
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
	
