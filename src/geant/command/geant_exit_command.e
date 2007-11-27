indexing

	description:

		"Exit commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"


class GEANT_EXIT_COMMAND

inherit

	GEANT_COMMAND
		redefine
			is_exit_command
		end

create

	make

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := True
		ensure then
			always_executable: Result
		end

	is_exit_command: BOOLEAN is True
			-- Is current command the exit command?

feature -- Access

	code: INTEGER
			-- Exit code

feature -- Setting

	set_code (a_code: INTEGER) is
			-- Set `code' to `a_code'.
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

feature -- Execution

	execute is
			-- Execute command.
		do
			project.trace (<<"  [exit] code: ", code.out>>)
			exit_code := code
		end

end
