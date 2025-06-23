note

	description:

		"Error handler to read Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error_message
		end

create

	make_standard,
	make_null

feature -- Status report

	has_error: BOOLEAN
			-- Has an error been reported?

feature -- Status setting

	set_has_error (b: BOOLEAN)
			-- Set `has_error` as `b`.
		do
			has_error := b
		ensure
			has_error_set: has_error = b
		end

feature -- Reporting

	report_error_message (an_error: STRING)
			-- Report `an_error'.
		do
			precursor (an_error)
			has_error := True
		end

end
