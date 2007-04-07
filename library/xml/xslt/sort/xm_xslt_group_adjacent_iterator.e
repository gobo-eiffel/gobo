indexing

	description:

		"Group iterator implementing group-adjacent algorithm"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_GROUP_ADJACENT_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
			a_key: XM_XPATH_EXPRESSION;
			a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_collator: ST_COLLATOR) is
			-- Establish invariant.
		require
			population_before: a_population /= Void and then not a_population.is_error and then a_population.before
			key_not_void: a_key /= Void
			context_not_void: a_context /= Void
			collator_not_void: a_collator /= Void
		do
			population := a_population
			key_expression := a_key
			base_context := a_context
			running_context := a_context.new_minor_context
			running_context.set_current_iterator (population)
			create comparer.make (a_collator)
			stored_collator := a_collator
		ensure
			population_set: population = a_population
			key_set: key_expression = a_key
			context_set: base_context = a_context
			collator_stored: a_collator = stored_collator
		end

feature -- Access

	current_grouping_key: XM_XPATH_ATOMIC_VALUE is
			-- Grouping key for current group;
		do
			if after then
				Result := next_key
			else
				Result := current_key
			end
		end

	item: XM_XPATH_ITEM is
			-- Initial item of current group
		do
			Result := next_item
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
	
feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the members of the current group, in population order.
		do
			if current_members /= Void then
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (current_members)
			end
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			current_key := next_key
			if next_key = Void and then not population.before and then population.after then
				after := True
			else
				advance
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (population.another, key_expression, base_context, stored_collator)
		end
		
feature {NONE} -- Implementation

	population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over population

	key_expression: XM_XPATH_EXPRESSION
			-- Grouping key

	base_context, running_context: XM_XSLT_EVALUATION_CONTEXT
			-- Base and running contexts

	comparer: XM_XPATH_ATOMIC_SORT_COMPARER
			-- Comparer

	stored_collator: ST_COLLATOR
			-- Stored collator for use by `another'

	current_members: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- members of current group

	next_item: like item
			-- Next item isn sequence

	current_key, next_key: like current_grouping_key
			-- Current and next grouping key to consider

	advance is
			-- Advance iterator to next item.
		local
			l_finished: BOOLEAN
			l_candidate_key: like current_grouping_key
			l_candidate: like item
			l_error: XM_XPATH_ERROR_VALUE
			l_item: DS_CELL [XM_XPATH_ITEM]
		do

			-- TODO use comparison keys

			create current_members.make (20)
			if next_item /= Void then current_members.put_first (next_item) end
			from
				if index = 1 then
					population.start
				end
			until l_finished loop
				if population.is_error then
					l_finished := True;	set_last_error (population.error_value)
				elseif not population.after then
					l_candidate := population.item
					if l_candidate.is_error then
						set_last_error (l_candidate.error_value); l_finished := True
					end
				else
					next_key := Void; l_finished := True
				end
				if not l_finished then
					create l_item.make (Void)
					key_expression.evaluate_item (l_item, running_context)
					if l_item.item = Void then
						create l_error.make_from_string ("Key expression is an empty sequence", Xpath_errors_uri, "XTTE1100", Type_error)
						set_last_error (l_error)
						next_item := Void; l_finished := True
					elseif l_item.item.is_error then
						set_last_error (l_item.item.error_value); l_finished := True
					elseif l_item.item.is_atomic_value then
						l_candidate_key := l_item.item.as_atomic_value
						if next_key = Void then next_key := l_candidate_key end
						if next_key.is_comparable (l_candidate_key) and then comparer.three_way_comparison (next_key, l_candidate_key) = 0 then
							current_members.force_last (l_candidate)
						else
							next_key := l_candidate_key
							next_item := l_candidate; l_finished := True
						end
					else
						create l_error.make_from_string ("Key expression does not evaluate to an atomic item", Xpath_errors_uri, "XTTE1100", Type_error)
						set_last_error (l_error)
						l_finished := True
					end
				end
				if not population.after then
					population.forth
				end
			end
		end

	
invariant

	population_not_void: population /= Void
	key_expression_not_void: key_expression /= Void
	base_context_not_void: base_context /= Void
	running_context_not_void: running_context /= Void
	comparer_not_void: comparer /= Void

end
	
