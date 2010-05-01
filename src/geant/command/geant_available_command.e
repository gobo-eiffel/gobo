note

	description:

		"Available commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_AVAILABLE_COMMAND

inherit

	GEANT_FILESYSTEM_COMMAND
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Initialize command.
		do
			Precursor (a_project)

				-- Create properties:
			create resource_name.make
			create variable_name.make
			create true_value.make
			create false_value.make

				-- Set default agents:
			create available_agent_cell.make (agent is_resource_existing)
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed on sourcefile `resource_name'?
		local
			a_is_valid: DS_CELL [BOOLEAN]
		do
			create a_is_valid.make (True)
 			validate_condition (resource_name.is_defined, "  [available] error: 'resource' is not defined", a_is_valid)
  			validate_condition (a_is_valid.item and then not resource_name.value.is_empty, "  [available] error: 'resource' is empty", a_is_valid)
 			validate_condition (a_is_valid.item and then variable_name.is_defined, "  [available] error: 'variable' is not defined", a_is_valid)
  			validate_condition (a_is_valid.item and then not variable_name.value.is_empty, "  [available] error: 'variable' is empty", a_is_valid)
			Result := a_is_valid.item
		ensure then
 			resource_name_defined: Result implies resource_name.is_defined
 			resource_name_not_empty: Result implies not resource_name.value.is_empty
 			variable_name_defined: Result implies variable_name.is_defined
 			variable_name_not_empty: Result implies not variable_name.value.is_empty
		end

feature -- Access

	resource_name: GEANT_STRING_PROPERTY
			-- Name of resource

	variable_name: GEANT_STRING_PROPERTY
			-- Name of variable to set

	true_value: GEANT_STRING_PROPERTY
			-- Value to be set for variable named `variable_name'
			-- in case `available_agent_cell' evaluates to `True'

	false_value: GEANT_STRING_PROPERTY
			-- Value to be set for variable named `variable_name'
			-- in case `available_agent_cell' evaluates to `False'

	available_agent_cell: DS_CELL [FUNCTION [ANY, TUPLE [STRING], BOOLEAN]]
			-- Available agent cell

feature -- Execution

	execute is
			-- Execute command.
		local
			a_exists: BOOLEAN
			a_variable_name: STRING
			a_true_value: STRING
			a_false_value: STRING
		do
			a_exists := available_agent_cell.item.item ([resource_name.value])
			a_variable_name := variable_name.value
			a_true_value := true_value.non_empty_value_or_else ("true")
			a_false_value := false_value.non_empty_value_or_else ("false")
			if a_exists then
				project.set_variable_value (variable_name.value, a_true_value)
			else
				project.set_variable_value (variable_name.value, a_false_value)
			end
		end

feature {NONE} -- Implementation

	is_resource_existing (a_resource_name: STRING): BOOLEAN is
			-- Is resource named `a_resource_name' existing?
		require
			a_resource_name_not_void: a_resource_name /= Void
		local
			a_name: STRING
		do
			a_name := file_system.pathname_from_file_system (a_resource_name, unix_file_system)
			Result := file_system.file_exists (a_name) or else file_system.directory_exists (a_name)
		end

invariant

	resource_name_not_void: resource_name /= Void
	variable_name_not_void: variable_name /= Void
	true_value_not_void: true_value /= Void
	false_value_not_void: false_value /= Void

	available_agent_cell_not_void: available_agent_cell /= Void
	available_agent_cell_item_not_void: available_agent_cell.item /= Void

end
