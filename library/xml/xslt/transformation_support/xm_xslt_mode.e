indexing

	description:

		"Objects that use a set of rules to implement an XSLT mode"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_MODE

inherit

	XM_XSLT_SHARED_NO_NODE_TEST

	XM_XPATH_TYPE
	
	XM_XPATH_DEBUGGING_ROUTINES

	MA_DECIMAL_MATH

	XM_XSLT_CONFIGURATION_CONSTANTS

creation

	make, make_with_copy

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create rule_dictionary.make (1, number_of_buckets + Namespace_node + 1)
		end

	make_with_copy (other: XM_XSLT_MODE) is
			-- Create by copying rules from `other'.
		require
			other_mode_not_void: other /= Void
		local
			an_index: INTEGER
			a_rule, a_new_rule: XM_XSLT_RULE
			a_rule_dictionary: ARRAY [XM_XSLT_RULE]
		do
			create rule_dictionary.make (1, number_of_buckets + Namespace_node + 1)
			from
				a_rule_dictionary := other.rule_dictionary
				an_index := 1
			variant
				a_rule_dictionary.count + 1 - an_index
			until
				an_index > a_rule_dictionary.count
			loop
				a_rule := a_rule_dictionary.item (an_index)
				if a_rule /= Void then
					create a_new_rule.make_with_copy (a_rule)
					rule_dictionary.put (a_new_rule, an_index)
				end
				an_index := an_index +1
			end
			sequence_number := other.sequence_number
		end

feature -- Access

	rule (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): XM_XSLT_RULE_VALUE is
			-- Handler for `a_node'
		require
			node_not_void: a_node /= Void
			transformer_not_in_error: a_transformer /= Void and then not a_transformer.is_error
		local
			a_key, a_policy, a_specific_precedence: INTEGER
			a_rule, a_specific_rule: XM_XSLT_RULE
			a_specific_priority: MA_DECIMAL
			finished: BOOLEAN
		do
			a_key := rule_key (a_node.fingerprint, a_node.node_type)
			a_policy := a_transformer.recovery_policy
			a_specific_precedence := -1
			a_specific_priority := negative_infinity

			-- Search the specific list for this node type / node name.

			if a_key /= Any_node + 1 then
				from
					a_rule := rule_dictionary.item (a_key)
				until
					finished or else a_rule = Void
				loop

					-- If we already have a match, and the precedence or priority of this
            	--  rule is lower, quit the search for a second match.

					if a_specific_rule /= Void and then (a_rule.precedence  < a_specific_precedence or else
																	 (a_rule.precedence = a_specific_precedence and then a_rule.priority < a_specific_priority)) then
						finished := True
					else
						if a_rule.pattern.matches (a_node, a_transformer) then

							-- Is this a second match?

							if a_specific_rule /= Void then
								if a_rule.precedence = a_specific_precedence and then a_rule.priority = a_specific_priority then
									report_ambiguity (a_node, a_specific_rule, a_rule, a_transformer)
									finished := True
								end
							end
							a_specific_rule := a_rule
							a_specific_precedence := a_rule.precedence
							a_specific_priority := a_rule.priority
							if a_policy = Recover_silently then
								finished := True -- Find the first; they are in priority order.
							end

						end
						a_rule := a_rule.next_rule
					end
				end

				-- Search the general list.

				if not a_transformer.is_error then
					Result := general_rule (a_node, a_transformer, a_specific_rule, a_specific_precedence, a_specific_priority, a_policy)
				end
			end
		ensure
			Maybe_no_rule_matches: True
		end

	name: STRING is
			-- Name
		do
			if internal_name = Void then
				Result := "#default"
			else
				Result := internal_name
			end
		ensure
			name_not_void: Result /= Void
		end

feature -- Element change

	set_name (a_name: STRING) is
			-- Set name.
		require
			name_not_void: a_name /= Void
		do
			internal_name := internal_name
		ensure
			name_set: internal_name = internal_name
		end

	add_rule (a_pattern: XM_XSLT_PATTERN; a_handler: XM_XSLT_RULE_VALUE; a_precedence: INTEGER; a_priority: MA_DECIMAL) is
			-- Add a rule to handle `a_pattern'.
		require
			pattern_not_void: a_pattern /= Void
			handler_not_void: a_handler /= Void
		local
			a_fingerprint, a_node_kind, a_key: INTEGER
			a_rule, a_new_rule, a_previous_rule: XM_XSLT_RULE
			finished: BOOLEAN
		do

			-- Ignore a pattern that will never match, e.g. "@comment"

			if a_pattern /= xslt_empty_item then

				-- For fast lookup, we maintain one list for each element name for patterns that can only
				--  match elements of a given name, one list for each node type for patterns that can only
				--  match one kind of non-element node, and one generic list.
				-- Each list is sorted in precedence/priority order so we find the highest-priority rule first

				a_fingerprint := a_pattern.fingerprint
				a_node_kind := a_pattern.node_kind
				a_key := rule_key (a_fingerprint, a_node_kind)
				create a_new_rule.make (a_pattern, a_handler, a_precedence, a_priority, sequence_number)
				sequence_number := sequence_number + 1
				a_rule := rule_dictionary.item (a_key)
				if a_rule = Void then
					rule_dictionary.put (a_new_rule, a_key)
				else

					-- Insert the new rule into this list before others of the same precedence/priority

					from
						a_previous_rule := Void
					until
						finished or else a_rule = Void
					loop
						if a_rule.precedence < a_precedence or else
							(a_rule.precedence = a_precedence and then a_rule.priority <= a_priority) then
							a_new_rule.set_next_rule (a_rule)
							if a_previous_rule = Void then
								rule_dictionary.put (a_new_rule, a_key)
							else
								a_previous_rule.set_next_rule (a_new_rule)
							end
							finished := True
						else
							a_previous_rule := a_rule
							a_rule := a_rule.next_rule
						end
					end

					if a_rule = Void then
						a_previous_rule.set_next_rule (a_new_rule)
						a_new_rule.set_next_rule (Void)
					end
				end
			end
		ensure

		end

feature {XM_XSLT_MODE} -- Local
	
	rule_dictionary: ARRAY [XM_XSLT_RULE]
			-- Rule dictionary

	sequence_number: INTEGER
			-- Sequence number for next rule to be created

feature {NONE} -- Implementation

	number_of_buckets: INTEGER is 101
			-- Hash factor

	internal_name: STRING
			-- Mode name

	rule_key (a_fingerprint, a_node_kind: INTEGER): INTEGER is
			-- Rule dictionary index
		do
			if a_node_kind = Element_node then
				if a_fingerprint = - 1 then
					Result := Any_node + 1 -- the generic list
				else
					Result := Namespace_node + (a_fingerprint \\ number_of_buckets) + 1
				end
			else
				Result := a_node_kind + 1
			end
		end

	report_ambiguity (a_node: XM_XPATH_NODE; a_rule, another_rule: XM_XSLT_RULE; a_transformer: XM_XSLT_TRANSFORMER)	is
			-- Report an ambiguity;
			--  that is, the situation where two rules of the same
			--  precedence and priority match the same node.
		require
			node_not_void: a_node /= Void
			transformer_not_void: a_transformer /= Void
			rules_not_void: a_rule /= Void and then another_rule /= Void
		do
			todo ("report_ambiguity", False)
		end

	general_rule (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER; a_specific_rule: XM_XSLT_RULE;
		a_specific_precedence: INTEGER; a_specific_priority: MA_DECIMAL; a_policy: INTEGER): XM_XSLT_RULE_VALUE is
			-- Rule on general list
		require
			node_not_void: a_node /= Void
			transformer_not_in_error: a_transformer /= Void and then not a_transformer.is_error
			priority_not_void: a_specific_priority /= Void
		local
			a_rule, a_general_rule: XM_XSLT_RULE
			finished: BOOLEAN
		do
			from
				a_rule := rule_dictionary.item (Any_node + 1)
			until
				finished or else a_rule = Void
			loop
				if a_rule.precedence < a_specific_precedence or else
					(a_rule.precedence = a_specific_precedence and then a_rule.priority <= a_specific_priority) then

					-- no point in looking at a lower priority rule than the one we've got

					finished := True
				else
					if a_rule.pattern.matches (a_node, a_transformer) then

						-- Is it a second match?

						if a_general_rule /= Void then
							if a_rule.precedence = a_general_rule.precedence and then a_rule.priority = a_general_rule.priority then
									report_ambiguity (a_node, a_rule, a_general_rule, a_transformer)
									finished := True
							end
						else
							a_general_rule := a_rule
							if a_policy = Recover_silently then finished := True end 
						end
						
					end
					
				end
				a_rule := a_rule.next_rule
			end
			if a_specific_rule /= Void and then a_general_rule = Void then
				Result := a_specific_rule.handler
			elseif a_specific_rule = Void and then a_general_rule /= Void then
				Result := a_general_rule.handler
			elseif a_specific_rule /= Void and then a_general_rule /= Void then
				if a_specific_rule.precedence = a_general_rule.precedence and then
					a_specific_rule.priority = a_general_rule.priority then

					-- This situation is exceptional: we have a "specific" pattern and
               --  a "general" pattern with the same priority. We have to select
               --  the one that was added last.

					if a_specific_rule.sequence_number > a_general_rule.sequence_number then
						Result := a_specific_rule.handler
					else
						Result := a_general_rule.handler
					end
				elseif a_specific_rule.precedence > a_general_rule.precedence or else
					(a_specific_rule.precedence = a_general_rule.precedence and then a_specific_rule.priority >= a_general_rule.priority) then
					Result := a_specific_rule.handler
				else
					Result := a_general_rule.handler
				end
			else
				Result := Void
			end
		end

invariant

	rule_dictionary_not_void: rule_dictionary /= Void

end
	
