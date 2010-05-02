note

	description:

		"Objects that merge a sequence of sequences of nodes into a single flat sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_MAPPING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

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

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mapping_function: XM_XPATH_NODE_MAPPING_FUNCTION; a_context: XM_XPATH_CONTEXT)
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			mapping_function_not_void: a_mapping_function /= void
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

	item: XM_XPATH_NODE
			-- Node at the current position

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result ?= ANY_.to_any (Current)
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := not before and then item = Void
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
		local
			new_base: like base_iterator
			a_context: like context
		do
			new_base := base_iterator.another
			a_context := context
			if a_context /= void then
				a_context := a_context.new_context
				a_context.set_current_iterator (new_base)
			end
			create Result.make (new_base, mapping_function, a_context)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- The underlying iterator

	results: like base_iterator
			-- An iterator that delivers the results

	mapping_function: XM_XPATH_NODE_MAPPING_FUNCTION
			-- The mapping function

	context: XM_XPATH_CONTEXT
			-- Optional dynamic context

	advance
			-- Move to the next matching node
		local
			finished: BOOLEAN
			next_source: XM_XPATH_ITEM
		do
			from
			until
				finished
			loop
				if results /= Void then
					if results.is_error then
						set_last_error (results.error_value)
						finished := True
					elseif results.before then
						results.start
					elseif not results.after then
						results.forth
					end
					if not results.is_error and then not results.after then
						item := results.item.as_node
						check
							item_is_node: item /= Void
							-- This relies upon correct logic within routines which create `Current'
						end
						finished := True
					else
						results := Void
					end
				end
				if not finished then
						check
							no_results_yet: results = Void
						end
					if base_iterator.before then
						base_iterator.start
					elseif not base_iterator.after then
						base_iterator.forth
					end
					if base_iterator.is_error then
						set_last_error (base_iterator.error_value)
						finished := True
					elseif not base_iterator.after then
						next_source := base_iterator.item

						-- Call the supplied mapping function

						mapping_function.map_nodes (next_source, context)
						results := mapping_function.last_node_iterator
						if results.is_error then
							set_last_error (results.error_value)
							finished := True
						elseif results.before then
							results.start
						elseif not results.after then
							results.forth
						end
						if not results.is_error and then not results.after then
							item := results.item.as_node
							check
								item_is_node: item /= Void
								-- This relies upon correct logic within routines which create `Current'
							end
							if item.is_error then
								set_last_error (item.error_value)
							end
							finished := True
						end

						-- Now go round the loop again, to get the next item from `base_iterator' or `results'

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
	mapping_function_not_void: mapping_function /= void

end
