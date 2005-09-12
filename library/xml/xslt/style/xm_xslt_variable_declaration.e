indexing

	description:

		"xsl:variable and xsl:param elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_VARIABLE_DECLARATION

inherit

	XM_XSLT_GENERAL_VARIABLE
		redefine
			fixup_references, validate, is_xslt_variable_declaration, as_xslt_variable_declaration
		end

	XM_XPATH_VARIABLE_DECLARATION

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of the variable
		deferred
		ensure
			required_type_not_void: Result /= Void
		end

	
	slot_number: INTEGER is
			-- Slot number 
		require
			--non_redundant_global_variable: is_global_variable and then not is_redundant_variable
		do
			Result := internal_slot_number
		ensure
			--strictly_positive_result: Result > 0
			positive_result: Result >= 0
		end
			
	references: DS_ARRAYED_LIST [XM_XPATH_VARIABLE_REFERENCE]
			-- List of XM_XPATH_VARIABLE_REFERENCE objects that reference `Current'
										  
feature -- Element change

	register_reference (a_reference: XM_XPATH_VARIABLE_REFERENCE) is
			-- Register `ref' as a reference to this variable for fix-up.
			-- This routine is called by the XPath parser when
			-- each reference to the variable is enountered.
			-- At some time after parsing and before execution of the expression,
			-- `Current' is responsible for calling the two routines set_static_type
			-- and fixup on each xm_xpath_binding_reference that has been registered with it.
		do
			if not references.extendible (1) then
				references.resize (2 * references.count)
			end
			references.put_last (a_reference)
		end

	fixup_references is
			-- Fix up references from XPath expressions.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_VARIABLE_REFERENCE]
			a_dependencies_set: ARRAY [BOOLEAN]
			a_cardinalities_set: ARRAY [BOOLEAN]
			a_special_properties_set: ARRAY [BOOLEAN]
			a_constant_value: XM_XPATH_VALUE
			a_binding_reference: XM_XPATH_VARIABLE_REFERENCE
			a_relationship: INTEGER
		do
			a_constant_value := Void
			a_dependencies_set := Void
			a_cardinalities_set := Void
			a_special_properties_set := Void
			if is_xslt_variable then
				if select_expression /= Void and then select_expression.is_value
					and then not select_expression.depends_upon_implicit_timezone then
					a_constant_value := select_expression.as_value
					
					-- We can't rely on the constant value, as it hasn't been type-checked yet
					--  (e.g. numeric promotion might change it).
					-- So we do a quick check for now:
					
					a_relationship := type_relationship (select_expression.item_type, required_type.primary_type)
					if a_relationship = Same_item_type or else a_relationship = Subsumed_type then
						-- OK
					else
						a_constant_value := Void
					end
				end
				if select_expression /= Void then
					a_special_properties_set := select_expression.special_properties
					a_cardinalities_set := select_expression.cardinalities
					a_dependencies_set := select_expression.dependencies
				end
			end
			from
				a_cursor := references.new_cursor
				a_cursor.start
			variant
				references.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_binding_reference := a_cursor.item
				if not a_binding_reference.was_expression_replaced then
					a_binding_reference.set_static_type (required_type, a_constant_value, a_dependencies_set, a_cardinalities_set, a_special_properties_set)
				end
				a_cursor.forth
			end
			Precursor
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		local
			an_error: XM_XPATH_ERROR_VALUE
			a_slot_manager: like slot_manager
		do
			Precursor
			if not any_compile_errors then
				if is_global_variable then
					if not is_redundant_variable then
						principal_stylesheet.allocate_global_slot (variable_name)
						internal_slot_number := principal_stylesheet.executable.global_slot_manager.number_of_variables
					end
				else
					check_within_template
					a_slot_manager := slot_manager -- saved, so we can restore the invariant if necessary
					slot_manager := containing_slot_manager
					if slot_manager = Void then
						slot_manager := a_slot_manager -- to restore the invariant
						create an_error.make_from_string ("Local variable must be declared within a template or function", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					else
						slot_manager.allocate_slot_number (variable_name)
						internal_slot_number := slot_manager.number_of_variables
					end
				end
			end
			check
				strictly_positive_slot_number: not is_redundant_variable and then not is_error and then not any_compile_errors implies slot_number > 0
			end
			validated := True
		end

	fixup_binding (a_binding: XM_XPATH_BINDING) is
			-- Notify all variable references of the Binding instruction.
		require
			binding_not_void: a_binding /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_VARIABLE_REFERENCE]
		do
			from
				a_cursor := references.new_cursor
				a_cursor.start
			variant
				references.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				if not a_cursor.item.was_expression_replaced then
					a_cursor.item.fix_up (a_binding)
				end
				a_cursor.forth
			end
		end

feature -- Conversion

	is_xslt_variable_declaration: BOOLEAN is
			-- Is `Current' an xsl:variable or xsl:param?
		do
			Result := True
		end

	as_xslt_variable_declaration: XM_XSLT_VARIABLE_DECLARATION is
			-- `Current' seen as an XSLT variable declaration
		do
			Result := Current
		end

feature {NONE} -- Implementation

	internal_slot_number: INTEGER
			-- Slot number

invariant

	references: references /= Void

end

