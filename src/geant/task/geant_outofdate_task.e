indexing

	description:

		"Out of date tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_OUTOFDATE_TASK

inherit

	GEANT_SHARED_PROPERTIES
	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: GEANT_XML_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			i: INTEGER
			ucs: UC_STRING
			a_source_filenames: DS_ARRAYED_LIST [UC_STRING]
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
			if has_uc_attribute (Source_attribute_name) then
				ucs := uc_attribute_value (Source_attribute_name)
				a_source_filenames := string_tokens (ucs, ',')
				from i := 1 until i > a_source_filenames.count loop
					a_value := a_source_filenames.item (i).out
					if a_value.count > 0 then
						command.source_filenames.force_last (a_value)
					end

					i := i + 1
				end

			end
			if has_uc_attribute (Target_attribute_name) then
				a_value := uc_attribute_value (Target_attribute_name).out
				if a_value.count > 0 then
					command.set_target_filename (a_value)
				end
			end
			command.set_true_value ("true")
			if has_uc_attribute (True_value_attribute_name) then
				a_value := uc_attribute_value (True_value_attribute_name).out
				if a_value.count > 0 then
					command.set_true_value (a_value)
				end
			end

			command.set_false_value ("false")
			if has_uc_attribute (False_value_attribute_name) then
				a_value := uc_attribute_value (False_value_attribute_name).out
				if a_value.count > 0 then
					command.set_false_value (a_value)
				end
			end

			if has_uc_attribute (Variable_attribute_name) then
				a_value := uc_attribute_value (Variable_attribute_name).out
				if a_value.count > 0 then
					command.set_variable_name (a_value)
				end
			end
		end

feature -- Access

	command: GEANT_OUTOFDATE_COMMAND
			-- Out of date commands

feature {NONE} -- Constants

	Source_attribute_name: UC_STRING is
			-- Name of xml attribute for source
		once
			!! Result.make_from_string ("source")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Target_attribute_name: UC_STRING is
			-- Name of xml attribute for target
		once
			!! Result.make_from_string ("target")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Variable_attribute_name: UC_STRING is
			-- Name of xml attribute for variable
		once
			!! Result.make_from_string ("variable")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	True_value_attribute_name: UC_STRING is
			-- Name of xml attribute for true_value
		once
			!! Result.make_from_string ("true_value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	False_value_attribute_name: UC_STRING is
			-- Name of xml attribute for false_value
		once
			!! Result.make_from_string ("false_value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_OUTOFDATE_TASK

