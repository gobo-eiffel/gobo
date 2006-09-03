indexing

	description:

		"Objects that render a sorted iteration of items."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_SORTED_ITERATOR

inherit

	XM_XPATH_LAST_POSITION_FINDER [XM_XPATH_ITEM]

	KL_COMPARATOR [XM_XSLT_SORT_RECORD]

create

	make

feature {NONE} -- Initialization

	make (a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
			some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]) is
			-- Establish invariant
		require
			context_not_void: a_context /= Void
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			at_least_one_sort_key: some_sort_keys /= Void and then some_sort_keys.count > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
		do
			context := a_context
			base_iterator := a_base_iterator
			sort_keys := some_sort_keys
			from
				create key_comparers.make (sort_keys.count)
				a_cursor := sort_keys.new_cursor; a_cursor.start
			variant
				sort_keys.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				key_comparers.put_last (a_cursor.item.comparer)
				a_cursor.forth
			end

			-- Avoid doing the sort until the user wants the first item. This is because
			--  sometimes the user only wants to know whether the collection is empty.

		ensure
			context_set: context = a_context
			base_iterator_set: base_iterator = a_base_iterator
			sort_keys_set: sort_keys = some_sort_keys
		end

feature -- Access

	item: XM_XPATH_ITEM is
			-- Value or node at the current position
		do
			Result := node_keys.item (index).item
		end

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			if not count_determined then perform_sorting end
			Result := count
		ensure then
			count_determined
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in sequence (-1 = not yet known)

feature -- Status report

	count_determined: BOOLEAN
			-- Has `count' been determined yet?

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := count_determined and then index > count
		end

feature -- Status report

	less_than (u, v: XM_XSLT_SORT_RECORD): BOOLEAN is
			-- Is `u' considered less than `v'?
		local
			a_sort_key, another_sort_key: XM_XPATH_ITEM
			an_index: INTEGER
			finished: BOOLEAN
			a_comparison: INTEGER
			a_comparator: KL_COMPARATOR [XM_XPATH_ITEM]
		do
			from
				an_index := 1
			until
				finished
			loop
				a_comparator := key_comparers.item (an_index)
				a_sort_key := u.key_list.item (an_index)
				another_sort_key := v.key_list.item (an_index)
				if a_sort_key = Void then -- ()
					if another_sort_key = Void then
						a_comparison := 0
					else
						a_comparison := -1
					end
				elseif another_sort_key = Void then -- ()
					a_comparison := +1
				else

					-- Neither key is the empty sequence

					if a_comparator.less_than (a_sort_key, another_sort_key) then
						a_comparison := -1
					elseif a_comparator.greater_than (a_sort_key, another_sort_key) then
						a_comparison := +1
					else
						a_comparison := 0
					end
				end
				if a_comparison = 0 then
					an_index := an_index + 1
					finished := an_index > sort_keys.count
				else
					finished := True -- we have a decision
				end
			end
			if a_comparison = 0 then
				Result := u.record_number < v.record_number -- stable sort
			else
				Result := 	a_comparison = -1
			end
		end


feature -- Cursor movement
			
	forth is
			-- Move to next position
		do
			if not count_determined then perform_sorting end
			index := index + 1
		ensure then
			count_determined			
		end	

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do

			-- Make sure the sort has been done, so that multiple iterators over the
			--  same sorted data only do the sorting once.

			if not count_determined then perform_sorting end

			-- The new iterator is the same as the old one,
			--  except for its start position.

			create Result.make (context, base_iterator, sort_keys)
			Result.set_count (count)
			Result.set_node_keys (node_keys)
		ensure then
			count_determined
		end


feature {XM_XSLT_SORTED_ITERATOR} -- Local

	set_count (a_count: INTEGER) is
			-- Set `count'.
		require
			positive_count: count >= 0
		do
			count_determined := True
			count := a_count
		ensure
			count_determined: count_determined
			count_set: count = a_count
		end

	set_node_keys (some_node_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_RECORD]) is
			-- Set `node_keys'.
		do
			node_keys := some_node_keys
		ensure
			node_keys_set: node_keys = some_node_keys
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence to be sorted
	
	sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			-- Sort keys

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Evaluation context

	key_comparers: DS_ARRAYED_LIST [KL_COMPARATOR [XM_XPATH_ITEM]]
			-- Comparers

	node_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_RECORD]
			-- List of items with their sort-keys

	make_default is
			-- Purely for compatibility with the interface
		do
			check
				not_implemented: False
			end
		end

	perform_sorting is
			-- Sort the sequence.
		require
			not_yet_sorted: not count_determined
		local
			a_sorter: DS_QUICK_SORTER [XM_XSLT_SORT_RECORD]
		do
			build_array
			if count > 1 then
				create a_sorter.make (Current)
				a_sorter.sort (node_keys)
			end
		ensure
			count_determined: count_determined
			positive_count: count >= 0
		end

	build_array is
			-- Build `node_keys'.
		require
			not_yet_sorted: not count_determined
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			a_sort_record: XM_XSLT_SORT_RECORD
			a_key_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			a_sort_key: XM_XPATH_ATOMIC_VALUE
		do
			create node_keys.make_default
			
			-- Initialize the array with data.

			if not base_iterator.is_error then
				from
					base_iterator.start
				until
					context.transformer.is_error or else base_iterator.after
				loop
					if node_keys.is_full then
						node_keys.resize (node_keys.count * 2)
					end
					from
						create a_key_list.make (sort_keys.count)
						a_cursor := sort_keys.new_cursor; a_cursor.start
					until
						a_cursor.after
					loop
						a_cursor.item.sort_key.evaluate_item (context)
						if a_cursor.item.sort_key.last_evaluated_item /= Void then
							if a_cursor.item.sort_key.last_evaluated_item.is_error then
								context.transformer.report_fatal_error (a_cursor.item.sort_key.last_evaluated_item.error_value)
							else
								check
									sort_key_is_atomic: a_cursor.item.sort_key.last_evaluated_item.is_atomic_value
								end
								a_sort_key := a_cursor.item.sort_key.last_evaluated_item.as_atomic_value
							end
						else
							a_sort_key := Void  -- = () - an empty sequence
						end
						a_key_list.put_last (a_sort_key)
						a_cursor.forth
					end

					-- Make the sort stable by adding the record number.
					
					count := count + 1
					create a_sort_record.make (base_iterator.item, a_key_list, count)
					node_keys.put_last (a_sort_record)
					base_iterator.forth
				end
				if base_iterator.is_error then
					context.transformer.report_fatal_error (base_iterator.error_value)
				end
			end
			count_determined := True
		ensure
			count_determined: count_determined
			positive_count: count >= 0
		end

invariant

	base_iterator_not_void: base_iterator /= Void
	at_least_one_sort_key: sort_keys /= Void and then sort_keys.count > 0
	context_not_void: context /= Void
	one_key_comparer_per_sort_key: key_comparers /= Void and then key_comparers.count = sort_keys.count

end
	
