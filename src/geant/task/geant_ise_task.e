indexing

	description:

		"Compilation tasks for ISE Eiffel"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ISE_TASK

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
			if has_uc_attribute (Ace_attribute_name) then
				a_value := attribute_value_or_default (Ace_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_ace_filename (a_value)
				end
			end
				-- system:
			if has_uc_attribute (System_attribute_name) then
				a_value := attribute_value_or_default (System_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_system_name (a_value)
				end
			end
				-- clean:
			if has_uc_attribute (Clean_attribute_name) then
				a_value := attribute_value_or_default (Clean_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
			end
				-- finalize:
			if has_uc_attribute (Finalize_attribute_name) then
				command.set_finalize (uc_boolean_value (Finalize_attribute_name))
			end
				-- finish_freezing:
			if has_uc_attribute (Finish_freezing_attribute_name) then
				command.set_finish_freezing (uc_boolean_value (Finish_freezing_attribute_name))
			end
		end

feature -- Access

	command: GEANT_ISE_COMMAND
			-- Compilation commands for ISE Eiffel

feature {NONE} -- Constants

	Ace_attribute_name: UC_STRING is
			-- Name of xml attribute for "ace"
		once
			Result := new_unicode_string ("ace")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	System_attribute_name: UC_STRING is
			-- Name of xml attribute for "system"
		once
			Result := new_unicode_string ("system")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Finalize_attribute_name: UC_STRING is
			-- Name of xml attribute for "finalize"
		once
			Result := new_unicode_string ("finalize")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Finish_freezing_attribute_name: UC_STRING is
			-- Name of xml attribute for "finish_freezing"
		once
			Result := new_unicode_string ("finish_freezing")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Clean_attribute_name: UC_STRING is
			-- Name of xml attribute for "clean"
		once
			Result := new_unicode_string ("clean")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
