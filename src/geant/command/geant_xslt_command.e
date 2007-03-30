indexing

	description:

		"XSLT commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2005, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_XSLT_COMMAND

inherit

	GEANT_FILESYSTEM_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new 'xslt' command.
		do
			precursor (a_project)
			input_filename := ""
			output_filename := ""
			processor := Processor_xalan_cpp

			set_indent ("4")
			create parameters.make (10)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		do
			Result := (input_filename /= Void and then input_filename.count > 0) and
				(output_filename /= Void and then output_filename.count > 0) and
				(stylesheet_filename /= Void and then stylesheet_filename.count > 0)
		ensure then
			input_filename_not_void: Result implies input_filename /= Void
			input_filename_not_empty: Result implies input_filename.count > 0
			output_filename_not_void: Result implies output_filename /= Void
			output_filename_not_empty: Result implies output_filename.count > 0
			stylesheet_filename_not_void: Result implies stylesheet_filename /= Void
			stylesheet_filename_not_empty: Result implies stylesheet_filename.count > 0
		end

feature -- Access

	input_filename: STRING
			-- Input XML filename

	output_filename: STRING
			-- Output filename

	stylesheet_filename: STRING
			-- XSL filename

	parameters: DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]]
			-- Defined values from the commandline (-D options)

	processor: INTEGER
			-- Identifier for used XSLT processor

	format: STRING
			-- Format for output

	indent: STRING
			-- Number of spaces for output indentation

	extdirs: STRING
			-- semicolon separated list of directories for extensions (java processors only)

	classpath: STRING
			-- classpath for java processors

	force: BOOLEAN
			-- Should xsl transformation be invoked even if it would
			-- not be necessary since the outputfile is newer
			-- than both the input and the xsl file?

feature -- Setting

	set_input_filename (a_filename: like input_filename) is
			-- Set `input_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			input_filename := a_filename
		ensure
			input_filename_set: input_filename = a_filename
		end

	set_output_filename (a_filename: like output_filename) is
			-- Set `output_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

	set_stylesheet_filename (a_filename: like stylesheet_filename) is
			-- Set `stylesheet_filename' to `a_filename'.
		require
			a_filename_not_void : a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		do
			stylesheet_filename := a_filename
		ensure
			stylesheet_filename_set: stylesheet_filename = a_filename
		end

	set_processor_xalan_java is
			-- Set `processor' to `Processor_xalan_java'
		do
			set_processor (Processor_xalan_java)
		ensure
			processor_set_to_xalan_java: processor = Processor_xalan_java
		end

	set_processor_xalan_cpp is
			-- Set `processor' to `Processor_xalan_cpp'
		do
			set_processor (Processor_xalan_cpp)
		ensure
			processor_set_to_xalan_cpp: processor = Processor_xalan_cpp
		end

	set_processor_xsltproc is
			-- Set `processor' to `Processor_xsltproc'
		do
			set_processor (Processor_xsltproc)
		ensure
			processor_set_to_xsltproc: processor = Processor_xsltproc
		end

	set_processor_gexslt is
			-- Set `processor' to `Processor_gexslt'
		do
			set_processor (Processor_gexslt)
		ensure
			processor_set_to_gexslt: processor = Processor_gexslt
		end

	set_format (a_format: like format) is
			-- Set `format' to `a_format'.
		require
			a_format_not_void : a_format /= Void
			a_format_not_empty: a_format.count > 0
		do
			format := a_format
		ensure
			format_set: format = a_format
		end

	set_indent (a_indent: STRING) is
			-- Set `indent' to `a_indent'.
		require
			a_indent_not_void : a_indent /= Void
			a_indent_not_empty: a_indent.count > 0
			a_indent_is_integer: a_indent.is_integer
		do
			indent := a_indent
		ensure
			indent_set: indent = a_indent
		end

	set_extdirs (a_extdirs: like extdirs) is
			-- Set `extdirs' to `a_extdirs'.
		require
			a_extdirs_not_void : a_extdirs /= Void
			a_extdirs_not_empty: a_extdirs.count > 0
		do
			extdirs := a_extdirs
		ensure
			extdirs_set: extdirs = a_extdirs
		end

	set_classpath (a_classpath: like classpath) is
			-- Set `classpath' to `a_classpath'.
		require
			a_classpath_not_void : a_classpath /= Void
			a_classpath_not_empty: a_classpath.count > 0
		do
			classpath := a_classpath
		ensure
			classpath_set: classpath = a_classpath
		end

	set_force (b: BOOLEAN) is
			-- Set `force' to `b'.
		do
			force := b
		ensure
			force_set: force = b
		end

feature -- Setting / Implementation

	set_processor (a_processor: INTEGER) is
			-- Set `processor' to `a_processor'.
		require
			a_processor_valid : a_processor = Processor_xalan_cpp or a_processor = Processor_xalan_java or a_processor = Processor_xsltproc or a_processor = Processor_gexslt
		do
			processor := a_processor
		ensure
			processor_set: processor = a_processor
		end

feature -- Execution

	execute is
			-- Execute command.
		local
			a_input_filename: STRING
			a_stylesheet_filename: STRING
			a_output_filename: STRING
			a_execute: BOOLEAN
			a_variables: GEANT_VARIABLES
		do
			a_input_filename := file_system.pathname_from_file_system (input_filename, unix_file_system)
			a_stylesheet_filename := file_system.pathname_from_file_system (stylesheet_filename, unix_file_system)
			a_output_filename := file_system.pathname_from_file_system (output_filename, unix_file_system)
			create a_variables.make
			a_variables.put (a_output_filename, "output_filename")
			a_variables.put (a_stylesheet_filename, "stylesheet_filename")
			a_variables.put (a_input_filename, "input_filename")
			a_variables.put (indent, "indent")

			a_execute := force
			if not a_execute then
				a_execute := is_file_outofdate (a_input_filename, a_output_filename)
				a_execute := a_execute or else is_file_outofdate (a_stylesheet_filename, a_output_filename)
				if not a_execute then
					project.trace_debug (<<"  [*xslt] not necessary to transform '",
						a_input_filename, "' + '", a_stylesheet_filename, "' to '", a_output_filename, "'">>)
				end
			end
			if a_execute then
				if processor = Processor_xalan_cpp then
					execute_xalan_cpp (a_variables)
				elseif processor = Processor_xalan_java then
					execute_xalan_java (a_variables)
				elseif processor = Processor_xsltproc then
					execute_xsltproc (a_variables)
				elseif processor = Processor_gexslt then
					execute_gexslt (a_variables)
				else
					project.log (<<"  [xslt]: unknown processor">>)
					exit_code := 1
				end
			end
		end

	execute_xalan_cpp (a_variables: GEANT_VARIABLES) is
			-- Execute command using xalan C++ processor.
		local
			cmd: STRING
			i, nb: INTEGER
			si: GEANT_STRING_INTERPRETER
			vr: GEANT_VARIABLES_VARIABLE_RESOLVER
			template: STRING
		do
			create si.make
			create vr.make
			si.set_variable_resolver (vr)
			vr.set_variables (a_variables)

			create template.make (128)

			template.append_string ("Xalan -i ${indent} -o ${output_filename}")

				-- Add parameters:
			nb := parameters.count
			from i := 1 until i > nb loop
				template.append_string (" -p ")
				template := STRING_.appended_string (template, parameters.item (i).first)
				template.append_string (" ")
				template := STRING_.appended_string (template, parameters.item (i).second)
				i := i + 1
			end

			template.append_string (" ${input_filename} ${stylesheet_filename}")
			cmd := si.interpreted_string (template)

			project.trace (<<"  [xslt] ", cmd>>)
			execute_shell (cmd)
		end

	execute_xalan_java (a_variables: GEANT_VARIABLES) is
			-- Execute command using xalan java processor.
		local
			cmd: STRING
			i, nb: INTEGER
			si: GEANT_STRING_INTERPRETER
			vr: GEANT_VARIABLES_VARIABLE_RESOLVER
			template: STRING
		do
			create si.make
			create vr.make
			si.set_variable_resolver (vr)
			vr.set_variables (a_variables)

			create template.make (128)

			template.append_string ("java")
			if extdirs /= Void and then extdirs.count > 0 then
				template.append_string (" -Djava.ext.dirs=")
				template := STRING_.appended_string (template, extdirs)
			end

			if classpath /= Void and then classpath.count > 0 then
				template.append_string (" -classpath=")
				template := STRING_.appended_string (template, classpath)
			end
			template.append_string (" org.apache.xalan.xslt.Process -in ${input_filename} -xsl ${stylesheet_filename} -out ${output_filename} -INDENT ${indent}")

			if format /= Void and then format.count > 0 then
				template.append_string (" -")
				template := STRING_.appended_string (template, format)
			end

				-- Add parameters:
			nb := parameters.count
			from i := 1 until i > nb loop
				template.append_string (" -PARAM ")
				template := STRING_.appended_string (template, parameters.item (i).first)
				template.append_string (" ")
				template := STRING_.appended_string (template, parameters.item (i).second)
				i := i + 1
			end
			cmd := si.interpreted_string (template)
			project.trace (<<"  [xslt] ", cmd>>)
			execute_shell (cmd)
		end

	execute_xsltproc (a_variables: GEANT_VARIABLES) is
			-- Execute command using libxslt processor.
		local
			cmd: STRING
			i, nb: INTEGER
			si: GEANT_STRING_INTERPRETER
			vr: GEANT_VARIABLES_VARIABLE_RESOLVER
			template: STRING
		do
			create si.make
			create vr.make
			si.set_variable_resolver (vr)
			vr.set_variables (a_variables)

			create template.make (128)
			template.append_string ("xsltproc -o ${output_filename}")

				-- Add parameters:
			nb := parameters.count
			from i := 1 until i > nb loop
				template.append_string (" -param ")
				template := STRING_.appended_string (template, parameters.item (i).first)
				template.append_string (" ")
				template := STRING_.appended_string (template, parameters.item (i).second)
				i := i + 1
			end

			template.append_string (" ${stylesheet_filename} ${input_filename}")
			cmd := si.interpreted_string (template)

			project.trace (<<"  [xslt] ", cmd>>)
			execute_shell (cmd)
		end


	execute_gexslt (a_variables: GEANT_VARIABLES) is
			-- Execute command using Gobo Eiffel xslt processor.
		local
			cmd: STRING
			template: STRING
			i, nb: INTEGER
			si: GEANT_STRING_INTERPRETER
			vr: GEANT_VARIABLES_VARIABLE_RESOLVER
		do
			create si.make
			create vr.make
			si.set_variable_resolver (vr)
			vr.set_variables (a_variables)

			create template.make (128)
			template.append_string ("gexslt --output=${output_filename}")

				-- Add parameters:
			nb := parameters.count
			from i := 1 until i > nb loop
				template.append_string (" --param=")
				template := STRING_.appended_string (template, parameters.item (i).first)
				template.append_string ("=")
				template := STRING_.appended_string (template, parameters.item (i).second)
				i := i + 1
			end

			template.append_string (" --file=${stylesheet_filename} --file=${input_filename}")
			cmd := si.interpreted_string (template)

			project.trace (<<"  [xslt] ", cmd>>)
			execute_shell (cmd)
		end

feature -- Constants

	Processor_xalan_cpp: INTEGER is 1
			-- Identifier for Xalan C++ processor

	Processor_xalan_java: INTEGER is 2
			-- Identifier for Xalan Java processor

	Processor_xsltproc: INTEGER is 3
			-- Identifier for libxslt processor

	Processor_gexslt: INTEGER is 4
			-- Identifier for Gobo Eiffel xslt processor

end
