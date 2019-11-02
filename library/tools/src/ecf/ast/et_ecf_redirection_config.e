note

	description:

		"ECF redirection configurations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_REDIRECTION_CONFIG

inherit

	ET_ECF_CONFIG

create

	make

feature {NONE} -- Initialization

	make (a_location, a_filename: STRING; a_universe: like universe)
			-- Create a new ECF redirection config.
		require
			a_location_not_void: a_location /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			location := a_location
			filename := a_filename
			universe := a_universe
		ensure
			location_set: location = a_location
			filename_set: filename = a_filename
			universe_set: universe = a_universe
		end

feature -- Access

	location: STRING
			-- Pathname of the ECF file being redirected to

	message: detachable STRING
			-- Message explaining why there is a redirection

feature -- Setting

	set_message (a_message: like message)
			-- Set `message' to `a_message'.
		do
			message := a_message
		ensure
			message_set: message = a_message
		end

feature -- Processing

	process (a_processor: ET_ECF_CONFIG_PROCESSOR)
			-- Process current config.
		do
			a_processor.process_redirection_config (Current)
		end

end
