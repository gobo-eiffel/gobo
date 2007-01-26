indexing

	description:

		"Grammar documentation generators in XML format"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_XML_DOC_GENERATOR

inherit

	PR_DOC_GENERATOR

create

	make

feature {NONE} -- Generation

	print_grammar_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print grammar documentation header to `a_file'.
		do
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"iso-8859-1%"?>")
			a_file.put_line ("<grammar>")
		end

	print_grammar_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print grammar documentation footer to `a_file'.
		do
			a_file.put_line ("</grammar>")
		end

	print_rule_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rule documentation header to `a_file'.
		do
			a_file.put_line ("%T<rule>")
		end

	print_rule_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rule documentation footer to `a_file'.
		do
			a_file.put_line ("%T</rule>")
		end

	print_lhs (a_variable: PR_VARIABLE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_variable' (when it appears on the left-hand side of a rule) to `a_file'.
		do
			a_file.put_line ("%T%T<lhs>")
			a_file.put_string ("%T%T%T<variable>")
			a_file.put_string (a_variable.name)
			a_file.put_line ("</variable>")
			a_file.put_line ("%T%T</lhs>")
		end

	print_first_rhs_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print first rhs documentation header to `a_file'.
		do
			a_file.put_line ("%T%T<rhs>")
		end

	print_first_rhs_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print first rhs documentation footer to `a_file'.
		do
			a_file.put_line ("%T%T</rhs>")
		end

	print_next_rhs_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print next rhs documentation header to `a_file'.
		do
			a_file.put_line ("%T%T<rhs>")
		end

	print_next_rhs_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print next rhs documentation footer to `a_file'.
		do
			a_file.put_line ("%T%T</rhs>")
		end

	print_token (a_token: PR_TOKEN; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_token' to `a_file'.
		do
			a_file.put_line ("%T%T%T<token>")
			a_file.put_string ("%T%T%T%T<name>")
			print_escaped (a_token.name, a_file)
			a_file.put_line ("</name>")
			a_file.put_string ("%T%T%T%T<literal")
			if a_token.literal_string = Void then
				a_file.put_line ("/>")
			else
				a_file.put_string (">")
				print_escaped (a_token.literal_string, a_file)
				a_file.put_line ("</literal>")
			end
			a_file.put_line ("%T%T%T</token>")
		end

	print_variable (a_variable: PR_VARIABLE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_variable' (when it appears on the right-hand side of a rule) to `a_file'.
		do
			a_file.put_string ("%T%T%T<variable>")
			a_file.put_string (a_variable.name)
			a_file.put_line ("</variable>")
		end

	print_empty_rhs (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print an right-hand side of a rule to `a_file'.
		do
			a_file.put_line ("%T%T%T<empty/>")
		end

	print_escaped (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_string' with escaped XML characters to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				c := a_string.item (i)
				inspect c
				when '%'' then
					a_file.put_string ("&apos;")
				when '%"' then
					a_file.put_string ("&quot;")
				when '<' then
					a_file.put_string ("&lt;")
				when '>' then
					a_file.put_string ("&gt;")
				when '&' then
					a_file.put_string ("&amp;")
				else
					a_file.put_character (c)
				end
				i := i + 1
			end
		end

end
