indexing

	description:

		"MacOS-like file systems"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_MACOS_FILE_SYSTEM

inherit

	KL_FILE_SYSTEM

creation

	make

feature -- Access

	eol: STRING is "%R"
			-- Line separator in current file system

	exe_file_extension: STRING is ".exe"
			-- Executable file extension in current file system

feature -- File factory

	new_input_file (a_name: STRING): KL_MACOS_INPUT_FILE is
			-- New input text file in current file system
		do
			!! Result.make (a_name)
		end

	new_output_file (a_name: STRING): KL_MACOS_OUTPUT_FILE is
			-- New output text file in current file system
		do
			!! Result.make (a_name)
		end

end -- class KL_MACOS_FILE_SYSTEM
