note

	description:

		"Objects that define one component of a sort key, where all aspects are known"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FIXED_SORT_KEY_DEFINITION

inherit

	XM_XSLT_SORT_KEY_DEFINITION
		rename
			make as old_make
		redefine
			reduced_definition, is_fixed_sort_key, as_fixed_sort_key,
			order, language, case_order, data_type
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY

	XM_XPATH_SHARED_EXPRESSION_FACTORY

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_sort_key: XM_XPATH_EXPRESSION;
			an_order, a_data_type, a_case_order, a_language: STRING;
			a_collator: detachable ST_COLLATOR)
			-- Establish invariant.
		require
			sort_key_not_void: a_sort_key /= Void
			order_not_void: an_order /= Void
			data_type_not_void: a_data_type /= Void
			case_order_not_void: a_case_order /= Void
			language_not_void: a_language /= Void
		do
			sort_key := a_sort_key
			order := an_order
			data_type := a_data_type
			case_order := a_case_order
			language := a_language
			collator := a_collator
			bind_comparer
		ensure
			order_set: order = an_order
			data_type_set: data_type = a_data_type
			case_order_set: case_order = a_case_order
			language_set: language = a_language
			collator_set: collator = a_collator
		end

feature -- Access

	collator: detachable ST_COLLATOR
			-- Collator

	comparer: detachable KL_PART_COMPARATOR [XM_XPATH_ITEM]
			-- Object that performs comparisons

	reduced_definition (a_context: XM_XSLT_EVALUATION_CONTEXT):  XM_XSLT_FIXED_SORT_KEY_DEFINITION
			-- Sort key definition without any dependencies on the context
		do
			Result := Current
		ensure then
			no_change: Result = Current
		end

	error_value: detachable XM_XPATH_ERROR_VALUE
			-- Error value when `is_error'

	order: STRING
			-- Value of order attribute (ascending or descending)

	language: STRING
			--  Value of language attribute

	case_order: STRING
			-- Value of case-order attribute ("lower-first" or "upper-first")

	data_type: STRING
			-- Value of data-type attribute ("text" or "number" or a QName)

feature -- Status report

	is_error: BOOLEAN
			-- Did an error occur when binding the comparer?

feature -- Conversion

	is_fixed_sort_key: BOOLEAN
			-- Is `Current' a fixed_sort_key?
		do
			Result := True
		end

	as_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
			-- `Current' seen as a fixed_sort_key
		do
			Result := Current
		end

feature {NONE} -- Implementation

	bind_comparer
			-- Determine which comparer should be use.
		local
			l_message: STRING
			l_base_collator: detachable ST_COLLATOR
			l_role: XM_XPATH_ROLE_LOCATOR
		do
			if attached collator as l_collator then
				l_base_collator := l_collator
			else
				if language.count = 0 or else STRING_.same_string (language, "en") then
					create l_base_collator
				else
					l_message := STRING_.concat ("Language '", language)
					l_message := STRING_.appended_string (l_message, "' is not supported by this implementation.")
					create error_value.make_from_string (l_message, Gexslt_eiffel_type_uri, "UNSUPPORTED_LANGUAGE_FOR_SORT", Static_error)
					is_error := True
				end
			end
			if not is_error then
				check l_base_collator /= Void then
					if data_type.count = 0 then
						create l_role.make (Instruction_role, "xsl:sort/sort-key", 1, Xpath_errors_uri, "XTTE1020")
						sort_key := expression_factory.created_cardinality_checker (sort_key, Required_cardinality_zero_or_more, l_role)
						create {XM_XPATH_ATOMIC_SORT_COMPARER} comparer.make (l_base_collator)
					else
						if STRING_.same_string (data_type, "text") then
							create {XM_XSLT_TEXT_COMPARER} comparer.make_from_collator (l_base_collator)
						elseif  STRING_.same_string (data_type, "number") then
							create {XM_XSLT_NUMERIC_COMPARER} comparer
						elseif is_qname (data_type) then
							l_message := STRING_.concat ("QName '", data_type)
							l_message := STRING_.appended_string (l_message, "' is not supported by this implementation.")
							create error_value.make_from_string (l_message, Xpath_errors_uri, "XTDE0030", Static_error)
							is_error := True
						else
							create error_value.make_from_string ("data-type on xsl:sort must be 'text' or 'number' or a QName",
								Xpath_errors_uri, "XTDE0290", Static_error)
							is_error := True
						end
					end
				end
			end
			if collator = Void and not is_error then
				bind_case_order_comparer
			end
			if not is_error then
				bind_ordered_comparer
			end
		end

	bind_case_order_comparer
			-- Bind `comparer' so that it implements case-order.
		require
			comparer_not_void: comparer /= Void
			no_previous_error: not is_error
		do
			check precondition_comparer_not_void: attached comparer as l_comparer then
				if STRING_.same_string (case_order, "#default") then
					-- OK
				elseif STRING_.same_string (case_order, "lower-first") then
					create {XM_XSLT_CASE_ORDER_COMPARER} comparer.make (l_comparer, False)
				elseif STRING_.same_string (case_order, "upper-first") then
					create {XM_XSLT_CASE_ORDER_COMPARER} comparer.make (l_comparer, True)
				else
					create error_value.make_from_string ("case-order must be 'lower-first' or 'upper-first'", Gexslt_eiffel_type_uri, "INVALID_CASE_ORDER", Static_error)
					is_error := True
				end
			end
		ensure
			comparer_not_void: not is_error implies comparer /= Void
		end

	bind_ordered_comparer
			-- Bind `comparer' so that it implements order.
		require
			comparer_not_void: comparer /= Void
			no_previous_error: not is_error
		do
			if STRING_.same_string (order, "ascending") then
				-- OK
			elseif STRING_.same_string (order, "descending") then
				check precondition_comparer_not_void: attached comparer as l_comparer then
					create {XM_XPATH_DESCENDING_COMPARER} comparer.make (l_comparer)
				end
			else
				create error_value.make_from_string ("order must be 'ascending' or 'descending'", Gexslt_eiffel_type_uri, "INVALID_ORDER", Static_error)
				is_error := True
			end
		ensure
			comparer_not_void: not is_error implies comparer /= Void
		end

invariant

	sort_key_not_void: not is_error implies sort_key /= Void
	order_not_void: order /= Void
	case_order_not_void: case_order /= Void
	language_not_void: language /= Void
	data_type_not_void: data_type /= Void
	comparer_not_void: not is_error implies comparer /= Void
	is_error_implies_error_value: is_error implies error_value /= Void

end

