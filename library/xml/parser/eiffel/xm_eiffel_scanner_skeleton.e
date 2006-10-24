indexing

	description:

		"Scanner skeletons for an XML parser"

	library: "Gobo Eiffel XML library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EIFFEL_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_stdin
		redefine
			set_input_buffer,
			reset, fatal_error
		end

	XM_EIFFEL_TOKENS
		export {NONE} all end

	XM_EIFFEL_PARSER_ERRORS
		export {NONE} all end

feature {NONE} -- Initialization

	make_scanner is
			-- Create a new scanner.
		do
			create character_entity.make
			make_with_buffer (Empty_buffer)
			reset
		end

feature -- Reset

	reset is
			-- Reset.
		do
			Precursor
			input_name := "-"
			last_error := Void
			create start_conditions.make
		end

	push_start_condition_dtd_ignore is
			-- Push start condition 'dtd_ignore' to the stack.
		do
			push_start_condition (dtd_ignore)
		end

feature -- Input

	set_input_buffer (a_buffer: like input_buffer) is
			-- Set `input_buffer' to `a_buffer'.
		do
			Precursor (a_buffer)
			input_name := a_buffer.name
		ensure then
			name_set: input_name = a_buffer.name
		end

	set_input_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Set input buffer from a stream.
			-- This class is then in charge of closing it.
		require
			not_void: a_stream /= Void
			readable: a_stream.is_open_read
		do
			input_stream := a_stream
			input_resolver := Void

			create input_filter.make_from_stream (a_stream)
			set_input_buffer (new_file_buffer (input_filter))
		ensure
			input_stream_set: input_stream = a_stream
			input_resolver_reset: input_resolver = Void
		end

	set_input_from_resolver (a_resolver: XM_EXTERNAL_RESOLVER) is
			-- Set input buffer from a resolver's last resolved
			-- stream and remember resolver to close it. 
		require
			a_resolver_not_void: a_resolver /= Void
			a_resolver_resolved: not a_resolver.has_error
		do
			set_input_stream (a_resolver.last_stream)
			input_resolver := a_resolver
		ensure
			input_stream_set: input_stream = a_resolver.last_stream			
			input_resolver_reset: input_resolver = a_resolver
		end
			
	close_input is
			-- Close input buffer if needed.
		do
			if input_stream /= Void then
				if input_resolver /= Void then
						-- Close a stream if it comes from a resolver,
						-- otherwise the client owns it and is in charge
						-- of closing it.
					if input_stream.is_closable then
						input_stream.close
					end
					input_resolver.resolve_finish
				end
				input_stream := Void
				input_resolver := Void
			end
		end

feature {NONE} -- Input

	input_stream: KI_CHARACTER_INPUT_STREAM
			-- Saved stream for closing on end of stream
	
	input_resolver: XM_EXTERNAL_RESOLVER
			-- Saved resolver for closure.

	input_filter: XM_EIFFEL_INPUT_STREAM
			-- Saved filter for encoding changes

feature -- Encoding

	is_applicable_encoding (an_encoding: STRING): BOOLEAN is
			-- Is this encoding known?
		do
			check filter_set: input_filter /= Void end
			Result := input_filter.is_valid_encoding (an_encoding)
				and then input_filter.is_applicable_encoding (an_encoding)
		end

	set_encoding (an_encoding: STRING) is
			-- Set encoding.
		require
			valid_encoding: is_applicable_encoding (an_encoding)
		do
			check filter_set: input_filter /= Void end
			input_filter.set_encoding (an_encoding)
		end

feature {NONE} -- Encodings

	Encoding_us_ascii: STRING is "us-ascii"
	Encoding_latin_1: STRING is "iso-8859-1"
	Encoding_utf_8: STRING is "utf-8"
	Encoding_utf_16: STRING is "utf-16"

feature -- Error reporting

	has_error: BOOLEAN is
			-- Was there an error?
		do
			Result := last_error /= Void
		end

	last_error: STRING
			-- Last error

	fatal_error (a_message: STRING) is
			-- A fatal error occurred.
		do
			last_error := a_message
		end

	error_position: XM_DEFAULT_POSITION is
			-- Position.
		do
			create Result.make (input_name, position, column, line)
		ensure
			result_not_void: Result /= Void
		end
		
feature -- Access

	input_name: STRING
			-- Name of object being scanned

	last_value: STRING
			-- Semantic value of last token read

feature {NONE} -- Character entity

	character_entity: XM_EIFFEL_CHARACTER_ENTITY
			-- Character entity manager (class once)

feature {NONE} -- Start condition stack

	push_start_condition (a_condition: INTEGER) is
			-- Set start condition and add previous to stack.
		do
			start_conditions.force (start_condition)
			set_start_condition (a_condition)
		end

	pop_start_condition is
			-- Restore previous start condition.
		do
			if not start_conditions.is_empty then
					-- This would be a precondition save for
					-- invalid input document.
				set_start_condition (start_conditions.item)
				start_conditions.remove
			else
				-- Error, to be reported later in parser hopefully.
			end
		end

	start_conditions: DS_LINKED_STACK [INTEGER]
			-- Start conditions

feature {NONE} -- System literal

	system_literal_text: STRING is
			-- Find last quoted substring in scanner text.
			-- (this is microparsing, justified above)
		require
			quote_at_end: text_item (text_count) = '%'' or text_item (text_count) = '%"'
			--quote_in: text_substring (1, text_count-1).has (text_item (text_count))
		local
			i: INTEGER
			a_quote: CHARACTER
		do
			from
				a_quote := text_item (text_count)
				i := text_count - 1
			invariant
				i >= 0
			variant
				i
			until
				text_item (i) = a_quote
			loop
				i := i - 1
			end
			Result := text_substring (i + 1, text_count - 1)
		end

feature {NONE} -- Constants

	dtd_ignore: INTEGER is
			-- Code for start condition 'dtd_ignore'
		deferred
		end

	normalized_newline: STRING is
			-- Newline normalized text (2.11)
		once
			Result := "%N"
		ensure
			normalized_newline_not_void: Result /= Void
		end

	has_normalized_newline: BOOLEAN is
			-- Has newline normalization already been applied?
		do
			Result := False
		end

	normalized_space: STRING is " "
			-- Normalized space

	two_normalized_spaces: STRING is "  "
			-- Two normalized spaces

invariant

	start_conditions_not_void: start_conditions /= Void
	character_entity_not_void: character_entity /= Void
	input_name_not_void: input_name /= Void

end
