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

creation

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_fingerprint: INTEGER; a_required_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant
		require
			name_not_void: a_name /= Void and then a_name.count > 0
			required_type_not_void: a_required_type /= Void
		do
			create references.make_equal (5)
			name := a_name
			fingerprint := a_fingerprint
			required_type := a_required_type
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- For use in diagnostics - lexically, a QName

	fingerprint: INTEGER
			-- Fingerprint of variable name from name pool

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Sequence type required for this variable
	
feature -- Element change

	register_reference (a_reference: XM_XPATH_BINDING_REFERENCE) is
			-- Register `a_reference' as a reference to this variable for fix-up.
		do
			if not references.extendible (1) then
				references.resize (2* references.count)
			end
			references.put_last (a_reference)
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

feature {NONE} -- Implementation

	references: DS_ARRAYED_LIST [XM_XPATH_BINDING_REFERENCE]

invariant

	references_not_void: references /= Void
	name_not_void: name /= Void and then name.count > 0
	required_type_not_void: required_type /= Void

end
	
