indexing

	description:

		"Objects that implement the XSLT format-number() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FORMAT_NUMBER

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, check_arguments, evaluate_as_string, evaluate_item
		end

	XM_UNICODE_CHARACTERS_1_1

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "format-number"
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				create Result.make_single_double
			when 2 then
				create Result.make_single_string
			when 3 then
				create Result.make_single_string
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			todo ("evaluate_item", False)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a String
		do
			todo ("evaluate_as_string", False)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (Current)
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_qname: STRING
		do
			Precursor (a_context)
			a_string_value ?= arguments.item (2)
			if a_string_value /= Void then

				-- picture is known statically - optimize for this common case

				picture := a_string_value.string_value
			end
			if arguments.count = 3 then
				a_string_value ?= arguments.item (3)
				if a_string_value /= Void then

					-- common case, decimal format name is supplied as a string literal
					
					a_qname := a_string_value.string_value
					if is_qname (a_qname) then
						todo ("check_arguments", True)
					else
						set_last_error_from_string (STRING_.appended_string (a_qname, " is not a lexical QName"), 0, Static_error)
					end
				else
					
					-- we need to save the namespace context

					todo ("check_arguments", True)
				end
			else

				-- two arguments only: it uses the default decimal format

					todo ("check_arguments", True)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	picture: STRING
			-- Picture, when statically known

end
	
