indexing

	description:

		"Objects that manage xsl:decimal-formats"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT_MANAGER

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create format_map.make_map (5)
		end

feature -- Access
	
	default_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Default decimal format
		do
			if default_format /= Void then
				Result := default_format
			else
				Result := all_defaults
			end
		ensure
			default_decimal_format_not_void: Result /= Void
		end

	named_format (a_fingerprint: INTEGER): XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Decimal-format named by `a_fingerprint'
		require
			positive_fingerprint: a_fingerprint > -1
			has_name: has (a_fingerprint)
		do
			Result := format_map.item (a_fingerprint)
		ensure
			named_format_not_void: Result /= Void
		end

feature -- Status report

	has (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `Current' have a decimal-format named `a_fingerprint'?
		require
			positive_fingerprint: a_fingerprint > -1
		do
			Result := format_map.has (a_fingerprint)
		end

	is_default_format_set: BOOLEAN is
			-- Has the default decimal format been declared yet?
		do
			Result := default_format /= Void
		end

	is_different_from_default_format (a_default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN is
			-- Does `a_default_format' differ from `default_decimal_format' by any value?
		require
			is_a_default_format: a_default_format /= Void and then a_default_format.fingerprint = -1
		do
			if default_format = Void then
				Result := True
			else
				Result := a_default_format.is_different_from (default_format)
			end
		end

	is_duplicate_format (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN is
			-- Does `a_format' differ from all other formats by any value?
		require
			is_not_a_default_format: a_format /= Void and then a_format.fingerprint > - 1 and then has (a_format.fingerprint)
		do
			Result := not a_format.is_different_from (named_format (a_format.fingerprint))
		end

feature -- Element change

	set_default_format (a_default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Set the default decimal_format
		require
			is_a_default_format: a_default_format /= Void and then a_default_format.fingerprint = -1
			default_format_not_set: not is_default_format_set
		do
			default_format := a_default_format
		ensure
			default_format_set: default_format = a_default_format
		end

	add_named_format (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Add a named decimal format.
		require
			is_not_a_default_format: a_format /= Void and then a_format.fingerprint > -1
			named_format_not_declared: not has (a_format.fingerprint)
		do
			format_map.put (a_format, a_format.fingerprint)
		ensure
			named_format_added: has (a_format.fingerprint)
		end

feature {NONE} -- Implementation

	format_map: DS_HASH_TABLE [XM_XSLT_DECIMAL_FORMAT_ENTRY, INTEGER]
			-- Map of fingerprints to decimal-formats

	default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Default format

	all_defaults: XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Default default format
		once
			create Result.make (-1)
		ensure
			default_default_decimal_format_not_void: Result /= Void			
		end

invariant

	format_map_not_void: format_map /= Void

end
	
