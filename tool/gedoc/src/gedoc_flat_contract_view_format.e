note

	description:

	"[
		Gobo Eiffel Documentation Flat-Contract-view Format: do not print feature implementations,
		only exported features (even inherited features) with their assertions.
	]"

	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GEDOC_FLAT_CONTRACT_VIEW_FORMAT

inherit

	GEDOC_CONTRACT_VIEW_FORMAT
		redefine
			make
		end

create

	make

create {GEDOC_FLAT_CONTRACT_VIEW_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- Create a new documentation format with `a_input_filename'.
		do
			precursor (a_input_filename, a_system_processor)
			contract_viewer.set_flat_enabled (True)
		end

end
