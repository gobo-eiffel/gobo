note

	description:
	"[
		LSP URIs.

		The URI's format is defined in https://tools.ietf.org/html/rfc3986.

			foo://example.com:8042/over/there?name=ferret#nose
			\_/   \______________/\_________/ \_________/ \__/
			|           |            |            |        |
			scheme     authority       path        query   fragment
			|   _____________________|__
			/ \ /                        \
			urn:example:animal:ferret:nose

		Use classes UT_URI to parse a string into scheme, authority, path,
		query, and fragment URI components. See also class UT_FILE_URI_ROUTINES.

		Many of the interfaces contain fields that correspond to the URI of
		a document. For clarity, the type of such a field is declared as a
		LS_DOCUMENT_URI. Over the wire, it will still be transferred as a
		string, but this guarantees that the contents of that string can be
		parsed as a valid URI.

		Care should be taken to handle encoding in URIs. For example, some clients
		(such as VS Code) may encode colons in drive letters while others do not.
		The URIs below are both valid, but clients and servers should be consistent
		with the form they use themselves to ensure the other party doesn't interpret
		them as distinct URIs. Clients and servers should not assume that each other
		are encoding the same way (for example a client encoding colons in drive
		letters cannot assume server responses will have encoded colons). The same
		applies to casing of drive letters - one party should not assume the other
		party will return paths with drive letters cased the same as itself.

			file:///c:/project/readme.md
			file:///C%3A/project/readme.md
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_URI

inherit

	LS_ANY

feature -- Access

	to_string: LS_STRING
			-- String representation
		deferred
		ensure
			to_string_not_void: Result /= Void
		end

end
