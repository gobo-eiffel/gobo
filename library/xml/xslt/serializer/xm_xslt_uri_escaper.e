note

	description:

		"Objects that escape URI attribute values for html and xhtml serializer output methods."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_URI_ESCAPER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, notify_attribute
		end

	UT_URL_ENCODING
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_base: XM_XPATH_RECEIVER; a_is_xhtml: BOOLEAN)
			-- Initialize `Current'.
		require
			base_receiver_not_void: a_base /= Void
		do
			base_receiver := a_base
			base_uri := base_receiver.base_uri
			is_xhtml := a_is_xhtml
			create normalizer.make
			make_url_attributes
		ensure
			base_receiver_set: base_receiver = a_base
			is_xhtml_set: is_xhtml = a_is_xhtml
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; a_properties: INTEGER)
			-- Notify the start of an element
		do
			current_element := a_name_code
			Precursor (a_name_code, a_type_code, a_properties)
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER)
			-- Notify an attribute.
		local
			l_properties: INTEGER
		do
			if not is_output_escaping_disabled (a_properties) and is_url_attribute (a_name_code) then
				l_properties := INTEGER_.bit_and (a_properties, INTEGER_.bit_not (No_special_characters))
				Precursor (a_name_code, a_type_code, escaped_url (a_value), INTEGER_.bit_or (l_properties, Disable_escaping))
			else
				Precursor (a_name_code, a_type_code, a_value, a_properties)
			end
		end

feature {NONE} -- Implementation

	is_xhtml: BOOLEAN
			-- Is `Current' being used for XHTML output?

	current_element: INTEGER
			-- Name code of current element

	normalizer: XM_XSLT_NFC_NORMALIZER
			-- Unicode NFC normalizer

	url_attributes_set: DS_HASH_SET [STRING]
			-- Names of attributes that are sometimes URL valued
		once
			create Result.make (15)
			Result.set_equality_tester (string_equality_tester)
		end

	url_combinations_set: DS_HASH_SET [STRING]
			-- Names of elements-attribute pairs that are URL valued
		once
			create Result.make (37)
			Result.set_equality_tester (string_equality_tester)

		end

	unescaped_html_characters: DS_HASH_SET [CHARACTER]
			-- Characters to escape for fn:iri-to-uri()
		local
			an_index: INTEGER
		once
			create Result.make (95)
			from an_index := 32 until an_index > 126 loop
				Result.force (INTEGER_.to_character (an_index))
				an_index := an_index + 1
			end
		end


	escaped_url (a_url: STRING): STRING
			-- Escaped version of `a_url' (first normalized to NFC).
		require
			url_not_void: a_url /= Void
		local
			l_url: STRING
		do
			l_url := normalizer.normalized_string (a_url)

			-- NULs are added to prevent further escaping

			Result := STRING_.concat ("%U", escape_custom (utf8.to_utf8 (l_url), unescaped_html_characters, False))
			Result := STRING_.appended_string (Result, "%U")

			-- But we first have to do the XML built-in character reference mapping
			Result := escaped_xml (Result)
		end

	escaped_xml (a_string: STRING): STRING
			-- Version of `a_string' with built-in XML entities substituted for <>&"
		require
			a_string_not_void: a_string /= Void
			ascii_string: ANY_.same_types (a_string, "")
		local
			i, l_count: INTEGER
			c: CHARACTER
		do
			from
				i := 1
				l_count := a_string.count
				Result := ""
			until
				i > l_count
			loop
				c := a_string.item (i)
				if c = '<' then
					Result.append_string ("&lt;")
				elseif c = '>' then
					Result.append_string ("&gt;")
				elseif c = '&' then
					Result.append_string ("&amp;")
				elseif c = '%"' then
					Result.append_string ("&quot;")
				else
					Result.append_character (c)
				end
				i := i + 1
			end
		ensure
			escaped_xml_not_void: Result /= Void
			not_shorter: Result.count >= a_string.count
		end

	is_url_attribute (a_attribute: INTEGER): BOOLEAN
			-- Is `a_attribute' url-valued when used with `current_element'.?
		local
			l_attribute: STRING
		do
			if STRING_.same_string (shared_name_pool.namespace_uri_from_name_code (a_attribute), Null_uri) then
				if STRING_.same_string (shared_name_pool.namespace_uri_from_name_code (current_element), html_uri) then
					l_attribute := shared_name_pool.local_name_from_name_code (a_attribute)
					if url_attributes_set.has (l_attribute) then
						Result := url_combinations_set.has (shared_name_pool.local_name_from_name_code (current_element) + "+" + l_attribute)
					end
				end
			end
		end

	html_uri: STRING
			-- Uri for html elements
		do
			if is_xhtml then
				Result := Xhtml_uri
			else
				Result := Null_uri
			end
		ensure
			html_uri_not_void: Result /= Void
		end

	make_url_attributes
			-- Build sets for determining URL-valued attributes
		once
			set_url_attribute ("form", "action")
			set_url_attribute ("body", "background")
			set_url_attribute ("q", "cite")
			set_url_attribute ("blockquote", "cite")
			set_url_attribute ("del", "cite")
			set_url_attribute ("ins", "cite")
			set_url_attribute ("object", "classid")
			set_url_attribute ("object", "codebase")
			set_url_attribute ("applet", "codebase")
			set_url_attribute ("object", "data")
			set_url_attribute ("object", "datasrc")
			set_url_attribute ("button", "datasrc")
			set_url_attribute ("div", "datasrc")
			set_url_attribute ("input", "datasrc")
			set_url_attribute ("select", "datasrc")
			set_url_attribute ("span", "datasrc")
			set_url_attribute ("table", "datasrc")
			set_url_attribute ("textarea", "datasrc")
			set_url_attribute ("a", "href")
			set_url_attribute ("a", "name")
			set_url_attribute ("area", "href")
			set_url_attribute ("link", "href")
			set_url_attribute ("base", "href")
			set_url_attribute ("img", "longdesc")
			set_url_attribute ("frame", "longdesc")
			set_url_attribute ("iframe", "longdesc")
			set_url_attribute ("head", "profile")
			set_url_attribute ("script", "src")
			set_url_attribute ("script", "for")
			set_url_attribute ("input", "src")
			set_url_attribute ("frame", "src")
			set_url_attribute ("iframe", "src")
			set_url_attribute ("img", "src")
			set_url_attribute ("img", "usemap")
			set_url_attribute ("input", "usemap")
			set_url_attribute ("object", "usemap")
			set_url_attribute ("object", "archive")
		end

	set_url_attribute (a_element, a_attribute: STRING)
			-- Mark `a_attribute' as url-valued when used with `a_element'.
		require
			element_name_not_void: a_element /= Void
			attribute_name_not_void: a_attribute /= Void
		do
			if not url_attributes_set.has (a_attribute.as_lower) then
				url_attributes_set.put (a_attribute.as_lower)
			end
			url_combinations_set.put ((a_element + "+" + a_attribute).as_lower)
		end

invariant

	normalizer_not_void: normalizer /= Void

end
