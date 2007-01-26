indexing

	description:

		"Generators of XML documents from XML trees (wrapper for output filters)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_FORMATTER

inherit

	XM_NODE_PROCESSOR
		redefine
			process_document
		end

	KL_SHARED_STREAMS
		export {NONE} all end
	
	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new XML formatter.
		do
			last_output := null_output_stream
		end

feature -- Access

	last_output: KI_CHARACTER_OUTPUT_STREAM
			-- Output stream
			
	set_output (an_output: like last_output) is
			-- Set output stream.
		require
			not_void: an_output /= Void
		do
			last_output := an_output
		end

feature -- Initialization

	wipe_out is
			-- Clear `last_string'.
		obsolete "Not meaningful now that streams are used"
		do
		end

feature -- Tree processor routines

	process_document (a_document: XM_DOCUMENT) is
			-- Process document using xmlns generator and pretty print filters.
		local
			pretty_print: XM_PRETTY_PRINT_FILTER
			xmlns_generator: XM_XMLNS_GENERATOR
		do
			create pretty_print.make_null
			pretty_print.set_output_stream (last_output)
			create xmlns_generator.set_next (pretty_print)
			a_document.process_to_events (xmlns_generator)
		end

feature -- Debugging options

	include_position (a_pos_table: XM_POSITION_TABLE) is
			-- Specify that node positions will be kept in `a_pos_table'.
		obsolete
			"position not supported in filters"
		require
			a_pos_table_not_void: a_pos_table /= Void
		do
		ensure
			position_included: is_position_included
		end

	exclude_position is
			-- Specify that node positions will not be kept.
		obsolete 
			"position not supported in filters"
		do
		ensure
			position_included: not is_position_included
		end

	is_position_included: BOOLEAN is
			-- Are node positions kept?
		do
		ensure
			not_supported: False
		end

invariant

	last_output_not_void: last_output /= Void

end
