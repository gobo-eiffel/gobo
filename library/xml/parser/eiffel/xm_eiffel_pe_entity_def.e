note

	description:

		"PE entity definition and scanner"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_PE_ENTITY_DEF

inherit

	XM_EIFFEL_ENTITY_DEF
		redefine
			read_token, reset
		end

create

	make_literal,
	make_external,
	make_def

feature -- Scanner

	read_token
			-- Redefine token routine to add space before and
			-- after PE entity.
		do
			if not pre_sent then
				pre_sent := True
				last_token := SPACE
				last_value := normalized_space
			elseif post_sent then
				terminate
			else
				Precursor
				if end_of_file and not post_sent then
					post_sent := True
					last_token := SPACE
					last_value := normalized_space
				end
			end
		end

	reset
			-- Reset sent.
		do
			Precursor
			reset_sent
		end

feature {NONE} -- Implementation

	reset_sent
			-- Reset `*_sent' flags.
		do
			pre_sent := False
			post_sent := False
		end

	pre_sent: BOOLEAN
			-- Has the 'before' token been sent?

	post_sent: BOOLEAN
			-- Has the 'after' token been sent?

end
