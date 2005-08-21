indexing

	description:

	"Routines for use by variable declarations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

inherit

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

feature -- Access

	Many_references: INTEGER is 10
			-- More than one reference

	variable_reference_count (a_reference_list: DS_ARRAYED_LIST [XM_XPATH_VARIABLE_REFERENCE]; a_binding: XM_XPATH_BINDING): INTEGER is
			-- Reference count at run-time. A reference in a loop counts as "many".
			-- The value (0, 1 or many) does not have to be exact (unless it returns 0 incorrectly),
			--  but if it returns 1 incorrectly, then the variable will be repeatedly evaluated.
		require
			binding_not_void: a_binding /= Void
			reference_list_not_void: a_reference_list /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_VARIABLE_REFERENCE]
			a_variable_reference: XM_XPATH_VARIABLE_REFERENCE
			a_container: XM_XPATH_EXPRESSION_CONTAINER
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			a_child: XM_XPATH_EXPRESSION
			a_depth: INTEGER
			finished: BOOLEAN
		do
			
			-- Remove any inlined variable references and replacements
			
			from
				a_cursor := a_reference_list.new_cursor; a_cursor.finish
			variant
				a_cursor.index
			until
				a_cursor.before
			loop
				a_variable_reference := a_cursor.item
				if not a_variable_reference.was_expression_replaced and then a_variable_reference.binding = Void then
					a_cursor.remove
				end
				a_cursor.back
			end
			Result := a_reference_list.count
			if Result = 1 then
				a_variable_reference := a_reference_list.item (1)
				from
					a_child := a_variable_reference
					a_container := a_variable_reference.container
				until
					finished or else a_container = Void
				loop
					if a_container.is_computed_expression then
						
						-- If the variable reference occurs in a subexpression that is evaluated repeatedly,
						--  for example in the predicate of a filter expression, then return `Many_references'.
						
						a_computed_expression := a_container.as_computed_expression
						if a_computed_expression.was_expression_replaced then
							
							-- dodgy - give up attempting to optimize
							
							finished := True;	Result := Many_references
						elseif a_computed_expression.is_assignation and then a_computed_expression.as_assignation = a_binding then
							finished := True; Result := 1
						elseif a_computed_expression.is_repeated_sub_expression (a_child) then
							finished := True;	Result := Many_references
						else
							a_child := a_computed_expression -- must succeed
							a_container := a_child.container
							a_depth := a_depth + 1
							if a_depth >= 10000 then
								std.error.put_string ("Probable cycle detected in variable references. BUG.%N")
								check
									variable_reference_bug: False
								end
							end
						end
					elseif a_container.is_user_function then
						finished := True;	Result := a_container.parameter_references (a_binding)
					else
						
						-- we should have found the binding by now, but we haven't - so just skip the optimization
						
						finished := True;	Result := Many_references
					end
				end
				if not finished then Result := Many_references end
			elseif Result > 1 then
				Result := Many_references 
			end
		end

end
	
