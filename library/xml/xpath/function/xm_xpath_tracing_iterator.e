indexing

	description:

		"Iterators that support the XPath trace() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TRACING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_TRACE_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_label: STRING; a_context: XM_XPATH_CONTEXT) is
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			label_not_void: a_label /= Void
			context_not_void: a_context /= Void
		do
			base_iterator := a_base_iterator
			label := a_label
			context := a_context
			is_empty_sequence := True
		ensure
			base_iterator_set: a_base_iterator = base_iterator
			label_set: label = a_label
			assumed_empty_for_now: is_empty_sequence = True
			context_set: context = a_context
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position
	
feature -- Status report

	after: BOOLEAN is
			-- Are there no more items in the sequence?
		do
			Result := base_iterator.after
		end

	is_empty_sequence: BOOLEAN
			-- is the sequence empty?

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			a_label: STRING
		do
			if index = 0 then
				base_iterator.start
			else
				base_iterator.forth
			end
			index := index + 1
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value) 
			elseif not base_iterator.after then
				is_empty_sequence := False
				item := base_iterator.item
				a_label := STRING_.concat (label, " [")
				a_label := STRING_.appended_string (a_label, index.out)
				a_label := STRING_.appended_string (a_label, "]")
				trace_item (a_label, item, context)
			elseif is_empty_sequence then
				trace_item (label, Void, context)
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, label, context)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Base iterator to be traced

	label: STRING
			-- Label for trace records

	context: XM_XPATH_CONTEXT
			-- Saved dynamic context

invariant

	base_iterator_not_void: base_iterator /= Void
	label_not_void: label /= Void
	context_not_void: context /= Void

end
	
