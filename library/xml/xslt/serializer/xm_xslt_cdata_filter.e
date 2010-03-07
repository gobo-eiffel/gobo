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

	XM_XSLT_NORMALIZATION_SETTER
		rename
			make as make_normalizer
		end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_receiver: like base_receiver; a_emitter: like emitter; a_serializer: like serializer; a_output_properties: like output_properties) is
			-- Initialize `Current'
		require
			a_receiver_not_void: a_receiver /= Void
			a_emitter_not_void: a_emitter /= Void
			a_serializer_not_void: a_serializer /= Void
			a_output_properties_not_void: a_output_properties /= Void
			cdata_section_elements_not_empty: not a_output_properties.cdata_section_elements.is_empty
		do
			create element_fingerprints.make_default
			create character_buffer.make (80)
			base_receiver := a_receiver
			document_uri := a_receiver.document_uri
			base_uri := a_receiver.base_uri
			emitter := a_emitter
			make_normalizer (a_serializer, a_output_properties)
			cdata_names := cdata_section_names
		ensure
			base_receiver_set: base_receiver = a_receiver
			emitter_set: emitter = a_emitter
			serializer_set: serializer = a_serializer
			output_properties_set: output_properties = a_output_properties
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

	cdata_section_names: DS_ARRAYED_LIST [INTEGER] is
			-- Calculated fingerprints of element-names to be output as CDATA sections
		local
			l_cdata_section_elements: DS_HASH_SET [STRING]
			l_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			l_cdata_section_elements := output_properties.cdata_section_elements
			create Result.make (l_cdata_section_elements.count)
			from
				l_cursor := l_cdata_section_elements.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				Result.put_last (shared_name_pool.fingerprint_from_expanded_name (l_cursor.item))
				l_cursor.forth
			end
		ensure
			cdata_section_names_not_void: Result /= Void
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
			l_is_cdata: BOOLEAN
			l_code, l_index, l_start_index: INTEGER
			l_buffer: STRING
		do
			if not character_buffer.is_empty then
				if element_fingerprints.is_empty then
					l_is_cdata := False -- text is not part of any element
				else
					l_is_cdata := cdata_names.has (element_fingerprints.item)
				end
				if	l_is_cdata then
					if normalizer /= Void then
						l_buffer := normalizer.normalized_string (character_buffer)
					else
						l_buffer := character_buffer
					end
					from
						l_index := 1; l_start_index := l_index
					until
						l_index > l_buffer.count
					loop
						l_code := l_buffer.item_code (l_index)
						if l_code = 0 then
							-- discard NULL markers
							flush_cdata (l_buffer.substring (l_start_index, l_index - 1))
							l_index := l_index + 1
						elseif output_encoder.is_bad_character_code (l_code) then
							flush_cdata (l_buffer.substring (l_start_index, l_index - 1))

							-- flush consecutive non-encodable characters before resuming the CDATA section

							from
								l_start_index := l_index
							until
								not output_encoder.is_bad_character_code (l_code)
							loop
								if l_code /= 0 then
									-- discard NULL markers
									base_receiver.notify_characters (l_buffer.substring (l_index, l_index), 0)
								end
								l_index := l_index + 1
								l_code := l_buffer.item_code (l_index)
							end
						else
							l_index := l_index + 1
						end
					variant
						l_buffer.count + 1 - l_index
					end
					flush_cdata (l_buffer.substring (l_start_index, l_index - 1))
				else
					base_receiver.notify_characters (character_buffer, 0)
				end
				create character_buffer.make (80)
			end
		ensure
			buffer_is_empty: character_buffer.is_empty
		end

	flush_cdata (a_character_string: STRING) is
			-- Write a CDATA section.
		require
			buffer_not_void: a_character_string /= Void
		local
			l_start_index, l_index, l_count: INTEGER
		do
			base_receiver.notify_characters ("<![CDATA[", Disable_escaping)

			-- Check that the character data doesn't include the substring "]]> or a NULL marker"

			from
				l_index := 1
				l_start_index := 1
				l_count := a_character_string.count
			until
				l_index > l_count
			loop
				if a_character_string.item_code (l_index) = 0 then
					-- discard NULL markers
					base_receiver.notify_characters (a_character_string.substring (l_start_index, l_index - 1), Disable_escaping)
				elseif l_index <= l_count - 2 and then a_character_string.item (l_index) = ']' and then a_character_string.item (l_index + 1) = ']' and then a_character_string.item (l_index + 2) = '>' then
					base_receiver.notify_characters (a_character_string.substring (l_start_index, l_index - 1), Disable_escaping)
					base_receiver.notify_characters ("]]]]><![CDATA[", Disable_escaping)
					l_start_index := l_index + 2
					l_index := l_start_index - 1
				end
				l_index := l_index + 1
			variant
				l_count + 1 - l_index
			end
			base_receiver.notify_characters (a_character_string.substring (l_start_index, l_index - 1), Disable_escaping)
			base_receiver.notify_characters ("]]>", Disable_escaping)
		end

invariant

	element_fingerprints_not_void: element_fingerprints /= Void
	cdata_section_elements_not_empty: not output_properties.cdata_section_elements.is_empty
	cdata_names_not_void: cdata_names /= Void
	character_buffer_not_void: character_buffer /= Void
	emitter_not_void: emitter /= Void

end

