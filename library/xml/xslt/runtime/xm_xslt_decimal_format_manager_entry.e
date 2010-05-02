note

	description:

		"Objects that reside in the Decimal Format manager's hash table"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY

create

	make, make_list

feature {NONE} -- Initialization

	make (a_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY)
			-- Create a decimal format entry.
		require
			decimal_format_not_void: a_decimal_format /= Void
		do
			decimal_format := a_decimal_format
			is_decimal_format := True
		ensure
			decimal_format_set: decimal_format = a_decimal_format
		end

	make_list (a_list: DS_ARRAYED_LIST [XM_XSLT_FORMAT_NUMBER])
			-- Create a list of call-backs.
		require
			list_not_void: a_list /= Void
		do
			list := a_list
			is_list := True
		ensure
			list_set: list = a_list
		end

feature -- Access

	decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Decimal format

	list: DS_ARRAYED_LIST [XM_XSLT_FORMAT_NUMBER]
			-- List of call-backs

feature -- Status report

	is_list: BOOLEAN
			-- Is this entry a list of call-backs?

	is_decimal_format: BOOLEAN
			-- Is this entry a decimal format?

invariant

	list_or_decimal_format: (is_list xor is_decimal_format) and (decimal_format /= Void xor list /= Void)
	decimal_format: is_decimal_format implies decimal_format /= Void
	list: is_list implies list /= Void

end

