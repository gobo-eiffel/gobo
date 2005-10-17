indexing

	description:

		"Objects that insert <meta> tags into <head> elements."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_META_TAG_INSERTER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element,	notify_attribute, start_content, end_element
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create make

feature {NONE} -- Initialization

	make (a_receiver: XM_XPATH_RECEIVER; some_properties: XM_XSLT_OUTPUT_PROPERTIES; xhtml: BOOLEAN) is
			-- Establish invariant.
		require
			receiver_not_void: a_receiver /= Void
			output_properties_exist: some_properties /= Void
		do
			base_receiver := a_receiver
			system_id := base_receiver.system_id
			is_xhtml := xhtml
			if is_xhtml then
				matching_uri_code := Xhtml_uri_code
			else
				matching_uri_code := Default_uri_code
			end
			dropping_meta_tags_level := -1
			is_seeking_head := True
			if not shared_name_pool.is_name_code_allocated_using_uri_code (Null_uri, matching_uri_code, "meta") then
				shared_name_pool.allocate_name_using_uri_code (Null_uri, matching_uri_code, "meta")
				meta_name_code := shared_name_pool.last_name_code
			else
				meta_name_code := shared_name_pool.name_code (Null_uri, shared_name_pool.uri_from_uri_code (matching_uri_code), "meta")
			end
			if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, "http-equiv") then
				shared_name_pool.allocate_name (Null_uri, Null_uri, "http-equiv")
				http_equiv_name_code := shared_name_pool.last_name_code
			else
				http_equiv_name_code := shared_name_pool.name_code (Null_uri, Null_uri, "http-equiv")
			end
			if not shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, "content") then
				shared_name_pool.allocate_name (Null_uri, Null_uri, "content")
				content_name_code := shared_name_pool.last_name_code
			else
				content_name_code := shared_name_pool.name_code (Null_uri, Null_uri, "content")
			end
			media_type := some_properties.media_type
			encoding := some_properties.encoding
		ensure
			base_receiver_set: base_receiver = a_receiver
			is_xhtml_set: is_xhtml = xhtml
			dropping_level_set: dropping_meta_tags_level = -1
			seeking_head: is_seeking_head = True
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			finished: BOOLEAN
		do
			if	dropping_meta_tags_level = level then
				if	matches_name (a_name_code, "meta") then
					in_meta_tag := True; finished := True
					create attributes.make
				end
			end
			if not finished then
				level := level + 1
				Precursor (a_name_code, a_type_code, properties)
				if is_seeking_head then
					if	matches_name (a_name_code, "head") then
						found_head := True
					end
				end
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			if in_meta_tag then
				attributes.add_attribute (a_name_code, a_type_code, a_value)
			else
				Precursor (a_name_code, a_type_code, a_value, properties)
			end
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			a_content_type: STRING
		do
			if found_head then
				found_head := False
				Precursor
				base_receiver.start_element (meta_name_code, Untyped_type_code, 0)
				base_receiver.notify_attribute (http_equiv_name_code, Untyped_atomic_type_code, "Content-Type", 0)
				a_content_type := STRING_.concat (media_type, "; charset=")
				a_content_type := STRING_.appended_string (a_content_type, encoding)
				base_receiver.notify_attribute (content_name_code, Untyped_atomic_type_code, a_content_type, 0)
				base_receiver.start_content
				dropping_meta_tags_level := level
				is_seeking_head := False
				create attributes.make
				base_receiver.end_element
			end
			if not in_meta_tag then
				Precursor
			end
		end
	
	end_element is
			-- Notify the end of an element.
		local
			found: BOOLEAN
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_value: STRING
			an_index: INTEGER
		do
			if in_meta_tag then
				in_meta_tag := False

				--	if there was an http-equiv="ContentType" attribute, discard the meta element entirely

				from a_cursor := attributes.name_code_cursor; a_cursor.start until found or else a_cursor.after loop
					if matches_name (a_cursor.item, "http-equiv") then
						a_value := STRING_.cloned_string (attributes.attribute_value_by_index (a_cursor.index))
						STRING_.left_adjust (a_value)
						STRING_.right_adjust (a_value)
						if STRING_.same_case_insensitive ("Content-Type", a_value) then
							found := True -- so the meta tag won't be emitted
						end
					end
					a_cursor.forth
				end
				if not found then

					-- this was a meta element, but not one of the kind that we discard

					base_receiver.start_element (meta_name_code, Untyped_type_code, 0)
					from a_cursor := attributes.name_code_cursor; a_cursor.start until a_cursor.after loop
						an_index := a_cursor.index
						base_receiver.notify_attribute (a_cursor.item, attributes.attribute_type_code (an_index),
																  attributes.attribute_value_by_index (an_index), 0)
					end
					base_receiver.start_content
					base_receiver.end_element
				end
			else
				if dropping_meta_tags_level = level then
					dropping_meta_tags_level := -1
				end
				level := level - 1
				Precursor
			end
		end

feature {NONE} -- Implementation

	is_xhtml: BOOLEAN
			-- Is `Current' used for xhtml output?

	is_seeking_head, found_head: BOOLEAN
			-- Are we looking for/have we found a head element?

	in_meta_tag: BOOLEAN
			-- Are we in a matching meta tag?

	matching_uri_code: INTEGER
			-- Uri code for matching names

	meta_name_code: INTEGER
			-- Name code for meta element

	http_equiv_name_code: INTEGER
			-- Name code for http-equiv attribute

	content_name_code: INTEGER
			-- Name code for content attribute

	dropping_meta_tags_level: INTEGER
			-- Element nesting level at which meta tags are dropped

	level: INTEGER
			-- Element nesting level

	attributes: XM_XPATH_ATTRIBUTE_COLLECTION
			-- Attributes for current meta element

	encoding: STRING
			-- Encoding

	media_type: STRING
			-- Content type

	matches_name (a_name_code: INTEGER; a_local_name: STRING): BOOLEAN is
			-- Does `a_name_code' match against `a_local_name'?
		require
			local_name_lower_case: a_local_name /= Void
		do
			Result := shared_name_pool.uri_code_from_name_code (a_name_code) = matching_uri_code
			if Result then
				if is_xhtml then
					Result := STRING_.same_string (a_local_name, shared_name_pool.local_name_from_name_code (a_name_code))
				else
					Result := STRING_.same_case_insensitive (a_local_name, shared_name_pool.local_name_from_name_code (a_name_code))
				end
			end
		end

invariant

	encoding_not_void: encoding /= Void
	media_type_not_void: media_type /= Void

end
