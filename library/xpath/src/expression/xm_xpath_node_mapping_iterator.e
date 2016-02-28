note

	description:

		"Objects that merge a sequence of sequences of nodes into a single flat sequence."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
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

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_mapping_function: XM_XPATH_NODE_MAPPING_FUNCTION; a_context: detachable XM_XPATH_CONTEXT)
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
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := not before and then internal_item = Void
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

	results: detachable like base_iterator
			-- An iterator that delivers the results

	mapping_function: XM_XPATH_NODE_MAPPING_FUNCTION
			-- The mapping function

	context: detachable XM_XPATH_CONTEXT
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
				if attached results as l_results then
					if attached l_results.error_value as l_error_value then
						check is_error: l_results.is_error end
						set_last_error (l_error_value)
						finished := True
					elseif l_results.before then
						l_results.start
					elseif not l_results.after then
						l_results.forth
					end
					if not l_results.is_error and then not l_results.after then
						internal_item := l_results.item.as_node
						check
							item_is_node: internal_item /= Void
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
					if attached base_iterator.error_value as l_error_value then
						check is_error: base_iterator.is_error end
						set_last_error (l_error_value)
						finished := True
					elseif not base_iterator.after then
						next_source := base_iterator.item
							-- Call the supplied mapping function
						if attached context as l_context then
							mapping_function.map_nodes (next_source, l_context)
						else
							mapping_function.map_nodes (next_source, new_dummy_context)
						end
					    check postcondition_of_map_nodes: attached mapping_function.last_node_iterator as l_results then
						    results := l_results
						    if attached l_results.error_value as l_error_value then
							    check is_error: l_results.is_error end
							    set_last_error (l_error_value)
							    finished := True
						    elseif l_results.before then
							    l_results.start
						    elseif not l_results.after then
							    l_results.forth
						    end
						    if not l_results.is_error and then not l_results.after then
							    internal_item := l_results.item.as_node
							    check
								    item_is_node: attached internal_item as l_internal_item
								    -- This relies upon correct logic within routines which create `Current'
							    then
								    if attached l_internal_item.error_value as l_error_value then
									    check is_error: l_internal_item.is_error end
									    set_last_error (l_error_value)
								    end
							    end
							    finished := True
						    end
						end

						-- Now go round the loop again, to get the next item from `base_iterator' or `results'

					else
						results := Void
						internal_item := Void
						finished := True
					end
				end
			end
		end


	internal_item: detachable XM_XPATH_NODE
			-- Node at the current position

	new_dummy_context: XM_XPATH_CONTEXT
			-- New dummy context
		local
			l_function_library: XM_XPATH_CORE_FUNCTION_LIBRARY
		do
			create l_function_library.make
			create {XM_XPATH_STAND_ALONE_DYNAMIC_CONTEXT} Result.make_restricted (l_function_library)
		ensure
			new_dummy_context_not_void: Result /= Void
		end
		
invariant

	base_iterator_not_void: base_iterator /= Void
	mapping_function_not_void: mapping_function /= void

end
