indexing

	description:

		"Objects that output CDATA sections."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_CDATA_FILTER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, end_element, notify_characters, notify_processing_instruction, notify_comment
		end

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_underlying_receiver: XM_XPATH_RECEIVER; a_emitter: XM_XSLT_EMITTER; a_output_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Initialize `Current'
		require
			underlying_receiver_not_void: a_underlying_receiver /= Void
			emitter_not_void: a_emitter /= Void
			output_properties_not_void: a_output_properties /= Void
		do
			create element_fingerprints.make_default
			cdata_names := cdata_section_names (a_output_properties)
			create character_buffer.make (80)
			base_receiver := a_underlying_receiver
			document_uri := a_underlying_receiver.document_uri
			base_uri := a_underlying_receiver.base_uri
			emitter := a_emitter
		ensure
			base_receiver_set: base_receiver = a_underlying_receiver
			emitter_set: emitter = a_emitter
		end


feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			conditionally_flush
			element_fingerprints.force (fingerprint_from_name_code (a_name_code))
			Precursor (a_name_code, a_type_code, properties)
		end

	end_element is
			-- Notify the end of an element.
		do
			conditionally_flush
			element_fingerprints.remove
			Precursor
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			conditionally_flush
			Precursor (a_content_string, properties)
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			-- if is_output_escaping_disabled (properties) then

			-- If the user requests 'disable-output-escaping', this overrides the CDATA request.
			-- We end the CDATA section and output the characters as supplied.

			-- But as we do not support disable-output-escaping, it cannot be turned on, so

			check
				output_escaping_enabled: not is_output_escaping_disabled (properties)
			end
			character_buffer := STRING_.appended_string (character_buffer, chars)
			mark_as_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			conditionally_flush
			Precursor (a_name, a_data_string, properties)
		end


feature {NONE} -- Initialization

	emitter: XM_XSLT_EMITTER
			-- Emitter, used to obtain `output_encoder'

	output_encoder: XM_XSLT_OUTPUT_ENCODER
			-- Outputter encoder

	element_fingerprints: DS_ARRAYED_STACK [INTEGER]
			-- Fingerprints of elements in scope

	cdata_names: DS_LIST [INTEGER]
			-- Fingerprints of element-names to be output as CDATA sections

	cdata_section_names (some_output_properties: XM_XSLT_OUTPUT_PROPERTIES): DS_ARRAYED_LIST [INTEGER] is
			-- Calculated fingerprints of element-names to be output as CDATA sections
		require
			output_properties_not_void: some_output_properties /= Void
		local
			some_cdata_section_elements: DS_HASH_SET [STRING]
			a_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			some_cdata_section_elements := some_output_properties.cdata_section_elements
			create Result.make (some_cdata_section_elements.count)
			from
				a_cursor := some_cdata_section_elements.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				Result.put_last (shared_name_pool.fingerprint_from_expanded_name (a_cursor.item))
				a_cursor.forth
			end
		end

	character_buffer: STRING
			-- Accumulated character data

	conditionally_flush is
			-- Set `output_encoder' or flush `character_buffer'.
		do
			if output_encoder /= Void then
				flush
			else
				output_encoder := emitter.outputter
				if output_encoder /= Void then
					flush
				else

					-- If the emitter has yet to open the document
					--  (implied by `output_encoder = Void'), then
					--  there cannot be any CDATA sections in the buffer.

					check
						no_element_opened_yet: element_fingerprints.is_empty
					end

					-- The previous event must have been `notify_characters',
					--  otherwise this routine has already been called, and so we
					--  wont be in this branch

					base_receiver.notify_characters (character_buffer, 0)
					create character_buffer.make (80)
				end
			end
		ensure
			buffer_is_empty: character_buffer.count = 0
		end

	flush is
			-- Flush `character_buffer'.
		require
			output_encoder_not_void: output_encoder /= Void
	local
			is_cdata: BOOLEAN
			a_buffer_count, a_code, an_index, a_start_index: INTEGER
		do
			a_buffer_count := character_buffer.count
			if a_buffer_count > 0 then
				if element_fingerprints.is_empty then
					is_cdata := False -- text is not part of any element
				else
					is_cdata := cdata_names.has (element_fingerprints.item)
				end
				if	is_cdata then
					from
						an_index := 1; a_start_index := an_index
					variant
						character_buffer.count + 1 - an_index
					until
						an_index > character_buffer.count
					loop
						a_code := character_buffer.item_code (an_index)
						if output_encoder.is_bad_character_code (a_code) then
							flush_cdata (character_buffer.substring (a_start_index, an_index - 1))

							-- flush consecutive non-encodable characters before resuming the CDATA section

							from
								a_start_index := an_index
							until
								not output_encoder.is_bad_character_code (a_code)
							loop
								base_receiver.notify_characters (character_buffer.substring (an_index, an_index), 0)
								an_index := an_index + 1
								a_code := character_buffer.item_code (an_index)
							end
						else
							an_index := an_index + 1
						end
					end
					flush_cdata (character_buffer.substring (a_start_index, an_index - 1))
				else
					base_receiver.notify_characters (character_buffer, 0)
				end
				create character_buffer.make (80)
			end
		ensure
			buffer_is_empty: character_buffer.count = 0
		end

	flush_cdata (a_character_string: STRING) is
			-- Write a CDATA section.
		require
			buffer_not_void: a_character_string /= Void
		local
			a_start_index, an_index, a_count: INTEGER
		do
			base_receiver.notify_characters ("<![CDATA[", Disable_escaping)

			-- Check that the character data doesn't include the substring "]]>"

			from
				an_index := 1; a_start_index := 1; a_count := a_character_string.count
			variant
				a_count + 1 - an_index
			until
				an_index > a_count - 2
			loop
				if a_character_string.item (an_index) = ']' and then
					a_character_string.item (an_index + 1) = ']' and then
					a_character_string.item (an_index + 2) = '>' then
					base_receiver.notify_characters (a_character_string.substring (a_start_index, an_index + 1), Disable_escaping)
					base_receiver.notify_characters ("]]><![CDATA[", Disable_escaping)
					a_start_index := an_index + 2; an_index := a_start_index
				end
				an_index := an_index + 1
			end
			base_receiver.notify_characters (a_character_string.substring (a_start_index, an_index - 1), Disable_escaping)
			base_receiver.notify_characters ("]]>", Disable_escaping)
		end

invariant

	element_fingerprints_not_void: element_fingerprints /= Void
	cdata_names_not_void: cdata_names /= Void
	character_buffer_not_void: character_buffer /= Void
	emitter_not_void: emitter /= Void

end
	
