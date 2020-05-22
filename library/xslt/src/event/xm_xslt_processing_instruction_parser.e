note

	description:

		"XML event handler that parses xml-stylesheet PIs"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2020, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PROCESSING_INSTRUCTION_PARSER

inherit

	XM_CALLBACKS_NULL
		rename
			make as make_callbacks,
			initialize as initialize_callbacks
		redefine
			on_processing_instruction, on_start_tag, on_error
		end

	XM_DTD_CALLBACKS_NULL
		rename
			make as make_dtd_callbacks,
			initialize as initialize_dtd_callbacks
		redefine
			on_dtd_processing_instruction
		end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

		-- This filter is designed to extract xml-stylesheet PI's from an XML source file.
		-- When the document element is found, parsing is terminated early. The document
		--  will have to be parsed again, later, without this filter, once the
		--  stylesheet has been compiled.

create

	make

feature {NONE} -- Initialization

	make (an_error_collector: XM_PARSER_STOP_ON_ERROR_FILTER)
			-- Establish invariant
		require
			error_collector_not_void: an_error_collector /= Void
		do
			error_collector := an_error_collector
			create stylesheets.make_default
		ensure
			error_collector_set: error_collector = an_error_collector
		end

feature -- Access

	stylesheets: DS_ARRAYED_LIST [XM_XSLT_XML_STYLESHEET]
			-- Candidate stylesheets

feature -- Status report

	is_error: BOOLEAN
			-- Did an error occur for current PI?

	error_message: detachable STRING
			-- Error message (for interactive debugging only)

feature -- Document type definuition callbacks

	on_dtd_processing_instruction (a_name, a_content: STRING)
			-- PI.
		do
			if pi_name.is_equal (a_name) then
				process_pi (a_content)
			end
		end


feature -- Errors

	on_error (a_message: STRING)
			-- Event producer detected an error.
		do
			error_collector.on_error (a_message)
		end

feature -- Tag

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Start of start tag.
		do
			on_error ("Document element found")
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING)
			-- Processing instruction.
		do
			if pi_name.is_equal (a_name) then
				process_pi (a_content)
			end
		end

feature {NONE} -- Initialization

	pi_name: STRING = "xml-stylesheet"
			-- Name of processing instruction

	error_collector: XM_PARSER_STOP_ON_ERROR_FILTER
			-- Error collector to stop further parsing.

	uri: detachable STRING
			-- URI of stylesheet to be applied

	mime_type: detachable UT_MEDIA_TYPE
			-- MIME type of stylesheet to be applied

	title: detachable STRING
			-- Preference name of stylesheet to be applied

	charset: detachable STRING
			-- Character set of stylesheet to be applied

	applicable_media: detachable DS_LIST [STRING]
			-- Target media of stylesheet to be applied

	alternate: BOOLEAN
			-- Is stylesheet to be applied an alternate?

	alternate_seen: BOOLEAN
			-- For duplication detection

	process_pi (a_content: STRING)
			-- process an xml-stylesheet PI
		require
			content_not_void: a_content /= Void
		local
			a_start, a_count, a_quote_index, an_end_quote, a_dquote, an_squote: INTEGER
			a_string, a_name, a_value: STRING
			a_quote: CHARACTER
		do
			is_error := False
			applicable_media := Void
			uri := Void
			charset := Void
			mime_type := Void
			title := Void
			alternate_seen := False
			alternate := False
			from
				create a_string.make_from_string (a_content)
				STRING_.right_adjust (a_string)
				a_count := a_string.count
				a_start := 1
			until
				is_error or else a_start > a_count - 4 -- each pseudo-attribute must be at least four characters long: x=''
			loop
				a_dquote := a_string.index_of ('"', a_start)
				an_squote := a_string.index_of ('%'', a_start)
				if a_dquote = 0 and then an_squote = 0 then
					a_start := a_string.count -- finished
				else
					a_quote_index := 0
					if a_dquote = 0 or else (an_squote /= 0 and then an_squote < a_dquote) then
						a_quote_index := an_squote
						a_quote := '%''
					else
						a_quote_index := a_dquote
						a_quote := '"'
					end
					if a_quote_index = 0 then
						set_error ("No pseudo-attribute found at end of content")
					else
						an_end_quote := a_string.index_of (a_quote, a_quote_index + 1)
						if an_end_quote = 0 then
							set_error ("Mis-matched quotes.")
						else
							a_value := a_string.substring (a_quote_index + 1, an_end_quote - 1)
							a_name  := a_string.substring (a_start, a_quote_index -1)
							a_start := an_end_quote + 1
							STRING_.left_adjust (a_name)
							STRING_.right_adjust (a_name)
							if a_name.item (a_name.count) = '=' then
								a_name := a_name.substring (1, a_name.count - 1)
								STRING_.right_adjust (a_name)
								if is_valid_name (a_name) then
									process_attribute (a_name, a_value)
								else
									set_error (STRING_.concat (a_name, " is not a recognized pseudo-attribute."))
								end
							else
								set_error (STRING_.concat (a_name, " is not followed by '='."))
							end
						end
					end
				end
			end
			if not is_error then
				create_pi
			end
		end

	is_valid_name (a_name: STRING): BOOLEAN
			-- Is `a_name' a valid pseudo-attribute?
		require
			name_not_void: a_name /= Void
		do
			Result := STRING_.same_string (a_name, "href")
				or else STRING_.same_string (a_name, "type")
				or else STRING_.same_string (a_name, "title")
				or else STRING_.same_string (a_name, "media")
				or else STRING_.same_string (a_name, "charset")
				or else STRING_.same_string (a_name, "alternate")
		end

	process_attribute (a_name, a_value: STRING)
			-- Process a pseudo-attribute.
		require
			name_not_empty: a_name /= Void
			valid_name: is_valid_name (a_name)
			value_not_void: a_value /= Void
		local
			a_message, a_major, a_minor: STRING
			an_unescaped_value: detachable STRING
			a_splitter: ST_SPLITTER
			some_type_parts: DS_LIST [STRING]
		do
			an_unescaped_value := unescaped_value (a_value)
			if an_unescaped_value = Void then
				a_message := STRING_.concat ("Pseudo-attribute ", a_name)
				a_message := STRING_.appended_string (a_message, " has a lexically bad value")
				set_error (a_message)
			else
				if STRING_.same_string (a_name, "href") then
					if uri /= Void then
						set_error ("Duplicated pseudo-attribute: href.")
					else
						uri := an_unescaped_value
					end
				elseif STRING_.same_string (a_name, "type") then
					if mime_type /= Void then
						set_error ("Duplicated pseudo-attribute: type.")
					else
						create a_splitter.make
						a_splitter.set_separators ("/")
						some_type_parts := a_splitter.split (an_unescaped_value)
						if some_type_parts.count /= 2 then
							set_error (STRING_.concat ("Invalid syntax for MIME type: ", an_unescaped_value))
						else
							a_major := some_type_parts.item (1)
							a_minor := some_type_parts.item (2)
							if STRING_.same_string (a_major, "text") then
								if STRING_.same_string (a_minor, "xml") or else STRING_.same_string (a_minor, "xsl") then
									create mime_type.make (a_major, a_minor)
								else
									set_error (STRING_.concat ("Invalid text MIME type: ", a_minor))
								end
							elseif STRING_.same_string (a_major, "application") then
								if STRING_.same_string (a_minor, "xml") or else STRING_.same_string (a_minor, "xslt+xml") then
									create mime_type.make (a_major, a_minor)
								else
									set_error ("Invalid application MIME type.")
								end
							else
								set_error ("Invalid MIME type.")
							end
						end
					end
				elseif STRING_.same_string (a_name, "title") then
					if title = Void then
						title := an_unescaped_value
					else
						set_error ("Duplicated pseudo-attribute: title.")
					end
				elseif STRING_.same_string (a_name, "media") then
					if applicable_media = Void then
						process_media (an_unescaped_value)
					else
						set_error ("Duplicated pseudo-attribute: media.")
					end
				elseif STRING_.same_string (a_name, "charset") then
					if charset = Void then
						charset := an_unescaped_value
					else
						set_error ("Duplicated pseudo-attribute: charset.")
					end
				elseif STRING_.same_string (a_name, "alternate") then
					if alternate_seen then
						set_error ("Duplicated pseudo-attribute: alternate.")
					else
						process_alternate (an_unescaped_value)
					end
				end
			end
		end

	set_error (a_message: STRING)
			-- Set a diagnostic error message.
		require
			no_previous_error: not is_error
			a_message_not_void: a_message /= Void
			a_message_not_empty: a_message.count > 0
		do
			is_error := True
			error_message := STRING_.concat ("Error processing xml-stylesheet PI (on the assumption it is for XSLT): ", a_message)
		ensure
			in_error: is_error
		end

	process_alternate (a_value: STRING)
			-- Process "alternate=" pseudo-attribute.
		require
			not_seen_before: not alternate_seen
			value_not_void: a_value /= Void
		do
			alternate_seen := True
			if STRING_.same_string (a_value, "yes") then
				alternate := True
			elseif STRING_.same_string (a_value, "no") then
				alternate := False
			else
				set_error ("Invalid value for 'alternate' attribute.")
			end
		end

	process_media (a_value: STRING)
			-- Process "media=" pseudo-attribute.
		require
			not_seen_before: applicable_media = Void
			value_not_void: a_value /= Void
		local
			a_splitter: ST_SPLITTER
			a_cursor: DS_LIST_CURSOR [STRING]
			a_medium: STRING
			an_index, a_code: INTEGER
			all_ascii: BOOLEAN
			l_applicable_media: like applicable_media
		do
			create a_splitter.make
			a_splitter.set_separators (",")
			l_applicable_media := a_splitter.split (a_value)
			applicable_media := l_applicable_media
			from
				a_cursor := l_applicable_media.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				a_medium := a_cursor.item
				from
					an_index := 1
					all_ascii := True
				until
					not all_ascii or else an_index > a_medium.count
				loop
					a_code := a_medium.item_code (an_index)
					if a_code = 45 -- hyphen
						or else (a_code >= 48 and then a_code <= 57) -- digit
						or else (a_code >= 65 and then a_code <= 90) -- upper case
 						or else (a_code >= 96 and then a_code <= 122) -- lower case
 					then
					   -- OK
					else
						all_ascii := False
					end
					an_index := an_index + 1
					a_cursor.replace (a_medium.substring (1, an_index - 1))
				end
				a_cursor.forth
			variant
				l_applicable_media.count + 1 - a_cursor.index
			end
		ensure
			processed: applicable_media /= Void
		end

	create_pi
			-- Create an entry in `stylesheets'.
		require
			no_error: not is_error
		local
			a_pi: XM_XSLT_XML_STYLESHEET
			l_applicable_media: like applicable_media
			l_title: like title
			l_charset: like charset
		do
			if attached uri as l_uri and then attached mime_type as l_mime_type then
				l_charset := charset
				if l_charset = Void then
					l_charset := ""
					charset := l_charset
				end
				l_title := title
				if l_title = Void then
					l_title := ""
					title := l_title
				end
				l_applicable_media := applicable_media
				if l_applicable_media = Void then
					create {DS_ARRAYED_LIST [STRING]} l_applicable_media.make (1)
					applicable_media := l_applicable_media
				end
				l_applicable_media.set_equality_tester (string_equality_tester)
				if l_applicable_media.count = 0 then
					l_applicable_media.put_last ("screen")
				end
				if l_title.count = 0 and then alternate then
					set_error (STRING_.concat ("Empty title for alternate stylesheet ", l_uri))
				else
					create a_pi.make (l_uri, l_mime_type, l_charset, l_title, l_applicable_media, alternate)
					stylesheets.force_last (a_pi)
				end
			else
				std.output.put_line ("Can't create PI")
			end
		end

	unescaped_value (a_value: STRING): detachable STRING
			-- `a_value' with all escaping removed.
		require
			value_not_void: a_value /= Void
			no_error: not is_error
		local
			an_index, a_count, a_semicolon: INTEGER
			a_string: detachable STRING
		do
			an_index := a_value.index_of ('&', 1)
			if an_index = 0 then
				Result := a_value
			else
				Result := ""
				from
					an_index := 1; a_count := a_value.count
				until
					Result = Void or else an_index > a_count
				loop
					if a_value.item (an_index) = '&' then
						a_semicolon := a_value.index_of (';', an_index + 1)
						if a_semicolon = 0 then
							Result := Void
						elseif a_value.item (an_index + 1) = '#' then
							a_string := character_reference (a_value.substring (an_index + 2, a_semicolon - 1))
						else
							a_string := predefined_entity_reference (a_value.substring (an_index + 1, a_semicolon - 1))
						end
						if a_string /= Void and Result /= Void then
							Result := STRING_.appended_string (Result, a_string)
						else
							Result := Void
						end
						an_index := a_semicolon + 1
					else
						Result := STRING_.appended_string (Result, a_value.substring (an_index, an_index))
						an_index := an_index + 1
					end
				variant
					a_count + 1 - an_index
				end
			end
		ensure
			possible_void_result: True
		end

	character_reference (a_value: STRING): detachable STRING
			-- Decoded character reference
		require
			value_not_void: a_value /= Void
		local
			a_string: STRING
			an_entity: XM_EIFFEL_CHARACTER_ENTITY
		do
			if a_value.count /= 0 then
				create an_entity.make
				if a_value.item (1) = 'x' then
					a_string := a_value.substring (2, a_value.count)
					if STRING_.is_hexadecimal (a_string) then
						an_entity.from_hexadecimal (a_string)
						if an_entity.is_valid then
							Result := an_entity.to_utf8
						end
					end
				else
					if STRING_.is_decimal (a_value) then
						an_entity.from_decimal (a_value)
						if an_entity.is_valid then
							Result := an_entity.to_utf8
						end
					end
				end
			end
		end

	predefined_entity_reference (a_value: STRING): detachable STRING
			-- Decoded predefined entity reference
		require
			value_not_void: a_value /= Void
		do
			if STRING_.same_string (a_value, "amp") then
				Result := "&"
			elseif STRING_.same_string (a_value, "lt") then
				Result := "<"
			elseif STRING_.same_string (a_value, "gt") then
				Result := ">"
			elseif STRING_.same_string (a_value, "quot") then
				Result := "%""
			elseif STRING_.same_string (a_value, "apos") then
				Result := "'"
			end
		end

invariant

	candidates_not_void: stylesheets /= Void
	error_collector_not_void: error_collector /= Void
	error_message: is_error implies attached error_message as l_error_message and then l_error_message.count > 0

end
