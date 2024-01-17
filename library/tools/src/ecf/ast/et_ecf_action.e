note

	description:

		"ECF actions to be executed before or after each compilation"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_ACTION

inherit

	ET_ECF_CONDITIONED
	
create

	make

feature {NONE} -- Initialization

	make (a_command_name: like command_name)
			-- Create a new action.
		require
			a_command_name_not_void: a_command_name /= Void
		do
			command_name := a_command_name
		ensure
			command_name_set: command_name = a_command_name
		end

feature -- Status report

	must_succeed: BOOLEAN
			-- Should current action be successful
			-- to run subsequent actions?
	
feature -- Access

	command_name: STRING
			-- Command name

	working_directory: detachable STRING
			-- Working directory

	description: detachable STRING
			-- Description
			
feature -- Status setting

	set_must_succeed (b: BOOLEAN)
			-- Set `must_succeed' to `b'.
		do
			must_succeed := b
		ensure
			must_succeed_set: must_succeed = b
		end

feature -- Setting

	set_working_directory (a_working_directory: like working_directory)
			-- Set `working_directory' to `a_working_directory'.
		do
			working_directory := a_working_directory
		ensure
			working_directory_set: working_directory = a_working_directory
		end

	set_description (a_description: like description)
			-- Set `description' to `a_description'.
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

invariant

	command_name_not_void: command_name /= Void

end
