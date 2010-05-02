note

	description:

		"Objects that render a sorted iteration of nodes."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_SORTED_NODE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_last_position_finder, last_position
		end

	KL_PART_COMPARATOR [XM_XSLT_NODE_SORT_RECORD]

	XM_XPATH_EXCEPTION_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE];
			some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION])
			-- Establish invariant
		require
			context_not_void: a_context /= Void
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			at_least_one_sort_key: some_sort_keys /= Void and then some_sort_keys.count > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
		do
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
				key_comparers.put_last (a_cursor.item.comparer)
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

feature -- Access

	item: XM_XPATH_NODE
			-- Node at the current position
		do
			Result := node_keys.item (index).item.as_node
		end

	last_position: INTEGER
			-- Last position (= number of items in sequence)
		do
			if not count_determined then
				perform_sorting
			end
			Result := count
		ensure then
			not is_error implies count_determined
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in sequence (-1 = not yet known)

feature -- Status report

	count_determined: BOOLEAN
			-- Has `count' been determined yet?

	is_last_position_finder: BOOLEAN
			-- Can `Current' find the last position?
		do
			Result := True
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := count_determined and then index > count
		end

feature -- Status report

	less_than (u, v: XM_XSLT_NODE_SORT_RECORD): BOOLEAN
			-- Is `u' considered less than `v'?
		local
			l_sort_key, l_other_sort_key: XM_XPATH_ITEM
			l_index: INTEGER
			l_finished: BOOLEAN
			l_comparison: INTEGER
			l_comparator: KL_PART_COMPARATOR [XM_XPATH_ITEM]
			l_atomic: XM_XPATH_ATOMIC_COMPARER
			l_descending: XM_XPATH_DESCENDING_COMPARER
		do
			from
				l_index := 1
			until
				l_finished
			loop
				l_comparator := key_comparers.item (l_index)
				l_atomic ?= l_comparator
				if l_atomic /= Void then
					l_atomic.set_dynamic_context (context)
				else
					l_descending ?= l_comparator
					if l_descending /= Void then
						l_atomic ?= l_descending.base_comparer
						if l_atomic /= Void then
							l_atomic.set_dynamic_context (context)
						end
					end
				end
				l_sort_key := u.key_list.item (l_index)
				l_other_sort_key := v.key_list.item (l_index)
				if l_sort_key = Void then -- ()
					if l_other_sort_key = Void then
						l_comparison := 0
					else
						l_comparison := -1
					end
				elseif l_other_sort_key = Void then -- ()
					l_comparison := +1
				else

					-- Neither key is the empty sequence

					if l_comparator.less_than (l_sort_key, l_other_sort_key) then
						l_comparison := -1
					elseif l_comparator.greater_than (l_sort_key, l_other_sort_key) then
						l_comparison := +1
					else
						l_comparison := 0
					end
				end
				if l_comparison = 0 then
					l_index := l_index + 1
					l_finished := l_index > sort_keys.count
				else
					l_finished := True -- we have a decision
				end
			end
			if l_comparison = 0 then
				Result := u.record_number < v.record_number -- stable sort
			else
				Result := 	l_comparison = -1
			end
		end


feature -- Cursor movement

	forth
			-- Move to next position
		do
			if not count_determined then perform_sorting end
			index := index + 1
		ensure then
			not is_error implies count_determined
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

			create Result.make (context, base_iterator.another, sort_keys)
			Result.set_count (count)
			Result.set_node_keys (node_keys)
		ensure then
			not is_error implies count_determined
		end


feature {XM_XSLT_SORTED_NODE_ITERATOR} -- Local

	set_count (a_count: INTEGER)
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

	set_node_keys (some_node_keys: DS_ARRAYED_LIST [XM_XSLT_NODE_SORT_RECORD])
			-- Set `node_keys'.
		do
			node_keys := some_node_keys
		ensure
			node_keys_set: node_keys = some_node_keys
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Sequence to be sorted

	sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			-- Sort keys

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Evaluation context

	key_comparers: DS_ARRAYED_LIST [KL_PART_COMPARATOR [XM_XPATH_ITEM]]
			-- Comparers

	node_keys: DS_ARRAYED_LIST [XM_XSLT_NODE_SORT_RECORD]
			-- List of nodes with their sort-keys

	make_default
			-- Purely for compatibility with the interface
		do
			check
				not_implemented: False
			end
		end

	perform_sorting
			-- Sort the sequence.
		require
			not_yet_sorted: not count_determined
		local
			l_sorter: DS_QUICK_SORTER [XM_XSLT_NODE_SORT_RECORD]
			l_retried: BOOLEAN
			l_error: XM_XPATH_ERROR_VALUE
		do
			if l_retried then
				count_determined := True
				create l_error.make_from_string ("Atomic values not comparable", Xpath_errors_uri, "XTDE1030", Dynamic_error)
				set_last_error (l_error)
			else
				build_array
				if count > 1 then
					create l_sorter.make (Current)
					l_sorter.sort (node_keys)
				end
			end
		ensure
			count_determined: count_determined
			positive_count: count >= 0
		rescue
			if is_non_comparable_exception then
				count_determined := False
				l_retried := True
				retry
			end
		end

	build_array
			-- Build `node_keys'.
		require
			not_yet_sorted: not count_determined
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_sort_record: XM_XSLT_NODE_SORT_RECORD
			l_key_list: DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			l_sort_key: XM_XPATH_ATOMIC_VALUE
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			create node_keys.make_default

			-- Initialize the array with data.

			if not base_iterator.is_error then
				from
					base_iterator.start
				until
					is_error or base_iterator.after
				loop
					if node_keys.is_full then
						node_keys.resize (node_keys.count * 2)
					end
					from
						create l_key_list.make (sort_keys.count)
						l_cursor := sort_keys.new_cursor; l_cursor.start
					until
						is_error or l_cursor.after
					loop
						create l_item.make (Void)
						l_cursor.item.sort_key.evaluate_item (l_item, context)
						if l_item.item /= Void then
							if l_item.item.is_error then
								set_last_error (l_item.item.error_value)
							else
								if l_item.item.is_atomic_value then
									l_sort_key := l_item.item.as_atomic_value
								else
									create {XM_XPATH_STRING_VALUE} l_sort_key.make (l_item.item.as_node.string_value)
								end
							end
						else
							l_sort_key := Void  -- = () - an empty sequence
						end
						l_key_list.put_last (l_sort_key)
						l_cursor.forth
					end

					-- Make the sort stable by adding the record number.

					count := count + 1
					create l_sort_record.make (base_iterator.item, l_key_list, count)
					node_keys.put_last (l_sort_record)
					base_iterator.forth
				end
				if not is_error and base_iterator.is_error then
					set_last_error (base_iterator.error_value)
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

