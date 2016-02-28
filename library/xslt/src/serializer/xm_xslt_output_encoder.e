note

	description:

		"Objects that encode character strings and send them to a stream writer."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUT_ENCODER

inherit

	XM_UNICODE_CHARACTERS_1_1

feature -- Access

	encoding: STRING
			-- Name of encoding

	outputter: XM_OUTPUT
			-- Raw outputter

	byte_order_mark: STRING
			-- XML BOM
		require
			byte_order_mark_permitted: byte_order_mark_permitted
		deferred
		ensure
			byte_order_mark_not_void: Result /= Void
		end

feature -- Status report

	is_error: BOOLEAN
			-- has an error occurred

	byte_order_mark_permitted: BOOLEAN
			--	Is a BOM permitted?
		deferred
		end

	is_byte_order_mark_default: BOOLEAN
			-- Is emitting a BOM the default behaviour?
		require
			byte_order_mark_permitted: byte_order_mark_permitted
		deferred
		end

	is_bad_character_code (a_code: INTEGER): BOOLEAN
		-- Is `a_code' not representable in `encoding'?
		require
			valid_character_code: is_char (a_code)
		deferred
		end

	is_valid_string (a_character_string: STRING): BOOLEAN
			-- Is `a_character_string' valid for output prior to encoding?
		local
			l_index, l_code: INTEGER
		do
			if a_character_string /= Void then
				Result := True
				from
					l_index := 1
				until
					Result = False or else l_index > a_character_string.count
				loop
					l_code := a_character_string.item_code (l_index)
					if not is_char (l_code) or else is_bad_character_code (l_code) then
						Result := False
					end
					l_index := l_index + 1
				variant
					a_character_string.count + 1 - l_index
				end

			end
		end

feature -- Element change

	output (a_character_string: STRING)
			-- Encode `a_character_string' and write it to `outputter'.
		require
			valid_character_string: is_valid_string (a_character_string)
		deferred
		end

	output_ignoring_error (a_character_string: STRING)
			-- Output `a_character_string', ignoring any error.
		require
			valid_string: is_valid_string (a_character_string)
		deferred
		end

invariant

	outputter_not_void: outputter /= Void
	encoding_not_void: encoding /= Void and then encoding.count > 0

end

