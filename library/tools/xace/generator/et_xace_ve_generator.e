indexing

	description:

		"Ace file generators for Visual Eiffel 5.0 and greater"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_VE_GENERATOR

inherit

	ET_XACE_XML_GENERATOR
		redefine
			default_system_output_filename,
			default_library_output_filename,
			print_console_application_option,
			print_mounted_libraries
		end

create

	make

feature -- Access

	default_system_output_filename: STRING is "ve.xace"
			-- Name of generated Ace file

	default_library_output_filename: STRING is "ve.xace"
			-- Name of generated library Ace file

feature {NONE} -- Output

	print_console_application_option (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print option 'console_application' to `a_file' if not already done.
		do
			if not an_option.is_console_application_declared then
					-- VE's default (false) is not the same as Xace's default (true).
				print_indentation (indent, a_file)
				a_file.put_line ("<option name=%"console_application%" value=%"true%"/>")
			end
		end

	print_mounted_libraries (a_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_mounted_libraries' to `a_file'.
		local
			i, nb: INTEGER
			library_list: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
			a_library: ET_XACE_MOUNTED_LIBRARY
			a_pathname: STRING
		do
			library_list := a_mounted_libraries.libraries
			nb := library_list.count
			from i := 1 until i > nb loop
				a_library := library_list.item (i)
				a_pathname := a_library.pathname
				if is_shallow then
					if a_library.is_root then
						print_indentation (indent, a_file)
						a_file.put_string ("<mount location=%"")
						print_quote_escaped_string (a_pathname, a_file)
						a_file.put_line ("%"/>")
					end
				elseif a_pathname.has_substring ("${VE_Lib}") then
					print_indentation (indent, a_file)
					a_file.put_string ("<mount location=%"")
					print_quote_escaped_string (a_pathname, a_file)
					a_file.put_line ("%"/>")
				end
				i := i + 1
			end
		end

end
