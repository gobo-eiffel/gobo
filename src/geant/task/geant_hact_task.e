indexing

	description:

		"Compilation tasks for Halstenbach Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_HACT_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
				-- ace:
			if has_attribute (Ace_attribute_name) then
				a_value := attribute_value_or_default (Ace_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_ace_filename (a_value)
				end
			end
				-- system:
			if has_attribute (System_attribute_name) then
				a_value := attribute_value_or_default (System_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_system_name (a_value)
				end
			end
				-- clean:
			if has_attribute (Clean_attribute_name) then
				a_value := attribute_value_or_default (Clean_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
			end
				-- finalize:
			if has_attribute (Finalize_attribute_name) then
				command.set_finalize (boolean_value (Finalize_attribute_name))
			end
				-- fish:
			if has_attribute (Fish_attribute_name) then
				command.set_fish (boolean_value (Fish_attribute_name))
			end
		end

feature -- Access

	command: GEANT_HACT_COMMAND
			-- Compilation commands for Hastenbach Eiffel

feature {NONE} -- Constants

	Ace_attribute_name: STRING is
			-- Name of xml attribute for "ace"
		once
			Result := "ace"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	System_attribute_name: STRING is
			-- Name of xml attribute for "system"
		once
			Result := "system"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Finalize_attribute_name: STRING is
			-- Name of xml attribute for "finalize"
		once
			Result := "finalize"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Fish_attribute_name: STRING is
			-- Name of xml attribute for "fish"
		once
			Result := "fish"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Clean_attribute_name: STRING is
			-- Name of xml attribute for "clean"
		once
			Result := "clean"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
