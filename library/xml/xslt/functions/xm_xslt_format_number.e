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

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "format-number"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Format_number_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
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
				create Result.make_optional_number
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
			evaluate_as_string (a_context)
			last_evaluated_item := last_evaluated_string
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a String
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_dfm: XM_XSLT_DECIMAL_FORMAT_MANAGER
			a_number: XM_XPATH_NUMERIC_VALUE
			a_uri: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			in_error: BOOLEAN
			a_fingerprint: INTEGER
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				create {XM_XPATH_DOUBLE_VALUE} a_number.make_nan
			elseif arguments.item (1).last_evaluated_item.is_error then
				create last_evaluated_string.make ("")
				last_evaluated_string.set_last_error (arguments.item (1).last_evaluated_item.error_value)
				in_error := True
			else
				check
					numeric: arguments.item (1).last_evaluated_item.is_numeric_value -- static typing
				end
				a_number := arguments.item (1).last_evaluated_item.as_numeric_value
			end
			if not in_error then
				if decimal_format = Void then
					if is_fixup_required then
						create last_evaluated_string.make ("")
						last_evaluated_string.set_last_error_from_string ("Unknown decimal format name",
																						  Xpath_errors_uri, "XTDE1280", Dynamic_error)
						in_error := True
					else
						an_evaluation_context ?= a_context
						check
							evaluation_context_not_void: an_evaluation_context /= Void
							-- as this is an XSLT function
						end
						a_dfm := an_evaluation_context.transformer.decimal_format_manager
						if arguments.count = 2 then
							decimal_format := a_dfm.default_decimal_format
						else
							arguments.item (3).evaluate_item (a_context)
							if arguments.item (3).last_evaluated_item.is_error then
								create last_evaluated_string.make ("")
								last_evaluated_string.set_last_error_from_string ("Invalid decimal format name",
																								  Xpath_errors_uri, "XTDE1280", Dynamic_error)
								in_error := True
							else
								create a_parser.make (arguments.item (3).last_evaluated_item.string_value)
								if a_parser.is_prefix_present then
									a_uri := namespace_resolver.uri_for_defaulted_prefix (a_parser.optional_prefix, False)
									if a_uri = Void then
										create last_evaluated_string.make ("")
										last_evaluated_string.set_last_error_from_string ("Prefix for decimal format name has not been declared",
																										  Xpath_errors_uri, "XTDE1280", Dynamic_error)
										in_error := True
									end
								else
									a_uri := Null_uri
								end
								if not in_error then
									a_fingerprint := shared_name_pool.fingerprint (a_uri, a_parser.local_name)
									if a_dfm.has_named_format (a_fingerprint) then
										decimal_format := a_dfm.named_format (a_fingerprint)
									else
										create last_evaluated_string.make ("")
										last_evaluated_string.set_last_error_from_string ("Named decimal format has not been declared",
																										  Xpath_errors_uri, "XTDE1280", Dynamic_error)
										in_error := True
									end
								end
							end
						end
					end
				end
				if not in_error then
					if sub_pictures = Void then
						arguments.item (2).evaluate_item (a_context)
						if arguments.item (2).last_evaluated_item.is_error then
							create last_evaluated_string.make ("")
							last_evaluated_string.set_last_error (last_evaluated_item.error_value)
						else
							picture := arguments.item (2).last_evaluated_item.string_value
							sub_pictures := analyzed_sub_pictures (picture, decimal_format)
						end
					end
					if sub_pictures /= Void then
						create last_evaluated_string.make (formatted_number (a_number))
					else
						create last_evaluated_string.make ("")
						last_evaluated_string.set_last_error (error_value)
					end
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
		end

feature -- Element change

	fixup (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Fixup pictures (callback from manager).
		require
			format_not_void: a_format /= Void
		do
			is_fixup_required := False
			decimal_format := a_format
			if picture /= Void  then
				sub_pictures := analyzed_sub_pictures (picture, a_format)
				if is_error then

					-- we defer reporting an error until run time

					sub_pictures := Void
				end
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			a_uri: STRING
			a_dfm: XM_XSLT_DECIMAL_FORMAT_MANAGER
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
			a_fingerprint: INTEGER
			a_parser: XM_XPATH_QNAME_PARSER
		do
			Precursor (a_context)
			if arguments.item (2).is_string_value then

				-- picture is known statically - optimize for this common case

				picture := arguments.item (2).as_string_value.string_value
			end
			an_expression_context ?= a_context
			check
				expression_context: an_expression_context /= Void
			end
			if arguments.count = 3 then
				if arguments.item (3).is_string_value then

					-- common case, decimal format name is supplied as a string literal
					
					create a_parser.make (arguments.item (3).as_string_value.string_value)
					if a_parser.is_valid then
						a_dfm := an_expression_context.style_sheet.decimal_format_manager
						is_fixup_required := True

						if a_parser.is_prefix_present then
							if a_context.is_prefix_declared (a_parser.optional_prefix) then
								a_uri := a_context.uri_for_prefix (a_parser.optional_prefix)
							else
								set_last_error_from_string ("Prefix of decimal-format-name has not been declared",
																	 Xpath_errors_uri, "XTDE1280", Static_error)
							end
						else
							a_uri := Null_uri
						end
						a_fingerprint := shared_name_pool.fingerprint (a_uri, a_parser.local_name)
						a_dfm.register_usage (a_fingerprint, Current)
					else
						set_last_error_from_string (STRING_.appended_string (arguments.item (3).as_string_value.string_value, " is not a lexical QName"),
															 Xpath_errors_uri, "XTDE1280", Static_error)
					end
				else
					
					-- we need to save the namespace context

					namespace_resolver := a_context.namespace_resolver
				end
			else

				-- two arguments only: it uses the default decimal format

				a_dfm := an_expression_context.style_sheet.decimal_format_manager
				a_dfm.register_usage (-1, Current)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Namespace resolver, for when the decimal format name is not known statically

	decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Decimal format

	picture: STRING
			-- Picture, when statically known

	sub_pictures: ARRAY [XM_XSLT_SUB_PICTURE]
			-- Sub-pictures

	is_fixup_required: BOOLEAN
			-- Is an unknown decimal format name used?

	analyzed_sub_pictures (a_picture: STRING; a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): ARRAY [XM_XSLT_SUB_PICTURE] is
			-- Sub-pictures
		require
			picture_string_not_void:	 a_picture /= Void
			decimal_format_not_void: a_format /= Void
		local
			a_separator_index: INTEGER
			a_sub_picture: XM_XSLT_SUB_PICTURE
		do
			create sub_pictures.make (1,2)
			if a_picture.count = 0 then
				set_last_error_from_string ("format-number() picture is zero-length",
													 Xpath_errors_uri, "XTDE1310", Dynamic_error)
			else
				a_separator_index := a_picture.index_of (a_format.pattern_separator.item (1), 1)
				if a_separator_index = 0 then
					create a_sub_picture.make (a_picture, a_format)
					sub_pictures.put (a_sub_picture, 1)
					sub_pictures.put (Void, 2)
				else
					if a_separator_index = a_picture.count then
						set_last_error_from_string ("second subpicture is zero-length", Xpath_errors_uri, "XTDE1310", Dynamic_error)
					elseif a_picture.index_of (a_format.pattern_separator.item (1), a_separator_index + 1) > 0 then
						set_last_error_from_string ("more than one pattern separator", Xpath_errors_uri, "XTDE1310", Dynamic_error)
					elseif a_separator_index = 1 then
						set_last_error_from_string ("first subpicture is zero-length", Xpath_errors_uri, "XTDE1310", Dynamic_error)
					else
						create a_sub_picture.make (a_picture.substring (1, a_separator_index - 1), a_format)
						sub_pictures.put (a_sub_picture, 1)
						create a_sub_picture.make (a_picture.substring (a_separator_index + 1, a_picture.count), a_format)
						sub_pictures.put (a_sub_picture, 2)
					end
				end
			end
			if not is_error then Result := sub_pictures end
		ensure
			error: is_error implies Result = Void
			no_error: not is_error implies Result /= Void
		end

	formatted_number (a_number: XM_XPATH_NUMERIC_VALUE): STRING is
			-- Formatted version of `a_number'
		require
			number_not_in_error: a_number /= Void and then not a_number.is_error
			two_sub_pictures: sub_pictures /= Void and then sub_pictures.count = 2
			decimal_format_not_void: decimal_format /= Void
		local
			an_absolute_number: XM_XPATH_NUMERIC_VALUE
			a_sub_picture: XM_XSLT_SUB_PICTURE
			a_minus_sign: STRING
		do
			an_absolute_number := a_number
			a_minus_sign := ""
			if a_number.is_negative then
				an_absolute_number := a_number.negated_value
				if sub_pictures.item (2) = Void then
					a_sub_picture:= sub_pictures.item (1)
					a_minus_sign := decimal_format.minus_sign
				else
					a_sub_picture:= sub_pictures.item (2)
				end
			else
				a_sub_picture:= sub_pictures.item (1)
			end
			Result := a_sub_picture.formatted_number (an_absolute_number, decimal_format, a_minus_sign) 
		ensure
			may_be_in_error: Result /= Void
		end

end
	
