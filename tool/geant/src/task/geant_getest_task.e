note

	description:

		"Getest tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2021, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GETEST_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT)
			-- Create a new task with information held in `an_element'.
		local
			a_name, a_value: STRING
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			define_element: GEANT_DEFINE_ELEMENT
			define_elements: DS_LINKED_LIST [XM_ELEMENT]
			attribute_element: GEANT_DEFINE_ELEMENT
			attribute_elements: DS_LINKED_LIST [XM_ELEMENT]
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

				-- verbose (optional):
			if has_attribute (Verbose_attribute_name) then
				command.set_verbose (boolean_value (Verbose_attribute_name))
			end
			if has_attribute (Config_filename_attribute_name) then
				a_value := attribute_value (Config_filename_attribute_name)
				if a_value.count > 0 then
					command.set_config_filename (a_value)
				end
			end
			if has_attribute (Compile_attribute_name) then
				a_value := attribute_value (Compile_attribute_name)
				command.set_compile (a_value)
			end
			if has_attribute (Class_attribute_name) then
				a_value := attribute_value (Class_attribute_name)
				command.set_class_regexp (a_value)
			end
			if has_attribute (Feature_attribute_name) then
				a_value := attribute_value (Feature_attribute_name)
				command.set_feature_regexp (a_value)
			end
			if has_attribute (Default_test_attribute_name) then
				command.set_default_test_included (boolean_value (Default_test_attribute_name))
			end
			if has_attribute (Generation_attribute_name) then
				command.set_generation (boolean_value (Generation_attribute_name))
			end
			if has_attribute (Compilation_attribute_name) then
				command.set_compilation (boolean_value (Compilation_attribute_name))
			end
			if has_attribute (Execution_attribute_name) then
				command.set_execution (boolean_value (Execution_attribute_name))
			end
			if has_attribute (Abort_attribute_name) then
				command.set_abort (boolean_value (Abort_attribute_name))
			end
			if has_attribute (Exit_code_variable_attribute_name) then
				a_value := attribute_value (Exit_code_variable_attribute_name)
				if a_value.count > 0 then
					command.set_exit_code_variable_name (a_value)
				end
			end
				-- attributes (TODO: generalize this):
			attribute_elements := elements_by_name (Attribute_element_name)
			cs := attribute_elements.new_cursor
			from cs.start until cs.after loop
				create attribute_element.make (project, cs.item)
				if
					attribute_element.is_enabled and then
					attribute_element.has_name and then
					attribute_element.has_value
				then
					a_name := attribute_element.name
					a_value := attribute_element.value
						-- Task specific attributes:
					if STRING_.same_string (a_name, Class_attribute_name) then
						command.set_class_regexp (a_value)
					elseif STRING_.same_string (a_name, Feature_attribute_name) then
						command.set_feature_regexp (a_value)
					elseif STRING_.same_string (a_name, Default_test_attribute_name) then
						if STRING_.same_string (True_attribute_value, a_value) then
							command.set_default_test_included (True)
						else
							command.set_default_test_included (False)
						end
					end
				end
				cs.forth
			end

				-- define:
			define_elements := elements_by_name (Define_element_name)
			cs := define_elements.new_cursor
			from cs.start until cs.after loop
				create define_element.make (project, cs.item)
				if
					define_element.is_enabled and then
					define_element.has_name and then
					define_element.has_value
				then
					a_name := define_element.name
					a_value := define_element.value
					if a_name.count > 0 then
						command.defines.force (a_value, a_name)
					end
				end
				cs.forth
			end
		end

	build_command (a_project: GEANT_PROJECT)
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_GETEST_COMMAND
			-- Getest commands

feature {NONE} -- Constants

	Verbose_attribute_name: STRING
			-- Name of xml attribute for 'verbose'
		once
			Result := "verbose"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Config_filename_attribute_name: STRING
			-- Name of xml attribute for getest config_filename
		once
			Result := "config"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Compile_attribute_name: STRING
			-- Name of xml attribute for getest 'compile'
		once
			Result := "compile"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Class_attribute_name: STRING
			-- Name of xml attribute for getest 'class'
		once
			Result := "class"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Feature_attribute_name: STRING
			-- Name of xml attribute for getest 'feature'
		once
			Result := "feature"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Default_test_attribute_name: STRING
			-- Name of xml attribute for getest 'default_test'
		once
			Result := "default_test"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Generation_attribute_name: STRING
			-- Name of xml attribute for getest 'generation'
		once
			Result := "generation"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Compilation_attribute_name: STRING
			-- Name of xml attribute for getest 'compilation'
		once
			Result := "compilation"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Execution_attribute_name: STRING
			-- Name of xml attribute for getest 'execution'
		once
			Result := "execution"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Exit_code_variable_attribute_name: STRING
			-- Name of xml attribute exit_code_variable.
		once
			Result := "exit_code_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Abort_attribute_name: STRING
			-- Name of xml attribute for getest 'abort'
		once
			Result := "abort"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Attribute_element_name: STRING
			-- Name of xml subelement for attributes
		once
			Result := "attribute"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Define_element_name: STRING
			-- Name of xml subelement for defines
		once
			Result := "define"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name: STRING
			-- Name of xml attribute "value" of subelement <define>
		once
			Result := "value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
