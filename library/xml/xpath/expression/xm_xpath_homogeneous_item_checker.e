indexing

	description:

	"Objects that implement type checking for a homogeneuous sequence."
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_HOMOGENEOUS_ITEM_CHECKER

inherit

	XM_XPATH_ITEM_CHECKER
		rename
			make as make_checker
		redefine
			test_conformance
		end

create

	make

		-- All items in the sequence must either be nodes, or atomic values.
		-- Which rule is determined only when we have seen the first item.

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Establish invariant.
		require
			underlying_expression_not_void: a_sequence /= Void
			role_locator_not_void: a_role_locator /= Void
		do
			error_code := "XPTY0018"
			make_unary (a_sequence)
			role_locator := a_role_locator
			required_item_type := any_item
			compute_static_properties
		ensure
			base_expression_set: base_expression = a_sequence
			role_locator_set: role_locator = a_role_locator
			item_type_set: required_item_type = any_item
			static_properties_computed: are_static_properties_computed
		end

feature {NONE} -- Implementation

	first_item_seen: BOOLEAN
			-- Has the first item in the sequence been seen yet?

	test_conformance (an_item: XM_XPATH_ITEM) is
			-- Test conformance to `required_item_type'.
			-- Marks `an_item' as in error if check fails.
		local
			a_type: XM_XPATH_ITEM_TYPE
			a_message: STRING
		do
			a_type := an_item.item_type
			if not first_item_seen then
				if is_sub_type (a_type, type_factory.any_atomic_type) then
					required_item_type := type_factory.any_atomic_type
				else
					check
						node: is_sub_type (a_type, any_node_test)
						-- Items are nodes or atomic values
					end
					required_item_type := any_node_test
				end
				first_item_seen := True
			else
				if not is_sub_type (a_type, required_item_type) then
					a_message := STRING_.appended_string ("Required type of ", role_locator.message)
					a_message := STRING_.appended_string (a_message, " is a homogeneous sequence of ")
					a_message := STRING_.appended_string (a_message, required_item_type.conventional_name)
					a_message := STRING_.appended_string (a_message, "; supplied value for this item is ")
					a_message := STRING_.appended_string (a_message, a_type.conventional_name)
					an_item.set_last_error_from_string (a_message, Xpath_errors_uri, "XPTY0018", Type_error)
				end
			end
		ensure then
			first_item_seen: first_item_seen
		end

end

