note

	description:

	"Objects that can be passed to an XM_XPATH_CONTEXT_MAPPING_ITERATOR.%
	%Such objects, when given an XM_XPATH_ITEM, generate a%
	%XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] which delivers%
	%a series of such items, which each in turn become the context item."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_CONTEXT_MAPPING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

create

	make

feature {NONE} -- Initialization

	make (a_mapping_function: like mapping_function; a_context: like context)
			-- Initialize `Current'.
		require
			a_mapping_function_not_void: a_mapping_function /= Void
			a_context_not_void: a_context /= Void
			current_iterator_not_void: a_context.current_iterator /= Void
		do
			mapping_function := a_mapping_function
			context := a_context
			check precondition_current_iterator_not_void: attached a_context.current_iterator as l_context_current_iterator then
				base_iterator := l_context_current_iterator
			end
		ensure
			mapping_function_set: mapping_function = a_mapping_function
			context_set: context = a_context
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value at `index'
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := (internal_item = Void)
		end

feature -- Cursor movement

	forth
			-- Move to next position
		local
			l_finished: BOOLEAN
		do
			from
				index := index + 1
			until
				l_finished
			loop
				if attached results_iterator as l_results_iterator then
					if l_results_iterator.after then
						internal_item := Void
						results_iterator := Void
						l_finished := base_iterator.after
					else
						l_results_iterator.forth
						if attached l_results_iterator.error_value as l_error_value then
							check is_error: l_results_iterator.is_error end
							set_last_error (l_error_value)
							l_finished := True
						elseif l_results_iterator.after then
							internal_item := Void
							l_finished := base_iterator.after
						else
							internal_item := l_results_iterator.item
							l_finished := True
						end
					end
				end
				if not l_finished then
					-- now advance the context item
					if base_iterator.before then
						base_iterator.start
					else
						base_iterator.forth
					end
					if attached base_iterator.error_value as l_error_value then
						check is_error: base_iterator.is_error end
						l_finished := True
						set_last_error (l_error_value)
					elseif base_iterator.after then
						results_iterator := Void
						internal_item := Void
						l_finished := True
					else
						mapping_function.map (context)
						check postcondition_of_map: attached mapping_function.last_mapped_sequence as l_results_iterator then
							results_iterator := l_results_iterator
							if attached l_results_iterator.error_value as l_error_value then
								check is_error: l_results_iterator.is_error end
								l_finished := True
								set_last_error (l_error_value)
							else
								l_results_iterator.start
								if l_results_iterator.after then
									internal_item := Void
									-- this is the only branch which the loop will continue
								else
									internal_item := l_results_iterator.item
									l_finished := True
								end
							end
						end
					end
				end
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		local
			l_context: like context
		do
			if context.has_push_processing then
				l_context := context.new_minor_context
			else
				l_context := context.new_context
			end
			l_context.set_current_iterator (base_iterator.another)
			create Result.make (mapping_function, l_context)
		end

feature {NONE} -- Implementation

	mapping_function: XM_XPATH_CONTEXT_MAPPING_FUNCTION
			-- Function producing sequence from `context.context_item'

	context: XM_XPATH_CONTEXT
			-- Saved dynamic context

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Current iterator from `context'

	results_iterator: detachable like base_iterator
			-- Sequence from `mapping_function'

	internal_item: detachable XM_XPATH_ITEM
			-- Value at `index'

invariant

	mapping_function_not_void: mapping_function /= Void
	context_not_void: context /= Void
	base_iterator_not_void: base_iterator /= Void

end
