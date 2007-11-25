indexing

	description:

		"Objects that represent XSLT keys"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_DEFINITION

inherit

	XM_XSLT_COMPILED_PROCEDURE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: like executable; a_match: XM_XSLT_PATTERN; a_usage_expression: like body;
			a_collator: ST_COLLATOR; a_collation_uri: STRING; a_line_number: like line_number;
			a_system_id: like system_id; a_slot_manager: like slot_manager) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			match_not_void: a_match /= Void
			usage_expression_not_void: a_usage_expression /= Void
			collation_uri: a_collation_uri /= Void
			collator: a_collator /= Void
			system_id_not_void: a_system_id /= Void
			slot_manager_not_void: a_slot_manager /= Void
		do
			make_procedure (an_executable, a_usage_expression, a_line_number, a_system_id, a_slot_manager)
			match := a_match
			collator := a_collator
			collation_uri := a_collation_uri
		ensure
			match_set: match = a_match
			collator_set: collator = a_collator
			uri_set: STRING_.same_string (collation_uri, a_collation_uri)
			executable_set: executable = an_executable
			use_set: body = a_usage_expression
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			slot_manager_set: slot_manager = a_slot_manager
		end

feature -- Access

	match: XM_XSLT_PATTERN
			-- Match pattern

	collator: ST_COLLATOR
			-- Collator for string comparisons

	collation_uri: STRING
			-- Name of `collator'

	is_backwards_compatible_mode: BOOLEAN
			-- Wss XPath 1.0 compatibility in force for this definition?

feature -- Setting

	set_backwards_compatible is
			-- Set `is_backwards_compatible_mode' to `True'.
		do
			is_backwards_compatible_mode := True
		ensure
			set: is_backwards_compatible_mode
		end
				
feature -- Element change
	
	allocate_slots is
			-- Allocate slot numbers for all range variable in `body' and it's sub-expresions.
		do
			body.allocate_slots (1, slot_manager)
		end
											  
invariant

	match: match /= Void
	collation_uri: collation_uri /= Void
	collator: collator /= Void

end
