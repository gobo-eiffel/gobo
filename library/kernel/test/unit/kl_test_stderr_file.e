note

	description:

		"Test features of class KL_STDERR_FILE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_STDERR_FILE

inherit

	KL_TEST_CASE
	KL_SHARED_STANDARD_FILES

create

	make_default

feature -- Status report

	write_to_console: BOOLEAN = False
			-- Set this boolean to true to have this
			-- test actually write to the console.

feature -- Test

	test_make
			-- Test feature `make'.
		local
			a_file: KL_STDERR_FILE
		do
			create a_file.make
			assert ("a_file_not_void", a_file /= Void)
			assert_equal ("name_set", "stderr", a_file.name)
			assert ("is_open", a_file.is_open_write)
		end

	test_eol
			-- Test feature `eol'.
		local
			a_file: KL_STDERR_FILE
		do
			create a_file.make
			assert_equal ("eol", "%N", a_file.eol)
		end

	test_put_character
			-- Test feature `put_character'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("Hello gobo")
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.put_character ('H')
				a_file.put_character ('e')
				a_file.put_character ('l')
				a_file.put_character ('l')
				a_file.put_character ('o')
				a_file.put_character (' ')
				a_file.put_character ('g')
				a_file.put_character ('o')
				a_file.put_character ('b')
				a_file.put_character ('o')
				a_file.put_new_line
			end
		end

	test_put_string
			-- Test feature `put_string'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("Hello foo bar")
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.put_string ("Hello")
				a_file.put_character (' ')
				std.error.put_string ("foo ")
				a_file.put_string ("bar")
				a_file.put_new_line
			end
		end

	test_put_integer
			-- Test feature `put_integer'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("0")
				std.output.put_new_line
				std.output.put_string ("-123")
				std.output.put_new_line
				std.output.put_string ("5674")
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.put_integer (0)
				a_file.put_new_line
				a_file.put_integer (-123)
				a_file.put_new_line
				a_file.put_integer (5674)
				a_file.put_new_line
				a_file.flush
			end
		end

	test_put_boolean
			-- Test feature `put_boolean'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("True")
				std.output.put_new_line
				std.output.put_string ("False")
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.put_boolean (True)
				a_file.put_new_line
				a_file.put_boolean (False)
				a_file.put_new_line
				a_file.flush
			end
		end

	test_put_line
			-- Test feature `put_line'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("This is the first line,")
				std.output.put_new_line
				std.output.put_string ("this is the second line.")
				std.output.put_new_line
				std.output.put_character ('#')
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.put_line ("This is the first line,")
				a_file.put_line ("this is the second line.")
				a_file.put_character ('#')
				a_file.put_new_line
				a_file.flush
			end
		end

	test_put_new_line
			-- Test feature `put_new_line'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("This is the first line,")
				std.output.put_new_line
				std.output.put_string ("this is the second line.")
				std.output.put_new_line
				std.output.put_character ('#')
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.put_string ("This is the first line,")
				a_file.put_new_line
				a_file.put_string ("this is the second line.")
				a_file.put_new_line
				a_file.put_character ('#')
				a_file.put_new_line
			end
		end

	test_flush
			-- Test feature `flush'.
		local
			a_file: KL_STDERR_FILE
		do
			if write_to_console then
				std.output.put_string ("Expected:")
				std.output.put_new_line
				std.output.put_string ("Hello gobo")
				std.output.put_new_line
				std.output.put_string ("Got:")
				std.output.put_new_line
				create a_file.make
				a_file.flush
				a_file.put_string ("Hello")
				a_file.flush
				a_file.put_character (' ')
				a_file.put_string ("gobo")
				a_file.flush
				a_file.put_new_line
				a_file.flush
			end
		end

end
