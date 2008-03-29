indexing

	description:

		"Objects that represent a set of XSLT keys sharing the same expanded QName"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_SET

create

	make

feature {NONE} -- Initialization

	make (a_fingerprint: INTEGER) is
			-- Create set of keys named by `a_fingerprint'.
		require
			strictly_positive_fingerprint: a_fingerprint > 0
		do
			fingerprint := a_fingerprint
			create key_definitions.make_default
		ensure
			fingerprint_set: fingerprint = a_fingerprint
		end

feature -- Access

	fingerprint: INTEGER
			-- Name of set

	key_definitions: DS_ARRAYED_LIST [XM_XSLT_KEY_DEFINITION]
			-- Compiled xsl:key definitions

	is_backwards_compatible: BOOLEAN
			-- Was any definition made under backwards compatibility (XPath 1.0)?

feature -- Element change

	add_definition (a_def: XM_XSLT_KEY_DEFINITION) is
			-- Add `a_def' to `key_definitions'.
		require
			a_def_not_void: a_def /= Void
		do
			if a_def.is_backwards_compatible_mode then
				is_backwards_compatible := True
				key_definitions.do_all (agent {XM_XSLT_KEY_DEFINITION}.set_backwards_compatible)
			end
			if not key_definitions.extendible (1) then
				key_definitions.resize (2 * key_definitions.count)
			end
			key_definitions.put_last (a_def)
		ensure
			one_more: key_definitions.count = old key_definitions.count + 1
			inserted: key_definitions.last = a_def
			backwards_compatiblity: a_def.is_backwards_compatible_mode implies is_backwards_compatible
			unchanged_compatibility: not a_def.is_backwards_compatible_mode implies (is_backwards_compatible = old is_backwards_compatible)
		end

invariant

	strictly_positive_fingerprint: fingerprint > 0
	key_definitions_not_void: key_definitions /= Void
	no_void_definitions: not key_definitions.has (Void)

end
