indexing

	description:

		"Echo commands"

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

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := message /= Void
		ensure then
			message_not_void: Result implies message /= Void
		end

feature -- Access

	message: STRING
			-- Message to be echoed

feature -- Setting

	set_message (a_message: like message) is
			-- Set `message' to `a_message'.
		require
			a_message_not_void: a_message /= Void
		do
			message := a_message
		ensure
			message_set: message = a_message
		end

feature -- Execution

	execute is
			-- Execute command.
		do
			trace ("  [echo] " + message + "%N")
		end

end -- class GEANT_ECHO_COMMAND
