indexing

	description:

		"Compilation tasks for Halstenbach Eiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_HACT_TASK

inherit

	GEANT_TASK
		redefine
			make_from_element
		end

	GEANT_HACT_COMMAND

creation

	make_from_element

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			precursor (a_project, an_element)
				-- ace:
			if has_uc_attribute (an_element, Ace_attribute_name) then
				a_value := attribute_value_or_default (an_element, Ace_attribute_name.out, "")
				if a_value.count > 0 then
					set_ace_filename (a_value)
				end
			end
				-- system:
			if has_uc_attribute (an_element, System_attribute_name) then
				a_value := attribute_value_or_default (an_element, System_attribute_name.out, "")
				if a_value.count > 0 then
					set_system_name (a_value)
				end
			end
				-- clean:
			if has_uc_attribute (an_element, Clean_attribute_name) then
				a_value := attribute_value_or_default (an_element, Clean_attribute_name.out, "")
				if a_value.count > 0 then
					set_clean (a_value)
				end
			end
				-- finalize:
			if has_uc_attribute (an_element, Finalize_attribute_name) then
				set_finalize (uc_boolean_value (an_element, Finalize_attribute_name))
			end
				-- fish:
			if has_uc_attribute (an_element, Fish_attribute_name) then
				set_fish (uc_boolean_value (an_element, Fish_attribute_name))
			end
		end

feature {NONE} -- Constants

	Ace_attribute_name: UC_STRING is
			-- Name of xml attribute for "ace"
		once
			!! Result.make_from_string ("ace")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	System_attribute_name: UC_STRING is
			-- Name of xml attribute for "system"
		once
			!! Result.make_from_string ("system")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Finalize_attribute_name: UC_STRING is
			-- Name of xml attribute for "finalize"
		once
			!! Result.make_from_string ("finalize")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Fish_attribute_name: UC_STRING is
			-- Name of xml attribute for "fish"
		once
			!! Result.make_from_string ("fish")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Clean_attribute_name: UC_STRING is
			-- Name of xml attribute for "clean"
		once
			!! Result.make_from_string ("clean")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_HACT_TASK
