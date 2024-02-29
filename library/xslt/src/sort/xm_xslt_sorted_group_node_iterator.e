note

	description:

		"Objects that render a sorted iteration of groups of nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2019, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_SORTED_GROUP_NODE_ITERATOR

inherit

	XM_XSLT_GROUP_NODE_ITERATOR
		undefine
			is_array_iterator, as_array_iterator,
			is_last_position_finder, last_position,
			is_realizable_iterator,
			is_reversible_iterator,
			is_singleton_iterator, as_singleton_iterator
		redefine
			is_error, error_value, index
		end

	XM_XSLT_SORTED_NODE_ITERATOR
		rename
			make as old_make
		undefine
			set_last_error,
			is_empty_iterator, as_empty_iterator,
			is_axis_iterator, as_axis_iterator,
			is_node_iterator, as_node_iterator,
			is_invulnerable,
			before, start, off
		redefine
			build_array, another,
			is_error, error_value, index
		end

create

	make

feature {NONE} -- Initialization

	make (a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_base_iterator: XM_XSLT_GROUP_NODE_ITERATOR;
			some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION])
			-- Establish invariant
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
		do
			group_iterator := a_base_iterator
			context := a_context.new_minor_context
			base_iterator := a_base_iterator
			context.set_current_iterator (base_iterator)
			sort_keys := some_sort_keys
			from
				create key_comparers.make (sort_keys.count)
				a_cursor := sort_keys.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				check attached a_cursor.item.comparer as l_comparer then
					key_comparers.put_last (l_comparer)
				end
				a_cursor.forth
			variant
				sort_keys.count + 1 - a_cursor.index
			end

			-- Avoid doing the sort until the user wants the first item. This is because
			--  sometimes the user only wants to know whether the collection is empty.

		ensure
			base_iterator_set: base_iterator = a_base_iterator
			sort_keys_set: sort_keys = some_sort_keys
		end

feature -- Status report

	is_error: BOOLEAN
			-- Is `Current' in error?

feature -- Access

	index: INTEGER
			-- The position of the current item;
			-- This will be zero after creation of the iterator

	error_value: detachable XM_XPATH_ERROR_VALUE
			-- Last error

	current_grouping_key: XM_XPATH_ATOMIC_VALUE
			-- Grouping key for current group;
			-- (or `Void' for group-starting/ending-with)
		do
			check attached node_keys as l_node_keys then
				Result := l_node_keys.item (index).as_group_node_sort_record.current_grouping_key
			end
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterator over the members of the current group, in population order.
		do
			check
				node_keys: attached node_keys as l_node_keys
				group_sort_record: l_node_keys.item (index).is_group_node_sort_record
				-- `build_array' assures this
			then
				Result := l_node_keys.item (index).as_group_node_sort_record.current_group_iterator.another
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do

			-- Make sure the sort has been done, so that multiple iterators over the
			--  same sorted data only do the sorting once.

			if not count_determined then perform_sorting end

			-- The new iterator is the same as the old one,
			--  except for its start position.

			create Result.make (context, group_iterator.another, sort_keys)
			Result.set_count (count)
			check attached node_keys as l_node_keys then
				Result.set_node_keys (l_node_keys)
			end
		ensure then
			not is_error implies count_determined
		end

feature {NONE} -- Implementation

	group_iterator: XM_XSLT_GROUP_NODE_ITERATOR
			-- Sequence to be sorted

	build_array
			-- Build `node_keys'.
		local
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_sort_record: XM_XSLT_GROUP_NODE_SORT_RECORD
			l_key_list: DS_ARRAYED_LIST [detachable XM_XPATH_ATOMIC_VALUE]
			l_sort_key: detachable XM_XPATH_ATOMIC_VALUE
			l_new_context: like context
			l_node_keys: like node_keys
		do
			create l_node_keys.make_default
			node_keys := l_node_keys

			-- This provides the context for evaluating the sort key:
			-- Note that current() must return the node being sorted.

			l_new_context := context.new_context
			l_new_context.set_current_iterator (base_iterator)
			l_new_context.set_current_group_iterator (group_iterator)

			-- Initialize the array with data.

			from
				group_iterator.start
			until
				group_iterator.is_error or else group_iterator.after
			loop
				if l_node_keys.is_full then
					l_node_keys.resize (l_node_keys.count * 2)
				end
				from
					create l_key_list.make (sort_keys.count)
					l_cursor := sort_keys.new_cursor; l_cursor.start
				until
					l_cursor.after
				loop
					create l_item.make (Void)
					l_cursor.item.sort_key.evaluate_item (l_item, l_new_context)
					if attached l_item.item as l_item_item then
						l_sort_key := l_item_item.as_atomic_value
					else
						l_sort_key := Void  -- = () - an empty sequence
					end
					l_key_list.put_last (l_sort_key)
					l_cursor.forth
				end

				-- Make the sort stable by adding the record number.

				count := count + 1

				-- next line is the only difference from the Precursor
				-- (apart from the type of `l_sort_record',
				--  the use of `group_iterator' for `base_iterator' throughout)
				--  and the setting and saving of the current group iterator).

				check
					attached group_iterator.current_grouping_key as l_current_grouping_key
					attached group_iterator.current_group_iterator as l_current_group_iterator
				then
					create l_sort_record.make (group_iterator.item, l_key_list, count, l_current_grouping_key, l_current_group_iterator)
					l_node_keys.put_last (l_sort_record)
				end
				group_iterator.forth
			end
			if attached group_iterator.error_value as l_error_value then
				check is_error: group_iterator.is_error end
				check attached context.transformer as l_context_transformer then
					l_context_transformer.report_fatal_error (l_error_value)
				end
			end
			count_determined := True
		end

invariant

	group_iterator: group_iterator = base_iterator

end

