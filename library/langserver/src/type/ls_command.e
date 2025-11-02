note

	description:
	"[
		LSP commands.

		Represents a reference to a command. Provides a title which
		will be used to represent a command in the UI. Commands are
		identified by a string identifier. The recommended way to
		handle commands is to implement their execution on the server
		side if the client and server provides the corresponding capabilities.
		Alternatively the tool extension code could handle the command.
		The protocol currently doesn't specify a set of well-known commands.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMMAND

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_title: like title; a_command: like command; a_arguments: like arguments)
			-- Create a new command.
		require
			a_title_not_void: a_title /= Void
			a_command_not_void: a_command /= Void
		do
			title := a_title
			command := a_command
			arguments := a_arguments
		ensure
			title_set: title = a_title
			command_set: command = a_command
			arguments_set: arguments = a_arguments
		end

feature -- Access

	title: LS_STRING
			-- Title of the command, like 'save'.

	command: LS_STRING
			-- The identifier of the actual command handler.

	arguments: detachable LS_ARRAY
			-- Arguments that the command handler should be
			-- invoked with.

feature -- Field names

	title_name: STRING_8 = "title"
	command_name: STRING_8 = "command"
	arguments_name: STRING_8 = "arguments"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_command (Current)
		end

invariant

	title_not_void: title /= Void
	command_not_void: command /= Void

end
