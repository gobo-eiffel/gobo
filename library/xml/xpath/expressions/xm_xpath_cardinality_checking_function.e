indexing

	description:

		"Objects that check the cardinality of a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CARDINALITY_CHECKING_FUNCTION

inherit

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_ERROR_TYPES

	XM_XPATH_CARDINALITY

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_role_locator: XM_XPATH_ROLE_LOCATOR; 	a_required_cardinality: INTEGER) is
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
	
	sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence to be checked

	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role of checked sequence

	required_cardinality: INTEGER
			-- Required cardinality

feature -- Evaluation
	
	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_position: INTEGER
			an_invalid_item: XM_XPATH_INVALID_ITEM
		do
			a_position := sequence_iterator.index
			if an_item.is_object_value then
				if a_position = 1 then
					create an_invalid_item.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ",
																											role_locator.message),  role_locator.namespace_uri, role_locator.error_code, Type_error)
					create last_mapped_item.make_item (an_invalid_item)
				end

				-- We don't include the stopper in the result
				
					last_mapped_item := Void
			else -- no stopper
				if a_position = 2 and then not is_cardinality_allows_many (required_cardinality) then
					create an_invalid_item.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ",
																											role_locator.message), role_locator.namespace_uri, role_locator.error_code, Type_error)
					create last_mapped_item.make_item (an_invalid_item)
				else
					create last_mapped_item.make_item (an_item)
				end
			end
		end

invariant

	sequence_not_void: sequence_iterator /= Void
	role_locator_not_void: role_locator /= Void
	valid_cardinality: is_valid_required_cardinality (required_cardinality)

end
	
