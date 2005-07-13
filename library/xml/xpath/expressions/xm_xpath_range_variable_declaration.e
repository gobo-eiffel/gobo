indexing

	description:

	"Objects that represent the defining occurrence of a %
	%variable declared for local use within an expression,%
	%for example the $x in 'for $x in ...'. %
	%This object is used	only at compile-time."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RANGE_VARIABLE_DECLARATION

inherit

	XM_XPATH_VARIABLE_DECLARATION

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

	XM_XPATH_TYPE

	XM_XPATH_CARDINALITY

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_fingerprint: INTEGER; a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant
		require
			name_not_void: a_name /= Void and then a_name.count > 0
			required_type_not_void: a_required_type /= Void
		do
			create references.make_equal (5)
			variable_name := a_name
			variable_fingerprint := a_fingerprint
			required_type := a_required_type
		ensure
			name_set: variable_name = a_name
		end

feature -- Access

	variable_name: STRING
			-- For use in diagnostics - lexically, a QName

	variable_fingerprint: INTEGER
			-- Fingerprint of variable name from name pool

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Sequence type required for this variable

	reference_count (a_binding: XM_XPATH_BINDING): INTEGER is
			-- Reference count
		require
			binding_not_void: a_binding /= Void
		do
			Result := variable_reference_count (references, a_binding)
		end

feature -- Element change

	register_reference (a_reference: XM_XPATH_VARIABLE_REFERENCE) is
			-- Register `a_reference' as a reference to this variable for fix-up.
		do
			if not references.extendible (1) then
				references.resize (2* references.count)
			end
			references.put_last (a_reference)
		end

	set_reference_list (a_reference_list: like references) is
			-- Set references.
		require
			reference_list_not_void: a_reference_list /= Void
		do
			references := a_reference_list
		ensure
			set: references = a_reference_list
		end

	set_required_type (a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Set `required_type.
		require
			required_type_not_void: a_required_type /= Void
		do
			required_type := a_required_type
		ensure
			required_type_set: required_type = a_required_type
		end

	fix_up_references (a_binding: XM_XPATH_BINDING) is
			-- Fix up binding references.
		require
			binding_not_void: a_binding /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_VARIABLE_REFERENCE]
			a_reference: XM_XPATH_VARIABLE_REFERENCE
		do
			a_cursor := references.new_cursor
			from
				a_cursor.start
			variant
				references.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_reference := a_cursor.item
				if not a_reference.was_expression_replaced then

					-- We supply the static properties of the expression later
					-- in the call to refine_type_information
					
					a_reference.set_static_type (required_type, Void, Void, Void, Void)
					a_reference.fix_up (a_binding)
				end

				a_cursor.forth
			end
		end

	refine_type_information (a_type: XM_XPATH_ITEM_TYPE; a_cardinality_set: ARRAY [BOOLEAN]; a_constant_value: XM_XPATH_VALUE;
									 a_dependencies_set: ARRAY [BOOLEAN];  a_special_properties_set: ARRAY [BOOLEAN]) is
			-- Set static type in the binding reference more accurately.
		require
			type_not_void: a_type /= Void
			cardinalities_not_void: a_cardinality_set /= Void and then a_cardinality_set.count = 3
			possible_constant_value: True
			special_properties_not_void: a_special_properties_set /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_VARIABLE_REFERENCE]
			a_variable_reference: XM_XPATH_VARIABLE_REFERENCE
			a_sequence_type: XM_XPATH_SEQUENCE_TYPE
			old_item_type, new_item_type: like a_type
			a_cardinality: INTEGER
		do
			a_cursor := references.new_cursor
			from
				a_cursor.start
			variant
				references.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_variable_reference := a_cursor.item
				if not a_variable_reference.was_expression_replaced then
					old_item_type := a_variable_reference.item_type
					new_item_type := old_item_type
					if is_sub_type (a_type, old_item_type) then
						new_item_type := a_type
					end
					a_cardinality := cardinalities_to_integer (a_variable_reference.merged_cardinality (a_cardinality_set))
					create a_sequence_type.make (new_item_type, a_cardinality) 
					a_variable_reference.set_static_type (a_sequence_type, a_constant_value, a_dependencies_set, a_cardinality_set, a_special_properties_set)
				end
				a_cursor.forth
			end
		end

feature {NONE} -- Implementation

	references: DS_ARRAYED_LIST [XM_XPATH_VARIABLE_REFERENCE]

invariant

	references_not_void: references /= Void
	name_not_void: variable_name /= Void and then variable_name.count > 0
	required_type_not_void: required_type /= Void

end
	
