indexing

	description:

		"Getest commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GETEST_COMMAND

inherit

	GEANT_COMMAND
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'getest' command.
		local
			a_tester: UC_EQUALITY_TESTER
		do
			precursor (a_project)
			!! defines.make_map (10)
			!! a_tester
			defines.set_key_equality_tester (a_tester)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := config_filename /= Void and then config_filename.count > 0
		ensure then
			config_filename_not_void: Result implies config_filename /= Void
			config_filename_not_empty: Result implies config_filename.count > 0
		end

feature -- Access

	config_filename: STRING
			-- Config filename

	compile: STRING
			-- Compilation command-line

	class_regexp: STRING
			-- Class regular expression

	feature_regexp: STRING
			-- Feature regular expression

	defines: DS_HASH_TABLE [STRING, STRING]
			-- Defined values from the command-line (--define option)

feature -- Setting

	set_config_filename (a_filename: STRING) is
			-- Set `config_filename' to `a_filename'
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			config_filename := a_filename
		ensure
			config_filename_set: config_filename = a_filename
		end

	set_compile (a_compile: like compile) is
			-- Set `compile' to `a_compile'.
		require
			a_compile_not_void: a_compile /= Void
		do
			compile := a_compile
		ensure
			compile_set: compile = a_compile
		end

	set_class_regexp (a_regexp: like class_regexp) is
			-- Set `class_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			class_regexp := a_regexp
		ensure
			class_regexp_set: class_regexp = a_regexp
		end

	set_feature_regexp (a_regexp: like feature_regexp) is
			-- Set `feature_regexp' to `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			feature_regexp := a_regexp
		ensure
			feature_regexp_set: feature_regexp = a_regexp
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			cmd: STRING
			a_filename: STRING
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			cmd := clone ("getest ")
			if defines.count > 0 then
				a_cursor := defines.new_cursor
				from a_cursor.start until a_cursor.after loop
					cmd.append_string ("--define=%"")
					cmd := STRING_.appended_string (cmd, a_cursor.key)
					cmd.append_character ('=')
					cmd := STRING_.appended_string (cmd, a_cursor.item)
					cmd.append_string ("%" ")
					a_cursor.forth
				end
			end
			if compile /= Void then
				cmd.append_string ("--compile=%"")
				cmd := STRING_.appended_string (cmd, compile)
				cmd.append_string ("%" ")
			end
			if class_regexp /= Void then
				cmd.append_string ("--class=%"")
				cmd := STRING_.appended_string (cmd, class_regexp)
				cmd.append_string ("%" ")
			end
			if feature_regexp /= Void then
				cmd.append_string ("--feature=%"")
				cmd := STRING_.appended_string (cmd, feature_regexp)
				cmd.append_string ("%" ")
			end
			a_filename := file_system.pathname_from_file_system (config_filename, unix_file_system)
			a_filename := file_system.pathname_from_file_system (config_filename, unix_file_system)
			cmd := STRING_.appended_string (cmd, a_filename)
			project.trace (<<"  [getest] ", cmd>>)
			execute_shell (cmd)
		end

invariant

	defines_not_void: defines /= Void
	no_void_define_name: not defines.has (Void)
	no_void_define_value: not defines.has_item (Void)

end
