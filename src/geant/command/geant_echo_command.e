indexing

	description:

		"echo command"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_ECHO_COMMAND

inherit

	GEANT_COMMAND
	
creation

	make
	
feature	-- Initialization

	make is
		do
		end

	execute is
		do
			log("  [echo] " + interpreted_string(message) + "%N")
		end

	is_executable : BOOLEAN is
		do
			Result := message /= Void
		ensure then
			message_not_void : Result implies message /= Void
		end

	set_message(a_message : STRING) is
		require
			message_not_void : a_message /= Void
		do
			message := a_message
		ensure
			message_set : message = a_message
		end


feature {NONE}
	message			: STRING
		-- Message to be echoed

end
