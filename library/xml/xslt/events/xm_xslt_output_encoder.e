indexing

	description:

		"Objects that encode character strings and send them to a stream writer."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUT_ENCODER

feature -- Access

	encoding: STRING
			-- Name of encoding

	outputter: XM_OUTPUT
			-- Raw outputter

feature -- Status report

	is_error: BOOLEAN
			-- has an error occured

	is_bad_character_code (a_code: INTEGER): BOOLEAN is
		-- Is `a_code' not representable in `encoding'?
		require
			positive_character_code: a_code > 0
		deferred
		end

	is_valid_string (a_character_string: STRING): BOOLEAN is
			-- Is `a_character_string' valid for output prior to encoding?
		local
			an_index: INTEGER
		do
			if a_character_string /= Void then
				Result := True
				from
					an_index := 1
				variant
					a_character_string.count + 1 - an_index
				until
					Result = False or else an_index > a_character_string.count
				loop
					if is_bad_character_code (a_character_string.item_code (an_index)) then
						Result := False
					end
					an_index := an_index + 1
				end
				
			end
		end

feature -- Element change

	output (a_character_string: STRING) is
			-- Encode `a_character_string' and write it to `outputter'.
		require
			valid_character_string: is_valid_string (a_character_string)
		deferred
		end

	output_ignoring_error (a_character_string: STRING) is
			-- Output `a_character_string', ignoring any error.
		require
			valid_string: is_valid_string (a_character_string)
		deferred
		end

invariant

	outputter_not_void: outputter /= Void
	encoding_not_void: encoding /= Void and then encoding.count > 0

end
	
