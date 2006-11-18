indexing



	description:



		"Sed tasks"



	library: "Gobo Eiffel Ant"

	copyright: "Copyright (c) 2001, Sven Ehrke and others"

	license: "Eiffel Forum License v2 (see forum.txt)"

	date: "$Date$"

	revision: "$Revision$"



class GEANT_REPLACE_TASK



inherit



	GEANT_TASK

		rename

			make as task_make

		redefine

			command

		end



create



	make



feature {NONE} -- Initialization



	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is

			-- Create a new task with information held in `an_element'.

		local

			a_value: STRING

			a_xml_subelement: XM_ELEMENT

			a_fs_element: GEANT_FILESET_ELEMENT

		do

			create command.make (a_project)

			task_make (command, a_xml_element)

			if has_attribute (File_attribute_name) then

				a_value := attribute_value (File_attribute_name)

				if a_value.count > 0 then

					command.set_file (a_value)

				end

			end

			if has_attribute (To_file_attribute_name) then

				a_value := attribute_value (To_file_attribute_name)

				if a_value.count > 0 then

					command.set_to_file (a_value)

				end

			end

			if has_attribute (To_directory_attribute_name) then

				a_value := attribute_value (To_directory_attribute_name)

				if a_value.count > 0 then

					command.set_to_directory (a_value)

				end

			end

			if has_attribute (Match_attribute_name) then

				a_value := attribute_value (Match_attribute_name)

				if a_value.count > 0 then

					command.set_match (a_value)

				end

			end

			if has_attribute (Token_attribute_name) then

				a_value := attribute_value (Token_attribute_name)

				if a_value.count > 0 then

					command.set_token (a_value)

				end

			end

			if has_attribute (Replace_attribute_name) then

				a_value := attribute_value (Replace_attribute_name)

				if a_value.count > 0 then

					command.set_replace (a_value)

				end

			end

			if has_attribute (Flags_attribute_name) then

				a_value := attribute_value (Flags_attribute_name)

				if a_value.count > 0 then

					command.set_flags (a_value)

				end

			end

			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)

			if a_xml_subelement /= Void then

				create a_fs_element.make (project, a_xml_subelement)

				command.set_fileset (a_fs_element.fileset)

			end

		end



feature -- Access



	command: GEANT_REPLACE_COMMAND

			-- Copy commands



feature {NONE} -- Constants



	File_attribute_name: STRING is

			-- Name of xml attribute file.

		once

			Result := "file"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	To_file_attribute_name: STRING is

			-- Name of xml attribute to_file.

		once

			Result := "to_file"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	To_directory_attribute_name: STRING is

			-- Name of xml attribute to_directory.

		once

			Result := "to_directory"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	Match_attribute_name: STRING is

			-- Name of xml attribute match.

		once

			Result := "match"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	Token_attribute_name: STRING is

			-- Name of xml attribute token.

		once

			Result := "token"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	Replace_attribute_name: STRING is

			-- Name of xml attribute replace.

		once

			Result := "replace"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	Flags_attribute_name: STRING is

			-- Name of xml attribute flags.

		once

			Result := "flags"

		ensure

			attribute_name_not_void: Result /= Void

			attribute_name_not_empty: Result.count > 0

		end



	Fileset_element_name: STRING is

			-- Name of xml element fileset.

		once

			Result := "fileset"

		ensure

			element_name_not_void: Result /= Void

			element_name_not_empty: Result.count > 0

		end



end

