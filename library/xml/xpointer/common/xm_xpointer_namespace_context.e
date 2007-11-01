indexing

	description:

		"Objects that provide XML namespace bindings for XPointer"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	derivation: "See notice at bottom of file"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_NAMESPACE_CONTEXT

inherit

	XM_MARKUP_CONSTANTS

	XM_UNICODE_CHARACTERS_1_0

	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER

create make


feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create bindings.make_with_equality_testers (10, Void, string_equality_tester)
		end

feature -- Access

	is_prefix_declared (an_xml_prefix: STRING): BOOLEAN is
			-- Is there a binding for `an_xml_prefix'?
		require
			ncname: an_xml_prefix /= Void and then (an_xml_prefix.is_empty or is_ncname (an_xml_prefix))
		do
			if STRING_.same_string (an_xml_prefix, Xml_prefix) then
				Result := True
			elseif STRING_.same_string (an_xml_prefix, Xmlns) then
				Result := False
			else
				Result := bindings.has (an_xml_prefix)
			end
		end

	is_prefix_proscribed (an_xml_prefix: STRING): BOOLEAN is
			-- Is it forbidden to create a binding for `an_xml_prefix'?
		require
			ncname: an_xml_prefix /= Void and then (an_xml_prefix.is_empty or is_ncname (an_xml_prefix))
		do
			Result := STRING_.same_string (an_xml_prefix, Xmlns) or else STRING_.same_string (an_xml_prefix, Xml_prefix)
		end

	is_namespace_proscribed (a_namespace_uri: STRING): BOOLEAN is
			-- Is it forbidden to create a binding onto `a_namespace_uri'?
		require
			namespace_uri_not_empty: a_namespace_uri /= Void
		do
			Result := STRING_.same_string (a_namespace_uri, Xml_prefix_namespace) or else STRING_.same_string (a_namespace_uri, Xmlns_namespace)
		end

	namespace_uri (an_xml_prefix: STRING): STRING is
			-- Namespace URI for `an_xml_prefix'
		require
			ncname: an_xml_prefix /= Void and then (an_xml_prefix.is_empty or is_ncname (an_xml_prefix))
			prefix_declared: is_prefix_declared (an_xml_prefix)
		do
			if STRING_.same_string (an_xml_prefix, Xml_prefix) then
				Result := Xml_prefix_namespace
			else
				Result := bindings.item (an_xml_prefix)
			end
		ensure
			namespace_uri_not_emoty: Result /= Void and then Result.count > 0
		end

	namespace_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING] is
			-- Cursor over declared namespace other than 'xml'
		do
			Result := bindings.new_cursor
		ensure
			namespace_cursor_not_void: Result /= Void
		end

feature -- Element change

	bind (an_xml_prefix, a_namespace_uri: STRING) is
			-- Bind `an_xml_prefix' to `a_namespace_uri'.
		require
			ncname: an_xml_prefix /= Void and then (an_xml_prefix.is_empty or is_ncname (an_xml_prefix))
			namespace_uri_not_empty: a_namespace_uri /= Void and then a_namespace_uri.count > 0
			prefix_not_declared: not is_prefix_declared (an_xml_prefix)
			uri_not_proscribed: not is_namespace_proscribed (a_namespace_uri)
			prefix_not_proscribed: not is_prefix_proscribed (an_xml_prefix)
		do
			bindings.force_new (a_namespace_uri, an_xml_prefix)
		ensure
			prefix_declared: is_prefix_declared (an_xml_prefix)
			correct_binding: STRING_.same_string (a_namespace_uri, namespace_uri (an_xml_prefix))
		end

feature {NONE} -- Implementation

	bindings: DS_HASH_TABLE [STRING, STRING]

invariant

	bindings_not_void: bindings /= Void

end

