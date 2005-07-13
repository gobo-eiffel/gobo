indexing

	description:

		"External URI resolver for the data protocol (RFC 2397)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"	
	date: "$Date: "
	revision: "$Revision: "


class

	XM_DATA_URI_RESOLVER

inherit

	XM_URI_RESOLVER

create

	make

feature {NONE} -- Initialization

	make is
		-- Nothing to do
		do
		end

feature -- Operation(s)

	scheme: STRING is "data"

	resolve (a_uri: UT_URI) is
			-- Resolve URI to stream.
		local
			a_string_stream: KL_STRING_INPUT_STREAM
		do
			has_error := False
			if a_uri.is_opaque and then a_uri.scheme.is_equal (scheme) then
				parse_components (a_uri)
				if not has_error then
					create a_string_stream.make (data)
					if is_base_64 then
						create {UT_BASE64_DECODING_INPUT_STREAM} last_stream.make (a_string_stream)
					else
						last_stream := a_string_stream
					end
				end
			else
				if a_uri.scheme.is_equal (scheme) then
					set_last_error (a_uri.full_reference + " is not an opaque URI")
				else
					set_last_error (a_uri.full_reference + " is not a data URI - software is configured wrongly.")
				end
			end
		end

feature -- Result

	has_error: BOOLEAN
			-- Did the last resolution attempt succeed?

	last_error: STRING

	last_stream: KI_CHARACTER_INPUT_STREAM
			-- Matching stream

	has_media_type: BOOLEAN is
			-- Is the media type available.
		do
			Result := not has_error 
		end

	last_media_type: UT_MEDIA_TYPE
			-- Media type, if available.

feature {NONE} -- Implementation

	data: STRING
			-- Actual data

	is_base_64: BOOLEAN
			-- Is `data' base-64 encoded?

	set_last_error (a_message: STRING) is
			-- Set `last_eeror' to `a_message'.
		require
			message_not_empty: a_message /= Void and then a_message.count > 0
		do
			last_error := a_message
			has_error := True
		ensure
			in_error: has_error
			error_text_set: last_error = a_message
		end

	parse_components (a_uri: UT_URI) is
			-- Parse `a_uri' into parameters, media-type and data
		require
			data_uri: a_uri /= Void and then a_uri.is_opaque and then a_uri.scheme.is_equal (scheme)
			no_previous_error: not has_error
		local
			opaque_part: STRING
			comma_index: INTEGER
		do
			data := Void
			last_media_type := Void
			is_base_64 := False
			opaque_part := a_uri.scheme_specific_part
			comma_index := opaque_part.index_of (',', 1)
			if comma_index = 0 then
				set_last_error (a_uri.full_reference + " does not contain any data (comma not present)")
			else
				data := opaque_part.substring (comma_index + 1, opaque_part.count)
				if comma_index > 1 then
					parse_parameters (opaque_part.substring (1, comma_index - 1))
				else
					create last_media_type.make ("text", "plain")
					last_media_type.add_parameter ("charset", "US-ASCII")
				end
			end
		ensure
			data_set_or_error: not has_error implies data /= Void
			media_type_set_or_error: not has_error implies last_media_type /= Void
		end

	parse_parameters (a_parameter_string: STRING) is
			-- Parse media-type and base-64 indicator.
		require
			parameter_string_not_empty: a_parameter_string /= Void and then a_parameter_string.count > 0
			no_previous_error: not has_error
		local
			a_splitter: ST_SPLITTER
			some_parameters, a_parameter_pair, some_components: DS_LIST [STRING]
			a_media_type: STRING
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			create a_splitter.make
			a_splitter.set_separators (";")
			some_parameters := a_splitter.split (a_parameter_string)
			a_media_type := some_parameters.item (1)
			a_splitter.set_separators ("/")
			some_components := a_splitter.split (a_media_type)
			if some_components.count /= 2 then
				set_last_error ("Content-type must contain exactly one /")
			else
				create last_media_type.make (some_components.item (1), some_components.item (2))
				if some_parameters.count > 1 then
					some_parameters.remove_first
					if STRING_.same_case_insensitive (some_parameters.item (some_parameters.count), "base64") then
						is_base_64 := True
						some_parameters.remove_last
					end
					from
						a_splitter.set_separators ("=")
						a_cursor := some_parameters.new_cursor; a_cursor.start
					variant
						some_parameters.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						a_parameter_pair := a_splitter.split (a_cursor.item)
						if a_parameter_pair.count /= 2 then
							set_last_error (a_cursor.item + " is not valid syntax for a Content-type parameter.")
							a_cursor.go_after
						else
							last_media_type.add_parameter (a_parameter_pair.item (1), a_parameter_pair.item (2))
							a_cursor.forth
						end
					end
				end
			end
		end
end

