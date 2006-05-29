indexing

	description:

		"Objects that merge a sequence of sequences into a single flat sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MAPPING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

		-- This class merges a sequence of sequences into a single flat
		--  sequence. It takes as inputs an iteration, and a mapping function to be
		--  applied to each Item returned by that iteration. The mapping function itself
		--  returns another iteration. The result is an iteration of the concatenation of all
		--  the iterations returned by the mapping function.

		-- This is a powerful class. It is used, with different mapping functions,
		--  in a great variety of ways. It underpins the way that "for" expressions and
		--  path expressions are evaluated, as well as sequence expressions. It is also
		--  used in the implementation of the XSLT document(), key(), and id() functions.

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mapping_function: XM_XPATH_MAPPING_FUNCTION; a_context: XM_XPATH_CONTEXT) is
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			mapping_function_not_void: a_mapping_function /= Void
		do
			base_iterator := a_base_iterator
			mapping_function := a_mapping_function
			context := a_context
		ensure
			base_set: base_iterator = a_base_iterator
			mapping_function_set: mapping_function = a_mapping_function
			context_set: context = a_context
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := not before and then item = Void
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			advance
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		local
			new_base: like base_iterator
			a_context: like context
		do
			new_base := base_iterator.another
			a_context := context
			if a_context /= Void then
				if a_context.has_push_processing then
					a_context := a_context.new_minor_context
				else
					a_context := a_context.new_context
				end
				a_context.set_current_iterator (new_base)
			end
			create Result.make (new_base, mapping_function, a_context)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- The underlying iterator

	results: like base_iterator
			-- An iterator that delivers the results

	mapping_function: XM_XPATH_MAPPING_FUNCTION
			-- The mapping function

	context: XM_XPATH_CONTEXT
			-- Optional dynamic context

	advance is
			-- Move to the next matching node
		local
			finished: BOOLEAN
			next_source: like item
			a_mapped_item: XM_XPATH_MAPPED_ITEM
		do
			from
			until
				finished
			loop
				if results /= Void then
					if results.is_error then
						finished := True
						create {XM_XPATH_INVALID_ITEM} item.make (results.error_value)
						set_last_error (results.error_value)
					elseif results.before then
						results.start
					elseif not results.after then
						results.forth
					end
					if not finished and results.is_error then
						finished := True
						create {XM_XPATH_INVALID_ITEM} item.make (results.error_value)
						set_last_error (results.error_value)
					end
					if not results.is_error then
						if not results.after then
							item := results.item
							finished := True
						else
							results := Void
						end
					end
				end
				if not finished then
						check
							no_results_yet: results = Void
						end
					if base_iterator.is_error then
						finished := True
						create {XM_XPATH_INVALID_ITEM} item.make (base_iterator.error_value)
						set_last_error (base_iterator.error_value)
					elseif base_iterator.before then
						base_iterator.start
					elseif not base_iterator.after then
						base_iterator.forth
					end
					if base_iterator.is_error then
						create {XM_XPATH_INVALID_ITEM} item.make (base_iterator.error_value)
						set_last_error (base_iterator.error_value)
					elseif not base_iterator.after then
						next_source := base_iterator.item

						-- Call the supplied mapping function

						mapping_function.map (next_source, context)
						a_mapped_item := mapping_function.last_mapped_item

						if a_mapped_item /= Void then
							if not a_mapped_item.is_sequence then
								results := Void
								finished := True
								item := a_mapped_item.item
							else
								results := a_mapped_item.sequence
								if results.is_error then
									finished := True
									create {XM_XPATH_INVALID_ITEM} item.make (results.error_value)
									set_last_error (results.error_value)
								elseif results.before then
									results.start
								elseif not results.after then
									results.forth
								end
								if not results.is_error and then not results.after then
									item := results.item
									finished := True
								end
							end
						end
					else
						results := Void
						item := Void
						finished := True
					end
				end
			end
		end

invariant

	base_iterator_not_void: base_iterator /= Void
	mapping_function_not_void: mapping_function /= Void

end
