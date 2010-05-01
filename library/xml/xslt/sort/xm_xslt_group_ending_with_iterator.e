note

	description:

		"Group iterator implementing group-ending-with algorithm"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_GROUP_ENDING_WITH_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
			a_key: XM_XSLT_PATTERN;
			a_context: XM_XSLT_EVALUATION_CONTEXT;
			a_locator: XM_XPATH_LOCATOR) is
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

	item: XM_XPATH_ITEM
			-- Initial item of current group

	current_grouping_key: XM_XPATH_ATOMIC_VALUE is
			-- Grouping key for current group
		do
			-- Result := Void
		end
	
feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			an_error: XM_XPATH_ERROR_VALUE
			matched: BOOLEAN
		do
			index := index + 1
			if after_pending then
				after := True
			else
				create current_members.make_default
				if index = 1 then
					population.start
					if not population.after then
						item := population.item
						if not item.is_node then
							create an_error.make_from_string ("Member of group-ending-with population is not a node.",
																		 Xpath_errors_uri, "XTTE1120", Dynamic_error)
							an_error.set_location (locator.system_id, locator.line_number)
							running_context.transformer.report_fatal_error (an_error)
						end
					end
				else
					item := next_candidate
				end
				if item /= Void then
					if not current_members.extendible (1) then
						current_members.resize (2 * current_members.count)
					end
					current_members.put_last (item)
				end
				from
					next_candidate := item
				until
					is_error or else population.after or matched or next_candidate = Void
				loop
					population.forth
					if not population.after then
						key_pattern.match (next_candidate.as_node, running_context)
						if key_pattern.is_error then
							set_last_error (key_pattern.error_value)
						elseif key_pattern.last_match_result then
							next_candidate := population.item
							matched := True
						else
							next_candidate := population.item
							if not current_members.extendible (1) then
								current_members.resize (2 * current_members.count)
							end
							current_members.put_last (next_candidate)
						end
					end
				end
				if not is_error and then population.after then
					after_pending := True
				end
			end
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the members of the current group, in population order.
		do
			if current_members.is_empty then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
			else
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (current_members)
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (population.another, key_pattern, base_context, locator)
		end
	
feature {NONE} -- Implementation

	population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over population

	key_pattern: XM_XSLT_PATTERN
			-- Grouping key

	base_context: XM_XSLT_EVALUATION_CONTEXT
			-- Original context
	
	running_context: XM_XSLT_EVALUATION_CONTEXT
			-- Context used

	next_candidate: like item
			-- Next item in population

	current_members: DS_ARRAYED_LIST [XM_XPATH_ITEM]
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
	
