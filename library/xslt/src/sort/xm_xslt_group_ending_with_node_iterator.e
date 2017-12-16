note

	description:

		"Group iterator over node sets implementing group-ending-with algorithm"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_GROUP_ENDING_WITH_NODE_ITERATOR

inherit

	XM_XSLT_GROUP_NODE_ITERATOR

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE];
			a_key: XM_XSLT_PATTERN;
			a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_locator: XM_XPATH_LOCATOR)
			-- Establish invariant.
		require
			a_population_not_void: a_population /= Void
			a_population_before: a_population.before
			a_key_not_void: a_key /= Void
			a_context_not_void: a_context /= Void
		do
			population := a_population
			key_pattern := a_key
			base_context := a_context
			running_context := a_context.new_pattern_context
			running_context.set_current_iterator (population)
			locator := a_locator
		ensure
			population_set: population = a_population
			key_set: key_pattern = a_key
			base_context_set: base_context = a_context
			locator_set: locator = a_locator
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Initial item of current group
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

	current_grouping_key: detachable XM_XPATH_ATOMIC_VALUE
			-- Grouping key for current group
		do
			-- Result := Void
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?

feature -- Cursor movement

	forth
			-- Move to next position
		local
			an_error: XM_XPATH_ERROR_VALUE
			matched: BOOLEAN
			l_internal_item: like internal_item
			l_current_members: like current_members
			l_next_candidate: like next_candidate
		do
			index := index + 1
			if after_pending then
				after := True
			else
				create l_current_members.make_default
				current_members := l_current_members
				if index = 1 then
					population.start
					if not population.after then
						l_internal_item := population.item
						internal_item := l_internal_item
						if not l_internal_item.is_node then
							create an_error.make_from_string ("Member of group-ending-with population is not a node.",
																		 Xpath_errors_uri, "XTTE1120", Dynamic_error)
							an_error.set_location (locator.system_id, locator.line_number)
							check attached running_context.transformer as l_running_context_transformer then
								l_running_context_transformer.report_fatal_error (an_error)
							end
						end
					end
				else
					l_internal_item := next_candidate
					internal_item := l_internal_item
				end
				if l_internal_item /= Void then
					if not l_current_members.extendible (1) then
						l_current_members.resize (2 * l_current_members.count)
					end
					l_current_members.put_last (l_internal_item)
				end
				from
					l_next_candidate := l_internal_item
					next_candidate := l_next_candidate
				until
					is_error or else population.after or matched or l_next_candidate = Void
				loop
					population.forth
					if not population.after then
						key_pattern.match (l_next_candidate.as_node, running_context)
						if attached key_pattern.error_value as l_error_value then
							check is_error: key_pattern.is_error end
							set_last_error (l_error_value)
						elseif key_pattern.last_match_result then
							l_next_candidate := population.item
							next_candidate := l_next_candidate
							matched := True
						else
							l_next_candidate := population.item
							next_candidate := l_next_candidate
							if not l_current_members.extendible (1) then
								l_current_members.resize (2 * l_current_members.count)
							end
							l_current_members.put_last (l_next_candidate)
						end
					end
				end
				if not is_error and then population.after then
					after_pending := True
				end
			end
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterator over the members of the current group, in population order.
		do
			if not attached current_members as l_current_members or else l_current_members.is_empty then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
			else
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_NODE]} Result.make (l_current_members)
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (population.another, key_pattern, base_context, locator)
		end

feature {NONE} -- Implementation

	internal_item: detachable XM_XPATH_NODE
			-- Initial item of current group

	population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterator over population

	key_pattern: XM_XSLT_PATTERN
			-- Grouping key

	base_context: XM_XSLT_EVALUATION_CONTEXT
			-- Original context

	running_context: XM_XSLT_EVALUATION_CONTEXT
			-- Context used

	next_candidate: detachable like item
			-- Next item in population

	current_members: detachable DS_ARRAYED_LIST [XM_XPATH_NODE]
			-- Members of current group

	locator: XM_XPATH_LOCATOR
			-- Location of xsl:for-each-group

	after_pending: BOOLEAN
			-- `True' if next call to forth will go `after'

invariant

	population_not_void: population /= Void
	key_pattern_not_void: key_pattern /= Void
	base_context_not_void: base_context /= Void
	running_context_not_void: running_context /= Void

end

