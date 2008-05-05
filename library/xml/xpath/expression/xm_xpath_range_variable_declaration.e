indexing

	description:

	"Objects that represent the defining occurrence of a %
	%variable declared for local use within an expression,%
	%for example the $x in 'for $x in ...'. %
	% This object is used	only at compile-time."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
			a_binding_not_void: a_binding /= Void
		do
			references.do_all (agent fix_up_reference (a_binding, ?))
		end

	refine_type_information (a_type: XM_XPATH_ITEM_TYPE; a_constant_value: XM_XPATH_VALUE;
									 a_properties: XM_XPATH_STATIC_PROPERTY) is
			-- Set static type in the binding reference more accurately.
		require
			a_type_not_void: a_type /= Void
			possible_constant_value: True
		do
			references.do_all (agent refine_type (?, a_type, a_constant_value, a_properties))
		end

	refine_type (a_variable_reference: XM_XPATH_VARIABLE_REFERENCE; a_type: XM_XPATH_ITEM_TYPE;
		a_constant_value: XM_XPATH_VALUE; a_properties: XM_XPATH_STATIC_PROPERTY) is
			-- Set static type in the binding reference more accurately.
		require
			a_variable_reference_not_void: a_variable_reference /= Void			
		local
			l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_old_item_type, l_new_item_type: like a_type
		do
			l_old_item_type := a_variable_reference.item_type
			l_new_item_type := l_old_item_type
			if is_sub_type (a_type, l_old_item_type) then
				l_new_item_type := a_type
			end
			create l_sequence_type.make (l_new_item_type, a_variable_reference.merged_cardinalities (a_properties))
			a_variable_reference.set_static_type (l_sequence_type, a_constant_value, a_properties)
		end

feature {NONE} -- Implementation

	references: DS_ARRAYED_LIST [XM_XPATH_VARIABLE_REFERENCE]
			-- All references to `Current'

	fix_up_reference (a_binding: XM_XPATH_BINDING; a_reference: XM_XPATH_VARIABLE_REFERENCE) is
			-- Fix up `a_reference' to `a_binding'.
		require
			a_binding_not_void: a_binding /= Void
			a_reference_not_void: a_reference /= Void
		do
	
				-- We supply the static properties of the expression later
				-- in the call to refine_type_information
				
				a_reference.set_static_type (required_type, Void, Void)
				a_reference.fix_up (a_binding)
		end

invariant

	references_not_void: not references.has_void
	all_references_not_void: not references.has (Void)
	name_not_void: variable_name /= Void and then variable_name.count > 0
	required_type_not_void: required_type /= Void

end
	
