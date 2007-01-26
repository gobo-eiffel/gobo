indexing

	description:

		"Echo commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ECHO_COMMAND

inherit

	GEANT_COMMAND

create

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

	to_file: STRING
			-- Name of destination file

	append: BOOLEAN
			-- Should `message' be appended to file named `to_file'?

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

	set_to_file (a_to_file: like to_file) is
			-- Set `to_file' to `a_to_file'.
		require
			a_to_file_not_void: a_to_file /= Void
			a_to_file_not_empty: a_to_file.count > 0
		do
			to_file := a_to_file
		ensure
			to_file_set: to_file = a_to_file
		end

	set_append (a_append: BOOLEAN) is
			-- Set `append' to `a_append'.
		do
			append := a_append
		ensure
			append_set: append = a_append
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_file : KL_TEXT_OUTPUT_FILE
		do
			project.trace (<<"  [echo] ">>)

			if to_file /= Void then
				create a_file.make (to_file)
				if append then
					a_file.open_append
					project.trace (<<"  [echo] Appending '", message, "' to file '", to_file, "'">>)
				else
					a_file.open_write
					project.trace (<<"  [echo] Writing '", message, "' to file '", to_file, "'">>)
				end
				if a_file.is_open_write then
					a_file.put_line (message)
					a_file.close
					exit_code := 0
				else
					project.log (<<"  [echo] error: cannot write to file", to_file, "'">>)
					exit_code := 1
				end
			else
				project.log (<<message>>)
				exit_code := 0
			end
		end

end
