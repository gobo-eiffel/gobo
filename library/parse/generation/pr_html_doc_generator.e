note

	description:

		"Grammar documentation generators in HTML format"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_HTML_DOC_GENERATOR

inherit

	PR_DOC_GENERATOR

create

	make

feature {NONE} -- Generation

	print_grammar_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print grammar documentation header to `a_file'.
		do
			a_file.put_line ("<html>")
			a_file.put_line ("<head>")
			a_file.put_line ("%T<title>Grammar</title>")
			a_file.put_line ("%T<style type=%"text/css%">")
			a_file.put_line ("%T<!--")
			print_css (a_file)
			a_file.put_line ("%T-->")
			a_file.put_line ("%T</style>")
			a_file.put_line ("</head>")
			a_file.put_line ("<body>")
		end

	print_grammar_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print grammar documentation footer to `a_file'.
		do
			a_file.put_line ("</body>")
			a_file.put_line ("</html>")
		end

	print_rule_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rule documentation header to `a_file'.
		do
			a_file.put_line ("<div class=%"rule%">")
		end

	print_rule_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print rule documentation footer to `a_file'.
		do
			a_file.put_line ("</div>")
			a_file.put_new_line
		end

	print_lhs (a_variable: PR_VARIABLE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_variable' (when it appears on the left-hand side of a rule) to `a_file'.
		do
			a_file.put_line ("<div class=%"lhs%">")
			a_file.put_string ("<span class=%"lhs_variable%" id=%"")
			a_file.put_string (a_variable.name)
			a_file.put_string ("%">")
			a_file.put_string (a_variable.name)
			a_file.put_string ("</span>")
			a_file.put_string (": ")
			a_file.put_line ("</div>")
		end

	print_first_rhs_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print first rhs documentation header to `a_file'.
		do
			a_file.put_line ("<div class=%"rhs%">")
			a_file.put_string ("&nbsp; ")
		end

	print_first_rhs_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print first rhs documentation footer to `a_file'.
		do
			a_file.put_line ("</div>")
		end

	print_next_rhs_header (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print next rhs documentation header to `a_file'.
		do
			a_file.put_line ("<div class=%"rhs%">")
			a_file.put_string ("| ")
		end

	print_next_rhs_footer (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print next rhs documentation footer to `a_file'.
		do
			a_file.put_line ("</div>")
		end

	print_token (a_token: PR_TOKEN; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_token' to `a_file'.
		do
			if a_token.literal_string /= Void then
				a_file.put_string ("<span class=%"literal_token%">")
				inspect a_token.literal_string.item (1)
				when '%"', '%'' then
					print_escaped (a_token.literal_string.substring (2, a_token.literal_string.count - 1), a_file)
				else
					print_escaped (a_token.literal_string, a_file)
				end
			else
				inspect a_token.name.item (1)
				when '%"', '%'' then
					a_file.put_string ("<span class=%"literal_token%">")
					print_escaped (a_token.name.substring (2, a_token.name.count - 1), a_file)
				else
					a_file.put_string ("<span class=%"token%">")
					print_escaped (a_token.name, a_file)
				end
			end
			a_file.put_character (' ')
			a_file.put_string ("</span>")
		end

	print_variable (a_variable: PR_VARIABLE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_variable' (when it appears on the right-hand side of a rule) to `a_file'.
		do
			a_file.put_string ("<span class=%"rhs_variable%">")
			a_file.put_string ("<a href=%"#")
			a_file.put_string (a_variable.name)
			a_file.put_string ("%">")
			a_file.put_string (a_variable.name)
			a_file.put_string ("</a> ")
			a_file.put_string ("</span>")
		end

	print_empty_rhs (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print an right-hand side of a rule to `a_file'.
		do
			a_file.put_string ("<span class=%"empty%">-/-</span>")
		end

	print_css (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print CSS to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("%Tbody {")
			a_file.put_line ("%T%Tfont-family: Verdana,Georgia,Geneva,sans serif;")
			a_file.put_line ("%T%Tfont-size: 11pt;")
			a_file.put_line ("%T}")
			a_file.put_line ("%Ta:link {")
			a_file.put_line ("%T%Tcolor: green;")
			a_file.put_line ("%T}")
			a_file.put_line ("%Ta:visited {")
			a_file.put_line ("%T%Tcolor: green;")
			a_file.put_line ("%T}")
			a_file.put_line ("%Ta:hover {")
			a_file.put_line ("%T%Tcolor: white;")
			a_file.put_line ("%T%Tbackground-color: blue;")
			a_file.put_line ("%T}")
			a_file.put_line ("%Ta:active {")
			a_file.put_line ("%T%Tcolor: red;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.lhs {")
			a_file.put_line ("%T%Tfont-weight: bold;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.rhs {")
			a_file.put_line ("%T%Tmargin: 0%% 0%% 0%% 3%%;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.empty {")
			a_file.put_line ("%T%Tcolor: gray;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.literal_token {")
			a_file.put_line ("%T%Tfont-family: Courier New,Courier; ")
			a_file.put_line ("%T%Tcolor: blue;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.token {")
			a_file.put_line ("%T%Tfont-family: Courier New,Courier; ")
			a_file.put_line ("%T%Tfont-style: italic;")
			a_file.put_line ("%T%Tcolor: black;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.rule {")
			a_file.put_line ("%T%Tmargin: 2%% 0%% 0%% 1%%;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.lhs_variable {")
			a_file.put_line ("%T%Tfont-family: Verdana,Georgia,sans serif; ")
			a_file.put_line ("%T%Tcolor: navy;")
			a_file.put_line ("%T}")
			a_file.put_line ("%T.rhs_variable {")
			a_file.put_line ("%T%Tfont-family: Verdana,Georgia,sans serif; ")
			a_file.put_line ("%T%Tcolor: green;")
			a_file.put_line ("%T}")
		end

	print_escaped (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_string' with escaped HTML characters to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			nb := a_string.count
			from
				i := 1
			until
				i > nb
			loop
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
				when 'A' .. 'Z', 'a' .. 'z', '0' .. '9', '_' then
					a_file.put_character (c)
				else
					a_file.put_string ("&#")
					a_file.put_string (c.code.out)
					a_file.put_character (';')
				end
				i := i + 1
			end
		end

end
