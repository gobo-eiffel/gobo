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

	make (nm: STRING; fp: INTEGER; rt: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant
		require
			name_not_void: nm /= Void and then nm.count > 0
			required_type_not_void: rt /= Void
		do
			create references.make_equal (5)
			name := nm
			fingerprint := fp
			required_type := rt
		ensure
			name_set: name = nm
		end

feature -- Access

	name: STRING
			-- For use in diagnostics - lexically, a QName

	fingerprint: INTEGER
			-- Fingerprint of variable name from name pool

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Sequence type required for this variable
	
feature -- Element change

	register_reference (ref: XM_XPATH_BINDING_REFERENCE) is
			-- Register `ref' as a reference to this variable for fix-up.
			-- This routine is called by the XPath parser when
			-- each reference to the variable is enountered.
			-- At some time after parsing and before execution of the expression,
			-- `Current' is responsible for calling the two routines set_static_type
			-- and fixup on each xm_xpath_binding_reference that has been registered with it.
		do
			if not references.extendible (1) then
				references.resize (2* references.count)
			end
			references.put_last (ref)
		end

feature {NONE} -- Implementation

	references: DS_ARRAYED_LIST [XM_XPATH_BINDING_REFERENCE]

invariant

	references_not_void: references /= Void
	name_not_void: name /= Void and then name.count > 0
	required_type_not_void: required_type /= Void

end
	
