indexing

	description:

		"TBA"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_GROUP_STARTING_WITH_ITERATOR

inherit

	XM_XSLT_GROUP_ITERATOR
		redefine
			item
		end

creation

	make

feature {NONE} -- Initialization

	make (a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM];
			a_key: XM_XSLT_PATTERN;
			a_transformer: XM_XSLT_TRANSFORMER;
			a_locator: XM_XPATH_LOCATOR) is
			-- Establish invariant.
		require
			population_not_void: a_population /= Void
			key_not_void: a_key /= Void
			transformer_not_void: a_transformer /= Void
		do
			population := a_population
			key_pattern := a_key
			transformer := a_transformer
			locator := a_locator
		ensure
			population_set: population = a_population
			key_set: key_pattern = a_key
			transformer_set: transformer = a_transformer
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

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := index > 0 and then item = Void
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		local
			a_node: XM_XPATH_NODE
			next_group_reached: BOOLEAN
		do
			index := index + 1
			create current_members.make_default
			if index = 1 then
				population.start
				if not population.after then
					item := population.item
					a_node ?= item
					if a_node = Void then
						transformer.report_fatal_error ("XT1120: Member of group-starting-with population is not a node.", locator)
					end
				end
			else
				item := next_candidate
			end
			if item /= Void then current_members.force_last (item) end
			from
			until
				population.after or else next_group_reached
			loop
				population.forth
				if population.after then
					next_candidate := Void
				else
					next_candidate := population.item
					a_node ?= next_candidate
					if a_node = Void then
						transformer.report_fatal_error ("XT1120: Member of group-starting-with population is not a node.", locator)
					else
						if key_pattern.matches (a_node, transformer) then
							next_group_reached := True
						else
							current_members.force_last (next_candidate)
						end
					end
				end
			end
		end

feature -- Evaluation

	current_group_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the members of the current group, in population order.
		do
			create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (current_members)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (population, key_pattern, transformer, locator)
		end
	
feature {NONE} -- Implementation

	population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Iterator over population

	key_pattern: XM_XSLT_PATTERN
			-- Grouping key

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	next_candidate: like item
			-- Next item in population

	current_members: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			-- Members of current group

	locator: XM_XPATH_LOCATOR
			-- Location of xsl:for-each-group

invariant

	population_not_void: population /= Void
	key_pattern_not_void: key_pattern /= Void
	transformer_not_void: transformer /= Void

end
	
