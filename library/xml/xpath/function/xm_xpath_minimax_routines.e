indexing

	description:

		"Objects that support the XPath min() and max() functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_MINIMAX_ROUTINES

inherit

	XM_XPATH_COLLATING_FUNCTION
		redefine
			check_arguments
		end

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			pre_evaluate, check_static_type
		redefine
			evaluate_item, check_arguments
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.any_atomic_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 2 then
				create Result.make_single_string
			else
				create Result.make_atomic_sequence
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			local_comparer := atomic_comparer (2, a_context)
			if local_comparer = Void then
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error))
			else
				if is_max then create {XM_XPATH_DESCENDING_COMPARER} local_comparer.make (local_comparer) end
				arguments.item (1).create_iterator (a_context)
				l_iterator := arguments.item (1).last_iterator
				if l_iterator.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
				else
					l_iterator.start
					if l_iterator.is_error then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
					elseif not l_iterator.after then
						already_finished := False
						check
							atomic_item: l_iterator.item.is_atomic_value
							-- static typing
						end
						establish_first_primitive_type (a_result, l_iterator)
						from
						until
							already_finished or else l_iterator.after or else l_iterator.is_error
						loop
							l_iterator.forth
							if l_iterator.is_error then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
							elseif l_iterator.after then
								a_result.put (atomic_value)
							else
								check
									atomic_item: l_iterator.item.is_atomic_value
									-- static typing
								end
								establish_next_primitive_type (a_result, l_iterator)
							end
						end
						if not already_finished then
							a_result.put (atomic_value)
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

	is_max: BOOLEAN
			-- max() or min()?

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				arguments.item (1).set_unsorted (l_replacement, False)
				if arguments.item (1) /= l_replacement.item then
					arguments.put (l_replacement.item, 1)
				end
			end
		end

feature {NONE} -- Implementation

	local_comparer: KL_PART_COMPARATOR [XM_XPATH_ITEM]
	atomic_value, second_atomic_value: XM_XPATH_ATOMIC_VALUE
	primitive_type, second_primitive_type: INTEGER
	already_finished: BOOLEAN
			-- Used for communicating between `evaluate_item' and it's sub-routines


	 establish_first_primitive_type (a_result: DS_CELL [XM_XPATH_ITEM]; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Establish primitive type of first operand.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			iterator_not_before: a_iterator /= Void and then not a_iterator.is_error and then not a_iterator.before
		local
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			atomic_value := a_iterator.item.as_atomic_value
			primitive_type := atomic_value.item_type.primitive_type
			if primitive_type = Untyped_atomic_type_code then
				primitive_type := Numeric_type_code
				if atomic_value.is_convertible (type_factory.double_type) then
					atomic_value.convert_to_type (type_factory.double_type)
					atomic_value := atomic_value.converted_value
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Cannot convert xdt:untypedAtomic value to xs:double", Xpath_errors_uri, "FORG0006", Dynamic_error))
					already_finished := True
				end
			else
				inspect
					primitive_type
				when Integer_type_code, Double_type_code, Decimal_type_code, Float_type_code then
					primitive_type := Numeric_type_code
				else
				end
			end
			if not already_finished then
				inspect
					primitive_type
				when Numeric_type_code then
					a_numeric_value := atomic_value.as_numeric_value
					if a_numeric_value.is_nan then
						already_finished := True
						a_result.put (a_numeric_value)
					end
				when Boolean_type_code, String_type_code, Year_month_duration_type_code, Day_time_duration_type_code then
					-- No problems
				when Date_time_type_code, Time_type_code, Date_type_code then
					-- The implicit time-zone is available from the dynamic context, if needed, within the XM_XPATH_ATMIC_COMPARER
				when Duration_type_code then
					if atomic_value.is_months_duration or atomic_value.is_seconds_duration then
						-- OK
					else
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string (STRING_.concat ("Invalid type for fn:min/max(): ", atomic_value.item_type.conventional_name), Xpath_errors_uri, "FORG0006", Dynamic_error))
						already_finished := True
					end
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string (STRING_.concat ("Invalid base type for fn:min/max(): ", atomic_value.item_type.conventional_name), Xpath_errors_uri, "FORG0006", Dynamic_error))
					already_finished := True
				end
			end
		ensure
			early_finish: already_finished implies a_result.item /= Void
			no_result: not already_finished implies a_result.item = Void
		end


	establish_next_primitive_type (a_result: DS_CELL [XM_XPATH_ITEM]; a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Establish primitive type of next operand.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.item = Void
			iterator_not_before: a_iterator /= Void and then not a_iterator.is_error and then not a_iterator.before
		local
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			second_atomic_value := a_iterator.item.as_atomic_value
			second_primitive_type := second_atomic_value.item_type.primitive_type
			if second_primitive_type = Untyped_atomic_type_code then
				second_primitive_type := Numeric_type_code
				if second_atomic_value.is_convertible (type_factory.double_type) then
					second_atomic_value.convert_to_type (type_factory.double_type)
					second_atomic_value := second_atomic_value.converted_value
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Cannot convert xdt:untypedAtomic value to xs:double", Xpath_errors_uri, "FORG0006", Dynamic_error))
					already_finished := True
				end
			else
				inspect
					second_primitive_type
				when Integer_type_code, Double_type_code, Decimal_type_code, Float_type_code then
					second_primitive_type := Numeric_type_code
				else
				end
			end
			if not already_finished then
				if second_primitive_type /= primitive_type then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Not all items have same base type for fn:min/max()", Xpath_errors_uri, "FORG0006", Dynamic_error))
					already_finished := True
				else
					if primitive_type = Numeric_type_code then
						a_numeric_value := second_atomic_value.as_numeric_value
						if a_numeric_value.is_nan then
							already_finished := True
							a_result.put (a_numeric_value)
						end
					end
					if not already_finished then
						if not local_comparer.less_than (atomic_value, second_atomic_value) then
							atomic_value := second_atomic_value
						end
					end
				end
			end
		ensure
			early_finish: already_finished implies a_result.item /= Void
			no_result: not already_finished implies a_result.item = Void			
		end
	
end
	
