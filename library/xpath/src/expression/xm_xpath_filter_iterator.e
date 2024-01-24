note

	description:

		"Objects that filter a sequence using a filter expression."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_FILTER_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_FILTER_TEST [XM_XPATH_ITEM]
		export {NONE} all end

create

	make, make_non_numeric

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_filter: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT; a_is_single_boolean: BOOLEAN)
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			filter_not_void: a_filter /= Void
			context_not_void: a_context /= Void
		do
			base_iterator := a_base_iterator
			filter := a_filter
			if a_context.has_push_processing then
				filter_context := a_context.new_minor_context
			else
				filter_context := a_context.new_context
			end
			filter_context.set_current_iterator (base_iterator)
			is_singleton_boolean_filter := a_is_single_boolean
		ensure
			base_iterator_set: base_iterator = a_base_iterator
			filter_set: filter = a_filter
			is_singleton_boolean_filter_set: is_singleton_boolean_filter = a_is_single_boolean
		end

	make_non_numeric (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_filter: XM_XPATH_EXPRESSION; a_context: XM_XPATH_CONTEXT)
			-- Establish invariant for non-numeric results.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			filter_not_void: a_filter /= Void
			context_not_void: a_context /= Void
		do
			non_numeric := True
			make (a_base_iterator, a_filter, a_context, False)
		ensure
			non_numeric_filter: non_numeric
			base_iterator_set: base_iterator = a_base_iterator
			filter_set: filter = a_filter
			is_not_singleton_boolean_filter: not is_singleton_boolean_filter
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position
		do
			check precondition_not_off: attached current_item as l_current_item then
				Result := l_current_item
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := not before and then current_item = Void
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			advance
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			if not  non_numeric then
				create Result.make (base_iterator.another, filter, filter_context, is_singleton_boolean_filter)
			else
				create Result.make_non_numeric (base_iterator.another, filter, filter_context)
			end
		end

feature {NONE} -- Implementation

	current_item: detachable like item
			-- Current item

	advance
			-- Move to next matching node.
		local
			l_item: detachable like item
			l_matched: BOOLEAN
		do
			from
				l_matched := False
			until
				l_matched or (is_error or else (not base_iterator.before and then base_iterator.after))
			loop
				if base_iterator.before then
					base_iterator.start
				else
					base_iterator.forth
				end
				if attached base_iterator.error_value as l_error_value then
					check is_error: base_iterator.is_error end
					set_last_error (l_error_value)
				elseif not base_iterator.after then
					l_item := base_iterator.item
					test_match
					l_matched := last_match_test
				end
			end

			if attached error_value as l_error_value then
				check is_error: is_error end
				create {XM_XPATH_BOOLEAN_VALUE} l_item.make (False) -- we need SOMETHING to set an error upon!
				l_item.set_last_error (l_error_value)
				current_item := l_item
			elseif last_match_test then
				current_item := l_item
			else
				current_item := Void
			end
		end

end
