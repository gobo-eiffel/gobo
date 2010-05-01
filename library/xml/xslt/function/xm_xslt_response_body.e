note

	description:

		"Objects that implement the gexslt:response-body() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RESPONSE_BODY

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "response-body"
			namespace_uri := Gexslt_eiffel_type_uri
			fingerprint := Gexslt_response_body_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.string_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_single_string
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_transformer: XM_XSLT_TRANSFORMER
			l_uri, l_buffer: STRING
			l_response: KI_CHARACTER_INPUT_STREAM
			l_error: XM_XPATH_ERROR_VALUE
		do
			l_evaluation_context ?= a_context
			check
				evaluation_context: l_evaluation_context /= Void
				-- as this is an XSLT function
			end
			arguments.item (1).evaluate_item (a_result, a_context)
			if not a_result.item.is_error then
				l_uri := a_result.item.string_value
				l_transformer := l_evaluation_context.transformer
				if l_transformer.has_response_from (l_uri) then
					l_response := l_transformer.response_stream (l_uri)
					from
						l_response.read_string (1024)
						l_buffer := l_response.last_string
					until
						l_response.end_of_input
					loop
						l_buffer := STRING_.appended_string (l_buffer, l_response.last_string)
						l_response.read_string (1024)
					end
					l_transformer.discard_response (l_uri)
					if l_buffer = Void then
						l_buffer := ""
					end
					a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_buffer))
				else
					create l_error.make_from_string (STRING_.concat ("No response is available for ", l_uri), Gexslt_eiffel_type_uri, "NO_RESPONSE", Dynamic_error)
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error))
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
			--	do_nothing
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation


end
	

