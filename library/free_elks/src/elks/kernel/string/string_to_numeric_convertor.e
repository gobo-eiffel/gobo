note
	description: "Abstract convertor for string to number conversion"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	STRING_TO_NUMERIC_CONVERTOR

inherit
	NUMERIC_INFORMATION

feature -- Status reporting

	trailing_separators_acceptable: BOOLEAN
		-- Are trailing separators acceptable?

	leading_separators_acceptable: BOOLEAN
		-- Are leading separators acceptable?

	leading_separators: STRING
			-- Leading separators

	trailing_separators: STRING
			-- Trailing separators

	separators_valid (separators: STRING): BOOLEAN
			-- Are `separators' valid?
		require
			separators_not_void: separators /= Void
		deferred
		end

	conversion_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' to which string will be converted valid?
			-- See `NUMERIC_INFORMATION' for more information.
		deferred
		end

	overflowed: BOOLEAN
			-- Is number overflowed (too large)?
		deferred
		end

	underflowed: BOOLEAN
			-- Is number underflowed (too small)?
		deferred
		end

	parse_successful: BOOLEAN
			-- Is parse so far successful?
		deferred
		end

	conversion_type: INTEGER
		-- Type to which a string will be converted
		-- See `NUMERIC_INFORMATION' for more information.

feature -- Reset

	reset (type: INTEGER)
			-- Reset this convertor to start a new parse session
			-- and get ready for parsing integer of `type'.
			-- Always call this feature before every new parse session.
			-- See `NUMERIC_INFORMATION' for more information about `type'.			
		require
			type_valid: conversion_type_valid (type)
		deferred
		ensure
			last_state_set: last_state = 0
			sign_set: sign = 0
			conversion_type_set: conversion_type = type
			not_overflowed: not overflowed
			not_underflowed: not underflowed
			parse_successful: parse_successful
		end

feature -- Status setting

	set_trailing_separators_acceptable (b: BOOLEAN)
			-- Set `trailing_separators_acceptable' to `b'.
		do
			trailing_separators_acceptable := b
		ensure
			trailing_separators_acceptable_set:
				trailing_separators_acceptable = b
		end

	set_leading_separators_acceptable (b: BOOLEAN)
			-- Set `leading_separators_acceptable' to `b'.
		do
			leading_separators_acceptable := b
		ensure
			leading_separators_acceptable_set:
				leading_separators_acceptable = b
		end

	set_leading_separators (separators: STRING)
			-- Set `leading_separators' with `separators'.
		require
			separators_not_void: separators /= Void
			separators_valid: separators_valid (separators)
		do
			create leading_separators.make_from_string (separators)
		ensure
			leading_separators_set: leading_separators ~ separators
		end

	set_trailing_separators (separators: STRING)
			-- Set `trailing_separators' with `separators'.
		require
			separators_not_void: separators /= Void
			separators_valid: separators_valid (separators)
		do
			create trailing_separators.make_from_string (separators)
		ensure
			trailing_separators_set: trailing_separators ~ separators
		end

feature -- Parse

	parse_string_with_type (s: READABLE_STRING_GENERAL; type: INTEGER)
			-- `Reset' convertor to start a new parse session and
			-- parse `s' to see if it is a number of `type'.
			-- Make result available in `overflowed', `underflowed' and `parse_successful'.
			-- See `NUMERIC_INFORMATION' for more information about `type'.
		require
			s_not_void: s /= Void
			type_valid: conversion_type_valid (type)
		deferred
		end

	parse_character (c: CHARACTER)
			-- Parse `c' in current parse session.
			-- Make result available in `overflowed', `underflowed' and `parse_successful'.			
		deferred
		end

feature {NONE} -- Implementation

	last_state: INTEGER
		-- Last state of this state machine

	sign: INTEGER
		-- Sign of this integer, 0: positive; 1: negative.

invariant
	leading_separators_not_void: leading_separators /= Void
	trailing_separators_not_void: trailing_separators /= Void
note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
