note

	description:

		"Objects that summarize an xml-stylsheet PI"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_XML_STYLESHEET

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_mime_type: like mime_type; a_character_set: like character_set; a_title: like title; some_applicable_media: like applicable_media; alternate: BOOLEAN)
			-- Establish invariant.
		require
			uri_not_void: a_uri /= Void
			mime_type_not_void: a_mime_type /= Void
			character_set_not_void: a_character_set /= Void
			title_not_void: a_title /= Void
			applicable_media_not_empty: some_applicable_media /= Void and then some_applicable_media.count > 0
			alternate:  alternate implies a_title.count > 0
		do
			uri := a_uri
			mime_type := a_mime_type
			character_set := a_character_set
			title := a_title
			applicable_media := some_applicable_media
			is_alternate := alternate
		ensure
			uri_set: uri = a_uri
			mime_type_set: mime_type = a_mime_type
			character_set_set: character_set = a_character_set
			title_set: title = a_title
			applicable_media_set: applicable_media = some_applicable_media
			is_alternate_set: is_alternate = alternate
		end

feature -- Access

	uri: STRING
			-- URI to fetch stylesheet

	mime_type: UT_MEDIA_TYPE
			-- MIME type of stylesheet to be fetched

	character_set: STRING
			-- Character encoding of stylesheet to be fetched

	title: STRING
			-- Preference title

	applicable_media: DS_LIST [STRING]
			-- Target media to which `Current' applies

	is_alternate: BOOLEAN
			-- Is `Current' intended as an alternative to a preferred style?

	is_persistent: BOOLEAN
			-- Is `Current' a persistent stylesheet?
		do
			Result := title.count = 0
		end

	is_preferred: BOOLEAN
			-- Is `Current' a preferred stylesheet?
		do
			Result := not is_persistent and then not is_alternate
		end

invariant

	uri_not_void: uri /= Void
	mime_type_not_void: mime_type /= Void
	character_set_not_void: character_set /= Void -- but may be empty
	title_not_void: title /= Void -- but may be empty
	applicable_media_not_empty: applicable_media /= Void and then applicable_media.count > 0
	alternate:  is_alternate implies title.count > 0

end

