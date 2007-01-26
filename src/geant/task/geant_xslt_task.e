indexing

	description:

		"XSLT tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_XSLT_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_name: STRING
			a_value: STRING
			parameter_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			parameter_element: GEANT_DEFINE_ELEMENT
			a_pair: DS_PAIR [STRING, STRING]
			a_is_xalan_cpp_processor: BOOLEAN
			a_is_xalan_java_processor: BOOLEAN
			a_is_xsltproc_processor: BOOLEAN
			a_is_gexslt_processor: BOOLEAN
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
			if has_attribute (Processor_attribute_name) then
				a_value := attribute_value (Processor_attribute_name)
				if STRING_.same_string (a_value, Processor_attribute_value_xalan_cpp) then
					a_is_xalan_cpp_processor := True
					command.set_processor_xalan_cpp
				elseif STRING_.same_string (a_value, Processor_attribute_value_xalan_java) then
					a_is_xalan_java_processor := True
					command.set_processor_xalan_java
				elseif STRING_.same_string (a_value, Processor_attribute_value_xsltproc) then
					a_is_xsltproc_processor := True
					command.set_processor_xsltproc
				elseif STRING_.same_string (a_value, Processor_attribute_value_gexslt) then
					a_is_gexslt_processor := True
					command.set_processor_gexslt
				end
			end

			debug ("geant xslt task")
				std.error.put_string ("XSLT processor is ")
				std.error.put_string (command.processor.out)
				std.error.put_new_line
			end

				-- Handle common attributes:
			if has_attribute (Input_filename_attribute_name) then
				a_value := attribute_value (Input_filename_attribute_name)
				if a_value.count > 0 then
					command.set_input_filename (a_value)
				end
			end
			if has_attribute (Output_filename_attribute_name) then
				a_value := attribute_value (Output_filename_attribute_name)
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
			if has_attribute (Stylesheet_filename_attribute_name) then
				a_value := attribute_value (Stylesheet_filename_attribute_name)
				if a_value.count > 0 then
					command.set_stylesheet_filename (a_value)
				end
			end
			if has_attribute (Force_attribute_name) then
				command.set_force (boolean_value (Force_attribute_name))
			end
			if a_is_xalan_java_processor or a_is_xalan_cpp_processor then
				-- TODO: add support for gexslt when it supports this
				if has_attribute (Indent_attribute_name) then
					a_value := attribute_value (Indent_attribute_name)
					if STRING_.is_integer (a_value) then
						command.set_indent (a_value)
					end
				end
			end

			parameter_elements := elements_by_name (Parameter_element_name)
			cs := parameter_elements.new_cursor
			from cs.start until cs.after loop
				create parameter_element.make (project, cs.item)
				if
					parameter_element.is_enabled and then
					parameter_element.has_name and then
					parameter_element.has_value
				then
					a_name:= parameter_element.name
					a_value := parameter_element.value
					create a_pair.make (a_name, a_value)
					command.parameters.force_last (a_pair)
				end
				cs.forth
			end

				-- Handle attributes supported only by Xalan-J:
			if a_is_xalan_java_processor then
				if has_attribute (Format_attribute_name) then
					a_value := attribute_value (Format_attribute_name)
					if a_value.count > 0 then
						command.set_format (a_value)
					end
				end
				if has_attribute (Extdirs_attribute_name) then
					a_value := attribute_value (Extdirs_attribute_name)
					if a_value.count > 0 then
						command.set_extdirs (a_value)
					end
				end
				if has_attribute (Classpath_attribute_name) then
					a_value := attribute_value (Classpath_attribute_name)
					if a_value.count > 0 then
						command.set_classpath (a_value)
					end
				end
			end

		end

feature -- Access

	command: GEANT_XSLT_COMMAND
			-- XSLT commands

feature {NONE} -- Constants

	Input_filename_attribute_name: STRING is
			-- Name of xml attribute for input_filename
		once
			Result := "input"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Output_filename_attribute_name: STRING is
			-- Name of xml attribute for output_filename
		once
			Result := "output"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Stylesheet_filename_attribute_name: STRING is
			-- Name of xml attribute for stylesheet_filename
		once
			Result := "stylesheet"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Force_attribute_name: STRING is
			-- Name of xml attribute for force
		once
			Result := "force"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Processor_attribute_name: STRING is
			-- Name of xml attribute for processor
		once
			Result := "processor"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Processor_attribute_value_xalan_cpp: STRING is
			-- value of xml attribute for xalan cpp processor
		once
			Result := "xalan_cpp"
		ensure
			attribute_value_not_void: Result /= Void
			atribute_value_not_empty: Result.count > 0
		end

	Processor_attribute_value_xalan_java: STRING is
			-- value of xml attribute for xalan java processor
		once
			Result := "xalan_java"
		ensure
			attribute_value_not_void: Result /= Void
			atribute_value_not_empty: Result.count > 0
		end

	Processor_attribute_value_xsltproc: STRING is
			-- value of xml attribute for xsltproc processor
		once
			Result := "xsltproc"
		ensure
			attribute_value_not_void: Result /= Void
			atribute_value_not_empty: Result.count > 0
		end

	Processor_attribute_value_gexslt: STRING is
			-- value of xml attribute for gexslt processor
		once
			Result := "gexslt"
		ensure
			attribute_value_not_void: Result /= Void
			atribute_value_not_empty: Result.count > 0
		end

	Format_attribute_name: STRING is
			-- Name of xml attribute for format
		once
			Result := "format"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Indent_attribute_name: STRING is
			-- Name of xml attribute for indent
		once
			Result := "indent"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Extdirs_attribute_name: STRING is
			-- Name of xml attribute for extdirs
		once
			Result := "extdirs"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Classpath_attribute_name: STRING is
			-- Name of xml attribute for classpath
		once
			Result := "classpath"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Parameter_element_name: STRING is
			-- Name of xml subelement for parameter
		once
			Result := "parameter"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name: STRING is
			-- Name of xml attribute for value
		once
			Result := "value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
