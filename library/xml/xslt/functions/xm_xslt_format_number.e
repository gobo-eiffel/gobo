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
			--evaluate_as_string (a_context)
			--last_evaluated_item := last_evaluated_string
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a String
		do
			todo ("evaluate_as_string", False)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--			set_replacement (Current)
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
			a_string_value: XM_XPATH_STRING_VALUE
			a_qname: STRING
			a_dfm: XM_XSLT_DECIMAL_FORMAT_MANAGER
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			Precursor (a_context)
			a_string_value ?= arguments.item (2)
			if a_string_value /= Void then

				-- picture is known statically - optimize for this common case

				picture := a_string_value.string_value
			end
			an_expression_context ?= a_context
			check
				expression_context: an_expression_context /= Void
			end
			if arguments.count = 3 then
				a_string_value ?= arguments.item (3)
				if a_string_value /= Void then

					-- common case, decimal format name is supplied as a string literal
					
					a_qname := a_string_value.string_value
					if is_qname (a_qname) then
						a_dfm := an_expression_context.style_sheet.decimal_format_manager
						is_fixup_required := True
						
						todo ("check_arguments (fixup)", True)
					else
						set_last_error_from_string (STRING_.appended_string (a_qname, " is not a lexical QName"), "", "XT1280", Static_error)
					end
				else
					
					-- we need to save the namespace context

					todo ("check_arguments (save namespace context)", True)
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
				set_last_error_from_string ("format-number() picture is zero-length", "", "XT1310", Dynamic_error)
			else
				a_separator_index := a_picture.index_of (a_format.pattern_separator.item (1), 1)
				if a_separator_index = 0 then
					create a_sub_picture.make (a_picture, a_format)
					sub_pictures.put (a_sub_picture, 1)
					sub_pictures.put (Void, 2)
				else
					if a_separator_index = a_picture.count then
						set_last_error_from_string ("second subpicture is zero-length", "", "XT1310", Dynamic_error)
					elseif a_picture.index_of (a_format.pattern_separator.item (1), a_separator_index + 1) > 0 then
						set_last_error_from_string ("more than one pattern separator", "", "XT1310", Dynamic_error)
					elseif a_separator_index = 1 then
						set_last_error_from_string ("first subpicture is zero-length", "", "XT1310", Dynamic_error)
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

end
	
