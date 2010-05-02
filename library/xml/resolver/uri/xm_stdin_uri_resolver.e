note

	description:

		"[
		External URI resolver for the stdin scheme.
      This represents reading from the standard input stream.
      The only lexical form allowed is the literal stdin:
       (plus optional fragment identifier)
      ]"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_STDIN_URI_RESOLVER

inherit

	XM_URI_RESOLVER

	KL_IMPORTED_ANY_ROUTINES

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_with_media_type

feature -- Initialization

	make
			-- Create with content type of application/xml.
		do
			make_with_media_type ("application", "xml")
		end

	make_with_media_type (a_type, a_subtype: STRING)
			-- Create with alternative content type.
		require
			a_type_not_void: a_type /= Void
			a_type_not_empty: a_type.count > 0
			a_type_string: ANY_.same_types (a_type, "")
			a_subtype_not_void: a_subtype /= Void
			a_subtype_not_empty: a_subtype.count > 0
			a_subtype_string: ANY_.same_types (a_subtype, "")
		do
			create last_media_type.make (a_type, a_subtype)
		end

feature -- Status report

	scheme: STRING = "stdin"
			-- Scheme

feature -- Action(s)

	resolve (a_uri: UT_URI)
			-- Resolve file URI.
		do
			if not a_uri.is_absolute then
				last_error := STRING_.concat (Valid_uri_message, a_uri.full_reference)
			elseif a_uri.has_authority then
				last_error := STRING_.concat (Valid_uri_message, a_uri.full_reference)
			elseif not a_uri.path_items.is_empty then
				last_error := STRING_.concat (Valid_uri_message, a_uri.full_reference)
			elseif a_uri.has_query then
				last_error := STRING_.concat (Valid_uri_message, a_uri.full_reference)
			else
				last_stream := std.input
				if last_stream.is_open_read then
					last_error := Void
				else
					last_error := "Standard input is closed"
				end
			end
		end

feature -- Result

	last_stream: KL_STDIN_FILE
			-- Standard input stream

	last_error: STRING
			-- Error

	has_error: BOOLEAN
			-- Is there an error?
		do
			Result := last_error /= Void
		end

	has_media_type: BOOLEAN
			-- Is the media type available.
		do
			Result := True
		end

	last_media_type: UT_MEDIA_TYPE
			-- Content type delivered by `last_stream'.

feature {NONE} -- Implementation

	Valid_uri_message: STRING = "The only acceptable lexical form for the stdin scheme is 'stdin:' (with optional fragment identifier). Found "
			-- Prefix for error messages

invariant

	last_media_type_not_void: last_media_type /= Void

end
