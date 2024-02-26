note

	description:

		"Objects that manage xsl:decimal-formats"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_DECIMAL_FORMAT_MANAGER

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant.
		do
			create format_map.make_map (5)
			using_original_default := True
		end

feature -- Access

	default_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Default decimal format
		do
			if attached default_format as l_default_format then
				Result := l_default_format
			else
				Result := all_defaults
			end
		ensure
			default_decimal_format_not_void: Result /= Void
		end

	named_format (a_fingerprint: INTEGER): XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Decimal-format named by `a_fingerprint'
		require
			positive_fingerprint: a_fingerprint > -1
			has_named_format: has_named_format (a_fingerprint)
		do
			check attached format_map.item (a_fingerprint).decimal_format as l_decimal_format then
				Result := l_decimal_format
			end
		ensure
			named_format_not_void: Result /= Void
		end

feature -- Status report

	has_named_format (a_fingerprint: INTEGER): BOOLEAN
		-- Does `Current' have a decimal format named by `a_fingerprint'?
		require
			nearly_positive_fingerprint: a_fingerprint > -2
		do
			if has (a_fingerprint) then
				Result := format_map.item (a_fingerprint).is_decimal_format
			end
		end

	has (a_fingerprint: INTEGER): BOOLEAN
			-- Does `Current' have an entry for `a_fingerprint'?
		require
			nearly_positive_fingerprint: a_fingerprint > -2
		do
			Result := format_map.has (a_fingerprint)
		end

	is_default_format_set: BOOLEAN
			-- Has the default decimal format been declared yet?
		do
			Result := default_format /= Void
		end

	is_different_from_default_format (a_default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN
			-- Does `a_default_format' differ from `default_decimal_format' by any value?
		require
			is_a_default_format: a_default_format /= Void and then a_default_format.fingerprint = -1
		do
			if not attached default_format as l_default_format then
				Result := True
			else
				Result := a_default_format.is_different_from (l_default_format)
			end
		end

	is_duplicate_format (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN
			-- Does `a_format' differ from all other formats by any value?
		require
			is_not_a_default_format: a_format /= Void and then a_format.fingerprint > - 1 and then has_named_format (a_format.fingerprint)
		do
			Result := not a_format.is_different_from (named_format (a_format.fingerprint))
		end

feature -- Element change

	set_default_format (a_default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY)
			-- Set the default decimal_format
		require
			is_a_default_format: a_default_format /= Void and then a_default_format.fingerprint = -1
			default_format_not_set: not is_default_format_set
			no_higher_precedence_format: True -- TODO
		do
			default_format := a_default_format
			using_original_default := False
			set_named_format (a_default_format) -- to trigger fixup
		ensure
			default_format_set: default_format = a_default_format
		end

	set_named_format (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY)
			-- Add a named decimal format.
			-- Duplicates are not allowed unless the values are all equal,
			-- or there is another of higher precedence.
		require
			format_not_void: a_format /= Void
			no_higher_precedence_format: True -- TODO
		local
			an_entry: XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY
			a_list: DS_ARRAYED_LIST [XM_XSLT_FORMAT_NUMBER]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FORMAT_NUMBER]
		do
			if has (a_format.fingerprint) then
				an_entry := format_map.item (a_format.fingerprint)
				check
					entry_is_list: an_entry.is_list
					-- From pre-condition
					attached an_entry.list as l_entity_list
				then
					from
						a_list := l_entity_list
						a_cursor := a_list.new_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						a_cursor.item.fixup (a_format)
						a_cursor.forth
					variant
						a_list.count + 1 - a_cursor.index
					end
					format_map.remove (a_format.fingerprint)
				end
			end
			create an_entry.make (a_format)
			format_map.put_new (an_entry, a_format.fingerprint)
		ensure
			named_format_added: has_named_format (a_format.fingerprint)
		end

	fixup_default_default
			-- Call at the end of stylesheet compilation to fix up any format-number() calls
			--  to the "default default" decimal format.
		do
			if using_original_default then
				set_named_format (default_decimal_format)
			end
		end

	register_usage (a_fingerprint: INTEGER; a_callback: XM_XSLT_FORMAT_NUMBER)
			-- Register a format-number() function call that uses a particular decimal format.
			-- This allows early compile time resolution where possible,
			--  even in the case of a forwards reference
		require
			nearly_positive_fingerprint: a_fingerprint > -2
			call_not_void: a_callback /= Void
		local
			l_list: DS_ARRAYED_LIST [XM_XSLT_FORMAT_NUMBER]
			l_entry: XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY
		do
			format_map.search (a_fingerprint)
			if format_map.found then
				l_entry := format_map.found_item
				if l_entry.is_list then

					-- it's another forward reference
					check attached l_entry.list as l_entity_list then
						l_entity_list.force_last (a_callback)
					end
				else

					-- it's a backwards reference
					check attached l_entry.decimal_format as l_decimal_format then
						a_callback.fixup (l_decimal_format)
					end
				end
			else

				-- it's a forward reference

				create l_list.make_default
				l_list.put_last (a_callback)
				create l_entry.make_list (l_list)
				format_map.put_new (l_entry, a_fingerprint)
			end
		end

feature {NONE} -- Implementation

	using_original_default: BOOLEAN
			-- Are we using the original (default) default?

	format_map: DS_HASH_TABLE [XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY, INTEGER]
			-- Map of fingerprints to decimal-formats

	default_format: detachable XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Default format

	all_defaults: XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Default default format
		once
			create Result.make (-1, -1000000)
		ensure
			default_default_decimal_format_not_void: Result /= Void
		end

invariant

	format_map_not_void: format_map /= Void

end

