note

	description:

		"Error handlers with agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_ERROR_HANDLER

inherit

	ET_ERROR_HANDLER
		redefine
			make_standard, make_null,
			report_preparsing_status,
			report_compilation_status,
			report_cluster_error,
			report_universe_error,
			report_assembly_error,
			report_system_error,
			report_syntax_error,
			report_validity_error,
			report_internal_error,
			report_error_message
		end

create

	make_standard, make_null

feature {NONE} -- Initialization

	make_standard
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and the standard output file for info messages.
		do
			Precursor
			create preparsing_status_actions
			create compilation_status_actions
			create cluster_error_actions
			create universe_error_actions
			create assembly_error_actions
			create system_error_actions
			create syntax_error_actions
			create validity_error_actions
			create internal_error_actions
			create error_message_actions
		end

	make_null
			-- Create a new error handler ignoring
			-- all error, warning and info messages.
		do
			Precursor
			create preparsing_status_actions
			create compilation_status_actions
			create cluster_error_actions
			create universe_error_actions
			create assembly_error_actions
			create system_error_actions
			create syntax_error_actions
			create validity_error_actions
			create internal_error_actions
			create error_message_actions
		end

feature -- Compilation report

	report_preparsing_status (a_group: ET_GROUP)
			-- Report that `a_group' is currently being preparsed.
		do
			mutex.lock
			preparsing_status_actions.call ([a_group])
			mutex.unlock
		end

	preparsing_status_actions: ACTION_SEQUENCE [TUPLE [ET_GROUP]]
			-- Actions to be executed when `report_preparsing_status'
			-- is called

	report_compilation_status (a_processor: ET_AST_PROCESSOR; a_class: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Report that `a_processor' is currently processing `a_class'.
		do
			mutex.lock
			compilation_status_actions.call ([a_processor, a_class])
			mutex.unlock
		end

	compilation_status_actions: ACTION_SEQUENCE [TUPLE [ET_AST_PROCESSOR, ET_CLASS]]
			-- Actions to be executed when `report_compilation_status'
			-- is called

feature -- Cluster errors

	report_cluster_error (a_error: ET_CLUSTER_ERROR)
			-- Report cluster error.
		do
			mutex.lock
			cluster_error_actions.call ([a_error])
			set_has_eiffel_error (True)
			mutex.unlock
		end

	cluster_error_actions: ACTION_SEQUENCE [TUPLE [ET_CLUSTER_ERROR]]
			-- Actions to be executed when `report_cluster_error'
			-- is called

feature -- Universe errors

	report_universe_error (a_error: ET_UNIVERSE_ERROR)
			-- Report universe error.
		do
			mutex.lock
			universe_error_actions.call ([a_error])
			set_has_eiffel_error (True)
			mutex.unlock
		end

	universe_error_actions: ACTION_SEQUENCE [TUPLE [ET_UNIVERSE_ERROR]]
			-- Actions to be executed when `report_universe_error'
			-- is called

feature -- .NET assembly errors

	report_assembly_error (a_error: ET_DOTNET_ASSEMBLY_ERROR)
			-- Report .NET assembly error.
		do
			mutex.lock
			assembly_error_actions.call ([a_error])
			set_has_eiffel_error (True)
			mutex.unlock
		end

	assembly_error_actions: ACTION_SEQUENCE [TUPLE [ET_DOTNET_ASSEMBLY_ERROR]]
			-- Actions to be executed when `report_assembly_error'
			-- is called

feature -- Syntax errors

	report_syntax_error (a_filename: STRING; p: ET_POSITION)
			-- Report a syntax error.
		local
			l_error: ET_SYNTAX_ERROR
		do
			mutex.lock
			create l_error.make (a_filename, p)
			syntax_error_actions.call ([l_error])
			set_has_eiffel_error (True)
			mutex.unlock
		end

	syntax_error_actions: ACTION_SEQUENCE [TUPLE [ET_SYNTAX_ERROR]]
			-- Actions to be executed when `report_syntax_error'
			-- is called

feature -- System errors

	report_system_error (a_error: ET_SYSTEM_ERROR)
			-- Report system error.
		do
			mutex.lock
			system_error_actions.call ([a_error])
			set_has_eiffel_error (True)
			mutex.unlock
		end

	system_error_actions: ACTION_SEQUENCE [TUPLE [ET_SYSTEM_ERROR]]
			-- Actions to be executed when `report_system_error'
			-- is called

feature -- Validity errors

	report_validity_error (a_error: ET_VALIDITY_ERROR)
			-- Report validity error.
		do
			if
				(is_ise and a_error.ise_reported) or
				(is_ge and a_error.ge_reported)
			then
				mutex.lock
				validity_error_actions.call ([a_error])
				set_has_eiffel_error (True)
				mutex.unlock
			end
		end

	validity_error_actions: ACTION_SEQUENCE [TUPLE [ET_VALIDITY_ERROR]]
			-- Actions to be executed when `report_validity_error'
			-- is called

feature -- Internal errors

	report_internal_error (a_error: ET_INTERNAL_ERROR)
			-- Report internal error.
		do
			mutex.lock
			internal_error_actions.call ([a_error])
			set_has_internal_error (True)
			mutex.unlock
		end

	internal_error_actions: ACTION_SEQUENCE [TUPLE [ET_INTERNAL_ERROR]]
			-- Actions to be executed when `report_internal_error'
			-- is called

feature -- Error messages

	report_error_message (a_error: STRING)
			-- Report `an_error'.
		do
			mutex.lock
			error_message_actions.call ([a_error])
			set_has_error (True)
			mutex.unlock
		end

	error_message_actions: ACTION_SEQUENCE [TUPLE [STRING]]
			-- Actions to be executed when `report_error_message'
			-- is called

invariant

	preparsing_status_actions_not_void: preparsing_status_actions /= Void
	compilation_status_actions_not_void: compilation_status_actions /= Void
	cluster_error_actions_not_void: cluster_error_actions /= Void
	universe_error_actions_not_void: universe_error_actions /= Void
	assembly_error_actions_not_void: assembly_error_actions /= Void
	system_error_actions_not_void: system_error_actions /= Void
	syntax_error_actions_not_void: syntax_error_actions /= Void
	validity_error_actions_not_void: validity_error_actions /= Void
	internal_error_actions_not_void: internal_error_actions /= Void
	error_message_actions_not_void: error_message_actions /= Void

end
