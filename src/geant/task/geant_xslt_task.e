indexing

	description:

		"XSLT tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_XSLT_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: GEANT_XML_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_name: STRING
			a_value: STRING
			parameter_elements: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			parameter_element: GEANT_DEFINE_ELEMENT
			i, nb: INTEGER
			a_pair: DS_PAIR [STRING, STRING]
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
			if has_uc_attribute (Input_filename_attribute_name) then
				a_value := uc_attribute_value (Input_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_input_filename (a_value)
				end
			end
			if has_uc_attribute (Output_filename_attribute_name) then
				a_value := uc_attribute_value (Output_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
			if has_uc_attribute (Stylesheet_filename_attribute_name) then
				a_value := uc_attribute_value (Stylesheet_filename_attribute_name).out
				if a_value.count > 0 then
					command.set_stylesheet_filename (a_value)
				end
			end
			if has_uc_attribute (Processor_attribute_name) then
				a_value := uc_attribute_value (Processor_attribute_name).out
				if a_value.is_equal (Processor_attribute_value_xalan_cpp.out) then
					command.set_processor_xalan_cpp
				elseif a_value.is_equal (Processor_attribute_value_xalan_java.out) then
					command.set_processor_xalan_java
				end
			end
			if has_uc_attribute (Format_attribute_name) then
				a_value := uc_attribute_value (Format_attribute_name).out
				if a_value.count > 0 then
					command.set_format (a_value)
				end
			end

			if has_uc_attribute (Indent_attribute_name) then
				a_value := uc_attribute_value (Indent_attribute_name).out
				if STRING_.is_integer (a_value) then
					command.set_indent (a_value)
				end
			end

			if has_uc_attribute (Extdirs_attribute_name) then
				a_value := uc_attribute_value (Extdirs_attribute_name).out
				if a_value.count > 0 then
					command.set_extdirs (a_value)
				end
			end

			if has_uc_attribute (Classpath_attribute_name) then
				a_value := uc_attribute_value (Classpath_attribute_name).out
				if a_value.count > 0 then
					command.set_classpath (a_value)
				end
			end

			parameter_elements := xml_element.children_by_name (Parameter_element_name)
			nb := parameter_elements.count
			from i := 1 until i > nb loop
				!! parameter_element.make (project, parameter_elements.item (i))
				if parameter_element.is_enabled and then
					parameter_element.has_name and then parameter_element.has_value
				then
					a_name:= parameter_element.name
					a_value := parameter_element.value
					!! a_pair.make (a_name, a_value)
					command.parameters.force_last (a_pair)
				end
				i := i + 1
			end
		end

feature -- Access

	command: GEANT_XSLT_COMMAND
			-- XSLT commands

feature {NONE} -- Constants

	Input_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for input_filename
		once
			Result := new_unicode_string ("input")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Output_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for output_filename
		once
			Result := new_unicode_string ("output")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Stylesheet_filename_attribute_name: UC_STRING is
			-- Name of xml attribute for stylesheet_filename
		once
			Result := new_unicode_string ("stylesheet")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Processor_attribute_name: UC_STRING is
			-- Name of xml attribute for processor
		once
			Result := new_unicode_string ("processor")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Processor_attribute_value_xalan_cpp: UC_STRING is
			-- value of xml attribute for processor
		once
			Result := new_unicode_string ("xalan_cpp")
		ensure
			attribute_value_not_void: Result /= Void
			atribute_value_not_empty: Result.count > 0
		end

	Processor_attribute_value_xalan_java: UC_STRING is
			-- value of xml attribute for processor
		once
			Result := new_unicode_string ("xalan_java")
		ensure
			attribute_value_not_void: Result /= Void
			atribute_value_not_empty: Result.count > 0
		end

	Format_attribute_name: UC_STRING is
			-- Name of xml attribute for format
		once
			Result := new_unicode_string ("format")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Indent_attribute_name: UC_STRING is
			-- Name of xml attribute for indent
		once
			Result := new_unicode_string ("indent")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Extdirs_attribute_name: UC_STRING is
			-- Name of xml attribute for extdirs
		once
			Result := new_unicode_string ("extdirs")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Classpath_attribute_name: UC_STRING is
			-- Name of xml attribute for classpath
		once
			Result := new_unicode_string ("classpath")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Parameter_element_name: UC_STRING is
			-- Name of xml subelement for parameter
		once
			Result := new_unicode_string ("parameter")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name: UC_STRING is
			-- Name of xml attribute for value
		once
			Result := new_unicode_string ("value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end -- class GEANT_XSLT_TASK
