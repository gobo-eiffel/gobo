indexing

	description:

		"Objects that define one component of a sort key, where all aspects are known"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FIXED_SORT_KEY_DEFINITION
	
inherit
	
	XM_XSLT_SORT_KEY_DEFINITION
		rename
			make as old_make
		redefine
			reduced_definition, is_fixed_sort_key, as_fixed_sort_key
		end

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_ERROR_TYPES

	KL_IMPORTED_STRING_ROUTINES

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY

	XM_XPATH_DEBUGGING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_sort_key: XM_XPATH_EXPRESSION;
			an_order, a_data_type, a_case_order, a_language: STRING;
			a_collator: ST_COLLATOR; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Establish invariant.
		require
			sort_key_not_void: a_sort_key /= Void
			order_not_void: an_order /= Void
			data_type_not_void: a_data_type /= Void
			case_order_not_void: a_case_order /= Void
			language_not_void: a_language /= Void
			context_not_void: a_context /= Void
		do
			sort_key := a_sort_key
			order := an_order
			data_type := a_data_type
			case_order := a_case_order
			language := a_language
			collator := a_collator
			bind_comparer (a_context)
		ensure
			order_set: order = an_order
			data_type_set: data_type = a_data_type
			case_order_set: case_order = a_case_order
			language_set: language = a_language
			collator_set: collator = a_collator
		end
		
feature -- Access

	collator: ST_COLLATOR
			-- Collator

	comparer: KL_COMPARATOR [XM_XPATH_ITEM]
			-- Object that performs comparisons

	reduced_definition (a_context: XM_XSLT_EVALUATION_CONTEXT):  XM_XSLT_FIXED_SORT_KEY_DEFINITION is
			-- Sort key definition without any dependencies on the context
		do
			Result := Current
		ensure then
			no_change: Result = Current
		end

feature -- Status report

	is_error: BOOLEAN
			-- Didi an error occur when binding the comparer?

feature -- Conversion

	is_fixed_sort_key: BOOLEAN is
			-- Is `Current' a fixed_sort_key?
		do
			Result := True
		end

	as_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION is
			-- `Current' seen as a fixed_sort_key
		do
			Result := Current
		end

feature {NONE} -- Implementation

	bind_comparer (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Determine which comparer should be use.
		require
			context_not_void: a_context /= Void			
		local
			a_message: STRING
			a_comparer: KL_COMPARATOR [XM_XPATH_ITEM]
			a_base_collator: ST_COLLATOR
			a_role: XM_XPATH_ROLE_LOCATOR
			an_error: XM_XPATH_ERROR_VALUE
		do
			if collator /= Void then
				create {XM_XSLT_TEXT_COMPARER} comparer.make_from_collator (collator)
			else
				if language.count = 0 or else STRING_.same_string (language, "en") then
					create a_base_collator
				else
					a_message := STRING_.concat ("Language '", language)
					a_message := STRING_.appended_string (a_message, "' is not supported by this implementation.")
					create an_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "UNSUPPORTED_LANGUAGE_FOR_SORT", Static_error)
					a_context.transformer.report_fatal_error (an_error, Void)
					is_error := True
				end
				if not is_error then
					a_comparer := case_order_comparer (a_base_collator, a_context)
					if not is_error then
						if data_type.count = 0 then
							create a_role.make (Instruction_role, "xsl:sort/sort-key", 1, Xpath_errors_uri, "XPTY0004")
							create {XM_XPATH_CARDINALITY_CHECKER} sort_key.make (sort_key, Required_cardinality_zero_or_more, a_role)
							create {XM_XPATH_ATOMIC_SORT_COMPARER} a_comparer.make (a_base_collator)
						else
							if STRING_.same_string (data_type, "text") then
								create {XM_XSLT_TEXT_COMPARER} a_comparer.make (a_comparer)
							elseif  STRING_.same_string (data_type, "number") then
								create {XM_XSLT_NUMERIC_COMPARER} a_comparer
							elseif is_qname (data_type) then
								a_message := STRING_.concat ("QName '", data_type)
								a_message := STRING_.appended_string (a_message, "' is not supported by this implementation.")
								create an_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "UNSUPPORTED_DATA_TYPE_FOR_SORT", Static_error)
								a_context.transformer.report_fatal_error (an_error, Void)
								is_error := True
							else
								create an_error.make_from_string ("data-type on xsl:sort must be 'text' or 'number' or a QName", "", "XTDE0290", Static_error)
								a_context.transformer.report_fatal_error (an_error, Void)
								is_error := True
							end
						end
					end
				end
			end
			if not is_error then
				comparer := ordered_comparer (a_comparer, a_context)
			end
		end

	case_order_comparer (a_base_collator: ST_COLLATOR; a_context: XM_XSLT_EVALUATION_CONTEXT): KL_COMPARATOR [XM_XPATH_ITEM] is
			-- Comparer that implements `case_order'
		require
			base_collator_not_void: a_base_collator /= Void
			no_previous_error: not is_error
			context_not_void: a_context /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if STRING_.same_string (case_order, "#default") then
				create {XM_XSLT_TEXT_COMPARER} Result.make_from_collator (a_base_collator)
			elseif STRING_.same_string (case_order, "lower-first") then
				todo ("case_order_comparer (ST_COLLATOR support needed)", True)
			elseif STRING_.same_string (case_order, "upper-first") then
				todo ("case_order_comparer (ST_COLLATOR support needed)", True)
			else
				create an_error.make_from_string ("case-order must be 'lower-first' or 'upper-first'", Gexslt_eiffel_type_uri, "INVALID_CASE_ORDER", Static_error)
				a_context.transformer.report_fatal_error (an_error, Void)
				is_error := True
			end
		ensure
			comparer_not_void: not is_error implies Result /= Void
		end

	ordered_comparer (a_base_comparer: KL_COMPARATOR [XM_XPATH_ITEM]; a_context: XM_XSLT_EVALUATION_CONTEXT): KL_COMPARATOR [XM_XPATH_ITEM] is
			-- Comparer that implements `order'
		require
			base_comparer_not_void: a_base_comparer /= Void
			no_previous_error: not is_error
			context_not_void: a_context /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if STRING_.same_string (order, "ascending") then
				Result := a_base_comparer
			elseif STRING_.same_string (order, "descending") then
				create {XM_XPATH_DESCENDING_COMPARER} Result.make (a_base_comparer)
			else
				create an_error.make_from_string ("order must be 'ascending' or 'descending'", Gexslt_eiffel_type_uri, "INVALID_ORDER", Static_error)
				a_context.transformer.report_fatal_error (an_error, Void)
				is_error := True
			end
		ensure
			comparer_not_void: not is_error implies Result /= Void
		end

invariant

	sort_key_not_void: not is_error implies sort_key /= Void
	order_not_void: order /= Void
	case_order_not_void: case_order /= Void
	language_not_void: language /= Void
	data_type_not_void: data_type /= Void
	comparer_not_void: not is_error implies comparer /= Void

end
	
