note

	description:

		"Scanner skeletons for an XML parser"

	library: "Gobo Eiffel XML library"
	copyright: "Copyright (c) 2003-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EIFFEL_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_stdin
		redefine
			set_input_buffer,
			reset,
			fatal_error,
			report_invalid_unicode_character_error
		end

	XM_EIFFEL_TOKENS
		export {NONE} all end

	XM_EIFFEL_PARSER_ERRORS
		export {NONE} all end

feature {NONE} -- Initialization

	make_scanner
			-- Create a new scanner.
		do
			create character_entity.make
			make_with_buffer (Empty_buffer)
			reset
		end

feature -- Reset

	reset
			-- Reset.
		do
			Precursor
			input_name := "-"
			last_value := ""
			last_string_value := ""
			last_error := Void
		end

	push_start_condition_dtd_ignore
			-- Push start condition 'dtd_ignore' to the stack.
		do
			push_start_condition (dtd_ignore)
		end

feature -- Input

	set_input_buffer (a_buffer: like input_buffer)
			-- Set `input_buffer' to `a_buffer'.
		do
			Precursor (a_buffer)
			input_name := a_buffer.name
		ensure then
			name_set: input_name = a_buffer.name
		end

	set_input_stream (a_stream: KI_CHARACTER_INPUT_STREAM)
			-- Set input buffer from a stream.
			-- This class is then in charge of closing it.
		require
			not_void: a_stream /= Void
			readable: a_stream.is_open_read
		local
			l_input_filter: like input_filter
		do
			input_stream := a_stream
			input_resolver := Void

			create l_input_filter.make_from_stream (a_stream)
			input_filter := l_input_filter
			set_input_buffer (new_file_buffer (l_input_filter))
		ensure
			input_stream_set: input_stream = a_stream
			input_resolver_reset: input_resolver = Void
		end

	set_input_from_resolver (a_resolver: XM_EXTERNAL_RESOLVER)
			-- Set input buffer from a resolver's last resolved
			-- stream and remember resolver to close it.
		require
			a_resolver_not_void: a_resolver /= Void
			a_resolver_resolved: not a_resolver.has_error
		do
			check a_resolver_resolved: attached a_resolver.last_stream as l_last_stream then
				set_input_stream (l_last_stream)
				input_resolver := a_resolver
			end
		ensure
			input_stream_set: input_stream = a_resolver.last_stream
			input_resolver_reset: input_resolver = a_resolver
		end

	close_input
			-- Close input buffer if needed.
		do
			if attached input_stream as l_input_stream then
				if attached input_resolver as l_input_resolver then
						-- Close a stream if it comes from a resolver,
						-- otherwise the client owns it and is in charge
						-- of closing it.
					if l_input_stream.is_closable then
						l_input_stream.close
					end
					l_input_resolver.resolve_finish
				end
				input_stream := Void
				input_resolver := Void
			end
		end

feature {NONE} -- Input

	input_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Saved stream for closing on end of stream

	input_resolver: detachable XM_EXTERNAL_RESOLVER
			-- Saved resolver for closure.

	input_filter: detachable XM_EIFFEL_INPUT_STREAM
			-- Saved filter for encoding changes

feature -- Encoding

	is_applicable_encoding (an_encoding: STRING): BOOLEAN
			-- Is this encoding known?
		do
			check filter_set: attached input_filter as l_input_filter then
				Result := l_input_filter.is_valid_encoding (an_encoding)
					and then l_input_filter.is_applicable_encoding (an_encoding)
			end
		end

	set_encoding (an_encoding: STRING)
			-- Set encoding.
		require
			valid_encoding: is_applicable_encoding (an_encoding)
		do
			check filter_set: attached input_filter as l_input_filter then
				l_input_filter.set_encoding (an_encoding)
			end
		end

feature {NONE} -- Encodings

	Encoding_us_ascii: STRING = "us-ascii"
	Encoding_latin_1: STRING = "iso-8859-1"
	Encoding_utf_8: STRING = "utf-8"
	Encoding_utf_16: STRING = "utf-16"

feature -- Error reporting

	has_error: BOOLEAN
			-- Was there an error?
		do
			Result := last_error /= Void
		end

	last_error: detachable STRING
			-- Last error

	fatal_error (a_message: STRING)
			-- A fatal error occurred.
		do
			last_error := a_message
		end

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read and caused the scanner
			-- to fail.
		do
			last_error := "Surrogate or invalid Unicode character '\u{" + a_code.to_hex_string + "}'"
		end

	error_position: XM_DEFAULT_POSITION
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

feature {NONE} -- System literal

	system_literal_text: STRING
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
			until
				text_item (i) = a_quote
			loop
				i := i - 1
			variant
				i
			end
			Result := text_substring (i + 1, text_count - 1)
		end

feature {NONE} -- Constants

	dtd_ignore: INTEGER
			-- Code for start condition 'dtd_ignore'
		deferred
		end

	normalized_newline: STRING
			-- Newline normalized text (2.11)
		once
			Result := "%N"
		ensure
			normalized_newline_not_void: Result /= Void
		end

	has_normalized_newline: BOOLEAN
			-- Has newline normalization already been applied?
		do
			Result := False
		end

	normalized_space: STRING = " "
			-- Normalized space

	two_normalized_spaces: STRING = "  "
			-- Two normalized spaces

invariant

	character_entity_not_void: character_entity /= Void
	input_name_not_void: input_name /= Void

end
