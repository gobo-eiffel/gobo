indexing

	description:

		"Run-time references to xsl:param within xsl:function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_USER_FUNCTION_PARAMETER

inherit

	XM_XPATH_BINDING

	XM_XPATH_VARIABLE_DECLARATION_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_required_type: XM_XPATH_SEQUENCE_TYPE; a_slot_number: INTEGER; a_variable_name: STRING) is
			-- Establish invariant.
		require
			required_type_not_void: a_required_type /= Void
			variable_name_not_void: a_variable_name /= Void
			strictly_positive_slot_number: a_slot_number > 0
		do
			required_type := a_required_type
			slot_number := a_slot_number
			variable_name := a_variable_name

			-- The following is so that it will be assumed a parameter
			--  is referenced repeatedly until proved otherwise

			reference_count := Many_references
		ensure
			required_type_set: required_type = a_required_type
			slot_number_set: slot_number = a_slot_number
			variable_name_set: variable_name = a_variable_name
		end

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of variable

	reference_count: INTEGER
			-- Number of references to `Current'

	slot_number: INTEGER
			-- Local variable slot number

feature -- Status report
	
	is_global: BOOLEAN is
			-- Is binding global or local?
		do
			-- Result := False
		end

feature -- Evaluation

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is 
			-- Evaluate variable
		do
			last_evaluated_binding := a_context.evaluated_local_variable (slot_number)
		end

feature -- Element change
	
	set_reference_count (some_references: DS_ARRAYED_LIST [XM_XPATH_VARIABLE_REFERENCE]) is
			-- Set `reference_count'.
		require
			references_not_void: some_references /= Void
		do
			reference_count := variable_reference_count (some_references, Current)
		end

invariant

	required_type_not_void: required_type /= Void
	strictly_positive_slot_number: slot_number > 0

end

