indexing

	description:

		"Objects that check the cardinality of a node sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_CARDINALITY_CHECKING_FUNCTION

inherit

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	XM_XPATH_CARDINALITY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_role_locator: XM_XPATH_ROLE_LOCATOR; 	a_required_cardinality: INTEGER) is
			-- Establish invariant.
		require
			sequence_not_void: a_sequence_iterator /= Void
			role_locator_not_void: a_role_locator /= Void
			valid_cardinality: is_valid_required_cardinality (a_required_cardinality)
		do
			sequence_iterator := a_sequence_iterator
			role_locator := a_role_locator
			required_cardinality := a_required_cardinality
		ensure
			sequence_iterator_set: sequence_iterator = a_sequence_iterator
			role_locator_set: role_locator = a_role_locator
			cardinality_set: required_cardinality = a_required_cardinality
		end

feature -- Access
	
	last_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'

		sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Sequence to be checked

	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role of checked sequence

	required_cardinality: INTEGER
			-- Required cardinality

feature -- Evaluation
	
	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_position: INTEGER
			a_node: XM_XPATH_NODE
		do
			a_position := sequence_iterator.index
			if an_item.is_object_value then
				if a_position = 1 then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ",
																											role_locator.message),  role_locator.namespace_uri, role_locator.error_code, Type_error)
				end

				-- We don't include the stopper in the result
				
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
			else -- no stopper
				if a_position = 2 and then not is_cardinality_allows_many (required_cardinality) then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ",
																																							role_locator.message), role_locator.namespace_uri, role_locator.error_code, Type_error)
				else
					a_node ?= an_item
					check
						node: a_node /= Void
					end
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_node)
				end
			end
		end

invariant

	sequence_not_void: sequence_iterator /= Void
	role_locator_not_void: role_locator /= Void
	valid_cardinality: is_valid_required_cardinality (required_cardinality)

end
	
