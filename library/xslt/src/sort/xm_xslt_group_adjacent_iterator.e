note

	description:

		"Group iterator implementing group-adjacent algorithm"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_GROUP_ADJACENT_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
			a_key: XM_XPATH_EXPRESSION;
			a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_collator: ST_COLLATOR)
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

	current_grouping_key: detachable XM_XPATH_ATOMIC_VALUE
			-- Grouping key for current group;
		do
			if after then
				Result := next_key
			else
				Result := current_key
			end
		end

	item: XM_XPATH_ITEM
			-- Initial item of current group
		do
			check attached current_members as l_current_members then
				Result := l_current_members.first
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?

feature -- Evaluation

	current_group_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over the members of the current group, in population order.
		do
			if attached current_members as l_current_members then
				if l_current_members.is_empty then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				else
					create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (l_current_members)
				end
			end
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			current_key := next_key
			if next_key = Void and then not population.before and then population.after then
				after := True
			else
				advance
				if next_item = Void and (not attached current_members as l_current_members or else l_current_members.is_empty) then
					after := True
				end
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (population.another, key_expression, base_context, stored_collator)
		end

feature {NONE} -- Implementation

	Estimated_group_size: INTEGER = 20
			-- Initial size for `current_members'

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

	current_members: detachable DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- members of current group

	next_item: detachable like item
			-- Next item in sequence

	current_key, next_key: detachable like current_grouping_key
			-- Current and next grouping key to consider

	advance
			-- Advance iterator to next item.
		local
			l_finished: BOOLEAN
			l_candidate_key: like current_grouping_key
			l_candidate: detachable like item
			l_error: XM_XPATH_ERROR_VALUE
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
			l_current_members: like current_members
			l_next_key: like next_key
		do

			-- TODO use comparison keys

			create l_current_members.make (Estimated_group_size)
			current_members := l_current_members
			if attached next_item as l_next_item then
				l_current_members.put_first (l_next_item)
			end
			from
				if index = 1 then
					population.start
				end
			until l_finished loop
				if attached population.error_value as l_error_value then
					check is_error: population.is_error end
					l_finished := True
					set_last_error (l_error_value)
				elseif not population.after then
					l_candidate := population.item
					if attached l_candidate.error_value as l_error_value then
						check is_error: l_candidate.is_error end
						set_last_error (l_error_value)
						l_finished := True
					end
				else
					next_key := Void
					l_finished := True
				end
				if not l_finished then
					check l_candidate /= Void then
						create l_item.make (Void)
						key_expression.evaluate_item (l_item, running_context)
						if not attached l_item.item as l_item_item then
							create l_error.make_from_string ("Key expression is an empty sequence", Xpath_errors_uri, "XTTE1100", Type_error)
							set_last_error (l_error)
							next_item := Void
							l_finished := True
							check attached running_context.transformer as l_running_context_transformer then
								l_running_context_transformer.report_fatal_error (l_error)
							end
						elseif attached l_item_item.error_value as l_error_value then
							check is_error: l_item_item.is_error end
							set_last_error (l_error_value)
							l_finished := True
							check attached running_context.transformer as l_running_context_transformer then
								l_running_context_transformer.report_fatal_error (l_error_value)
							end
						elseif l_item_item.is_atomic_value then
							l_candidate_key := l_item_item.as_atomic_value
							l_next_key := next_key
							if l_next_key = Void then
								l_next_key := l_candidate_key
								next_key := l_next_key
							end
							if index = 1 and current_key = Void then
								current_key := l_next_key
							end
							if l_next_key.is_comparable (l_candidate_key) and then comparer.three_way_comparison (l_next_key, l_candidate_key) = 0 then
								if not l_current_members.extendible (1) then
									l_current_members.resize (2 * l_current_members.count)
								end
								l_current_members.put_last (l_candidate)
							else
								next_key := l_candidate_key
								next_item := l_candidate
								l_finished := True
							end
						else
							create l_error.make_from_string ("Key expression does not evaluate to an atomic item", Xpath_errors_uri, "XTTE1100", Type_error)
							set_last_error (l_error)
							l_finished := True
							check attached running_context.transformer as l_running_context_transformer then
								l_running_context_transformer.report_fatal_error (l_error)
							end
						end
					end
				end
				if not is_error and then not population.after then
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

