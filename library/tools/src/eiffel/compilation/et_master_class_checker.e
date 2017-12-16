note

	description:
	"[
		Eiffel master class checkers.
		Look for invalid class name clashes and invalid class overriding.
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_MASTER_CLASS_CHECKER

inherit

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_master_class
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new master class checker.
		require
			a_system_processor_not_void: a_system_processor /= Void
		do
			create current_class.make (tokens.unknown_class_name, tokens.unknown_system)
			system_processor := a_system_processor
		ensure
			system_processor_set: system_processor = a_system_processor
		end

feature -- Validity checking

	check_master_class_validity (a_class: ET_MASTER_CLASS)
			-- Check validity of `a_class'.
			-- In particular, look for class name clashes.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
		local
			l_old_class: ET_MASTER_CLASS
		do
			reset_fatal_error (False)
			l_old_class := current_class
			current_class := a_class
			check_intrinsic_classes_validity
			check_overriding_classes_validity
			current_class := l_old_class
		end

feature {NONE} -- Validity checking

	check_intrinsic_classes_validity
			-- Check validity of intrinsic classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_override_class: detachable ET_CLASS
			l_non_override_class: detachable ET_CLASS
			l_imported_classes: DS_ARRAYED_LIST [ET_MASTER_CLASS]
			i, nb: INTEGER
		do
			l_override_class := current_class.first_local_override_class
			if l_override_class /= Void then
				l_classes := current_class.other_local_override_classes
				nb := l_classes.count
				from i := 1 until i > nb loop
						-- Error: Two classes with the same name in two override groups.
					set_fatal_error
					error_handler.report_vscn0a_error (current_universe, current_class, l_classes.item (i), l_override_class)
					i := i + 1
				end
			end
			l_non_override_class := current_class.first_local_non_override_class
			if l_non_override_class /= Void then
				if l_override_class /= Void then
					check_overridden_class_validity (l_non_override_class, l_override_class)
				end
				l_classes := current_class.other_local_non_override_classes
				nb := l_classes.count
				from i := 1 until i > nb loop
					if l_override_class /= Void then
						check_overridden_class_validity (l_classes.item (i), l_override_class)
					end
						-- Error: Two classes with the same name in two non-override groups.
					set_fatal_error
					error_handler.report_vscn0a_error (current_universe, current_class, l_classes.item (i), l_non_override_class)
					i := i + 1
				end
			end
			if attached current_class.first_imported_class as l_imported_class then
				if l_override_class /= Void then
					check_overridden_class_validity (l_imported_class, l_override_class)
				end
				if l_non_override_class /= Void then
						-- Error: Two classes with the same name in two non-override groups.
					set_fatal_error
					error_handler.report_vscn0a_error (current_universe, current_class, l_imported_class, l_non_override_class)
				end
				l_imported_classes := current_class.other_imported_classes
				nb := l_imported_classes.count
				from i := 1 until i > nb loop
					if l_override_class /= Void then
						check_overridden_class_validity (l_imported_classes.item (i), l_override_class)
					end
						-- Error: Two classes with the same name in two non-override groups.
					set_fatal_error
					error_handler.report_vscn0a_error (current_universe, current_class, l_imported_classes.item (i), l_imported_class)
					i := i + 1
				end
			end
		end

	check_overridden_class_validity (a_overridden_class: ET_NAMED_CLASS; a_override_class: ET_CLASS)
			-- Check validity when `a_overridden_class' is overridden by `a_override_class'.
		require
			a_overridden_class_not_void: a_overridden_class /= Void
			a_override_class_not_void: a_override_class /= Void
		local
			l_actual_class: ET_CLASS
		do
			l_actual_class := a_overridden_class.actual_intrinsic_class
			if l_actual_class.is_none then
					-- Error: cannot override built-in class "NONE".
				set_fatal_error
				error_handler.report_vscn0b_error (current_universe, current_class, a_override_class)
			elseif l_actual_class.is_in_dotnet_assembly then
					-- Error: cannot override .NET assembly classes.
				set_fatal_error
				error_handler.report_vscn0c_error (current_universe, current_class, a_overridden_class, a_override_class)
			end
		end

	check_overriding_classes_validity
			-- Check validity of overriding classes.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_other_overriding_classes: DS_ARRAYED_LIST [ET_MASTER_CLASS]
			i, nb: INTEGER
		do
			l_other_overriding_classes := current_class.other_overriding_classes
			if not l_other_overriding_classes.is_empty and then attached current_class.first_overriding_class as l_overriding_class then
				nb := l_other_overriding_classes.count
				from i := 1 until i > nb loop
						-- Error: a class cannot be overridden by more than one class.
					set_fatal_error
					error_handler.report_vscn0d_error (current_universe, current_class, l_overriding_class, l_other_overriding_classes.item (i))
					i := i + 1
				end
			end
		end

feature -- Access

	current_class: ET_MASTER_CLASS
			-- Class being processed

	current_universe: ET_UNIVERSE
			-- Universe to which `current_class' belongs
		do
			Result := current_class.universe
		ensure
			current_universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
		do
			Result := current_universe.current_system
		ensure
			current_system_not_void: Result /= Void
		end

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

	set_fatal_error
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

	reset_fatal_error (b: BOOLEAN)
			-- Set `has_fatal_error' to `b'.
		do
			has_fatal_error := b
		ensure
			fatal_error_set: has_fatal_error = b
		end

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := system_processor.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature {ET_MASTER_CLASS} -- Processing

	process_master_class (a_class: ET_MASTER_CLASS)
			-- Process `a_class'.
		do
			check_master_class_validity (a_class)
		end

invariant

	current_class_not_void: current_class /= Void
	system_processor_not_void: system_processor /= Void

end
