indexing

	description:

		"Xace XML validators"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_VALIDATOR

creation

	make

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new Xace XML validator.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
		ensure
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Status report

	has_error: BOOLEAN
			-- Has an error been detected during the
			-- last validation process?

feature -- Validation

	validate_system_doc (a_doc: XM_DOCUMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_doc' is a valid XML Xace system.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
			a_position_table_not_void: a_position_table /= Void
		do
		end

	validate_cluster_doc (a_doc: XM_DOCUMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_doc' is a valid XML Xace cluster.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
			a_position_table_not_void: a_position_table /= Void
		do
		end

invariant

	error_handler_not_void: error_handler /= Void

end -- class ET_XACE_VALIDATOR
