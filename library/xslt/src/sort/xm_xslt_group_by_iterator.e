note

	description:

		"Group iterator implementing group-by algorithm"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_GROUP_BY_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]
		redefine
			is_last_position_finder, last_position
		end

	XM_XPATH_SHARED_COMPARISON_KEY_TESTER
		export {NONE} all end

		-- Objects of this class iterate over a sequence of groups defined by
		--  xsl:for-each-group group-by="x". The groups are returned in
		--  order of first appearance. Note that an item can appear in several groups;
		--  indeed, an item may be the leading item of more than one group, which means
		--  that knowing the leading item is not enough to know the current group.

		-- It acts as a sequence iterator, where successive calls to `forth'
		--  return the leading item of each group in turn. The current item of
		--  the iterator is therefore the leading item of the current group. To get access
		--  to all the members of the current group, the `current_group_iterator' routine is used;
		--  this underpins the current-group() function in XSLT. The grouping key for the
		--  current group is available via the `current_grouping_key' routine.

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
			key_context := a_context
			create comparer.make (a_collator)
			create groups.make_default
			create group_keys.make_default
			build_indexed_groups
			stored_collator := a_collator
		ensure
			population_set: population = a_population
			key_set: key_expression = a_key
			context_set: key_context = a_context
			indexed_groups_built: indexed_groups_built
			collator_stored: a_collator = stored_collator
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Initial item of current group
		do
			Result := groups.item (index).item (1)
		end

	current_grouping_key: XM_XPATH_ATOMIC_VALUE
			-- Grouping key for current group
		do
			Result := group_keys.item (index)
		end

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		do
			Result := groups.count
		end

feature -- Status report

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := True
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := index > groups.count
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over the members of the current group, in population order.
		do
			create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (groups.item (index))
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (population.another, key_expression, key_context.new_context, stored_collator)
		end

feature {NONE} -- Implementation

	population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over population

	key_expression: XM_XPATH_EXPRESSION
			-- Grouping key

	key_context: XM_XSLT_EVALUATION_CONTEXT
			-- Execution context

	comparer: XM_XPATH_ATOMIC_SORT_COMPARER
			-- Comparer

	indexed_groups_built: BOOLEAN
			-- Have the grouping tables been built yet?

	groups: DS_ARRAYED_LIST [DS_ARRAYED_LIST [XM_XPATH_ITEM]]
			-- Main data structure holds one entry for each group;
			-- The entry is a list which contains the items
			--  that are members of the group, in population order.
			-- The groups are arranged in order of first appearance within the population.

	group_keys: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			-- Parallel structure which identifies the grouping key for each group;
			-- The list corresponds one-to-one with the list of groups.

	stored_collator: ST_COLLATOR
			-- Stored collator for use by `another'

	build_indexed_groups
			-- Build the grouping table forming groups of non-adjacent items with equal keys.
		require
			not_already_built: not indexed_groups_built
		local
			a_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_ITEM], XM_XPATH_COMPARISON_KEY]
			a_context: XM_XSLT_EVALUATION_CONTEXT
			an_item: XM_XPATH_ITEM
			a_keys_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			first_key: BOOLEAN
			a_key: XM_XPATH_ATOMIC_VALUE
			a_comparison_key: XM_XPATH_COMPARISON_KEY
			a_group: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			a_transformer: XM_XSLT_TRANSFORMER
		do
			create a_map.make_with_equality_testers (20, Void, comparison_key_tester)
			a_context := key_context.new_minor_context
			a_context.set_current_iterator (population)
			check attached a_context.transformer as l_context_transformer then
				a_transformer := l_context_transformer
				from
					population.start
				until
					a_transformer.is_error or else population.after
				loop
					an_item := population.item
					from
						key_expression.create_iterator (a_context)
						check postcondition_of_create_iterator: attached key_expression.last_iterator as l_last_iterator then
							a_keys_iterator := l_last_iterator
							if not a_keys_iterator.is_error then
								a_keys_iterator.start
								first_key := True
							end
						end
					until
						a_keys_iterator.is_error or else a_keys_iterator.after
					loop
						check
							key_is_atomic: a_keys_iterator.item.is_atomic_value
						end
						a_key := a_keys_iterator.item.as_atomic_value
						a_comparison_key := comparer.comparison_key (a_key)
						if a_map.has (a_comparison_key) then
							a_group := a_map.item (a_comparison_key)
							if first_key then
								if not a_group.extendible (1) then
									a_group.resize (2 * a_group.count)
								end
								a_group.put_last (an_item)
							else

								-- If this is not the first key value for this item, we
								--  check whether the item is already in this group before
								--  adding it again.
								-- If it is in this group, then we know it will be at the end.

								if a_group.last /= an_item then
									if not a_group.extendible (1) then
										a_group.resize (2 * a_group.count)
									end
									a_group.put_last (an_item)
								end
							end
						else
							create a_group.make_default
							a_group.put_last (an_item)
							if not groups.extendible (1) then
								groups.resize (2 * groups.count)
							end
							groups.put_last (a_group)
							if not group_keys.extendible (1) then
								group_keys.resize (2 * group_keys.count)
							end
							group_keys.put_last (a_key)
							a_map.force_new (a_group, a_comparison_key)
						end
						first_key := False
						a_keys_iterator.forth
					end
					if attached a_keys_iterator.error_value as l_error_value then
						check is_error: a_keys_iterator.is_error end
						a_transformer.report_fatal_error (l_error_value)
					else
						population.forth
					end
				end
				indexed_groups_built := True
			end
		ensure
			indexed_groups_built: indexed_groups_built
		end

invariant

	population_not_void: population /= Void
	key_expression_not_void: key_expression /= Void
	key_context_not_void: key_context /= Void
	comparer_not_void: comparer /= Void
	groups_not_void: groups /= Void
	group_keys_not_void: group_keys /= Void

end

