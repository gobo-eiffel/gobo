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
			fixup_references, validate
		end

	XM_XPATH_VARIABLE_DECLARATION

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of the variable
		deferred
		ensure
			required_type_not_void: Result /= Void
		end

	references: DS_ARRAYED_LIST [XM_XPATH_BINDING_REFERENCE]
			-- List of XM_XPATH_VARIABLE_REFERENCE objects that reference `Current'
										  
feature -- Element change

		register_reference (a_reference: XM_XPATH_BINDING_REFERENCE) is
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
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_BINDING_REFERENCE]
			a_dependencies_set: ARRAY [BOOLEAN]
			a_cardinalities_set: ARRAY [BOOLEAN]
			a_special_properties_set: ARRAY [BOOLEAN]
			a_constant_value: XM_XPATH_VALUE
			a_variable: XM_XSLT_VARIABLE
			a_binding_reference: XM_XPATH_BINDING_REFERENCE
		do
			from
				a_cursor := references.new_cursor
				a_cursor.start
			variant
				references.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_constant_value := Void
				a_dependencies_set := Void
				a_cardinalities_set := Void
				a_special_properties_set := Void
				a_variable ?= Current
				if a_variable /= Void then
					a_constant_value ?= select_expression
					if select_expression /= Void then
						a_special_properties_set := select_expression.special_properties
						a_cardinalities_set := select_expression.cardinalities
						a_dependencies_set := select_expression.dependencies
					end
				end
				a_binding_reference := a_cursor.item
				a_binding_reference.set_static_type (required_type, a_constant_value, a_dependencies_set, a_cardinalities_set, a_special_properties_set) 
				a_cursor.forth
			end
			Precursor
		end

		validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			todo ("validate", False)
			validated := True
		end

invariant

	references: references /= Void

end

