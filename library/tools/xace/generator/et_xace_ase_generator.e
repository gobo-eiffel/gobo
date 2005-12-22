indexing

	description:

		"Ace file generators for ArachnoSmallEiffel"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ASE_GENERATOR

inherit

	ET_XACE_SE_GENERATOR
		redefine
			default_system_output_filename,
			print_generate
		end

create

	make

feature -- Access

	default_system_output_filename: STRING is "ase.ace"
			-- Name of generated Ace file

feature {NONE} -- Output

	print_generate (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the part of `an_option' which goes to the 'generate' section.
		do
			precursor (an_option, indent, a_file)
			if an_option.is_target_os_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("target_os: %"")
				a_file.put_string (an_option.target_os)
				a_file.put_character ('%"')
				a_file.put_new_line
			end
			if an_option.is_target_architecture_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("architecture: %"")
				a_file.put_string (an_option.target_architecture)
				a_file.put_character ('%"')
				a_file.put_new_line
			end
			if an_option.multithreaded then
				print_indentation (indent, a_file)
				a_file.put_line ("multithreading (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("multithreading (no)")
			end
			if STRING_.same_string (an_option.unicode, options.utf8_value) then
				print_indentation (indent, a_file)
				a_file.put_line ("unicode (yes)")
			else
				print_indentation (indent, a_file)
				a_file.put_line ("unicode (no)")
			end
		end

end
