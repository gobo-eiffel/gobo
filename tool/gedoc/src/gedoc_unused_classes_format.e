note

	description:

		"Gobo Eiffel Documentation Format: list of unused classes and delete them"

	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GEDOC_UNUSED_CLASSES_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			prepare_system,
			set_ast_factory
		end

create

	make

create {GEDOC_UNUSED_CLASSES_FORMAT}

	make_from_format

feature {NONE} -- Processing

	prepare_system (a_system: ET_SYSTEM)
			-- Prepare `a_system' before being processed.
		do
			precursor (a_system)
			system_processor.set_flat_mode (False)
			system_processor.set_flat_dbc_mode (False)
		end

	set_ast_factory
			-- Configure the AST factory as needed.
		local
			l_ast_factory: ET_AST_FACTORY
		do
			create l_ast_factory.make
			system_processor.set_ast_factory (l_ast_factory)
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		do
			mark_used_class (a_system)
			if system_processor.error_handler.has_error then
				has_error := True
			else
				delete_unused_class (input_classes)
			end
		end

	mark_used_class (a_system: ET_SYSTEM)
			-- Mark all classes in `a_system' which are not in `input_classes',
			-- the root class if any, and all classes reachable (recursively)
			-- from other marked classes.
		require
			a_system_not_void: a_system /= Void
		local
			l_input_classes: like input_classes
			l_all_classes: like input_classes
		do
			create l_all_classes.make (a_system.class_count_recursive)
			a_system.classes_do_unless_recursive (agent l_all_classes.force_last, agent {ET_CLASS}.is_none)
			l_input_classes := input_classes
			l_all_classes.do_all (agent {ET_CLASS}.set_marked (True))
			l_input_classes.do_all (agent {ET_CLASS}.set_marked (False))
			system_processor.set_root_type (a_system)
			if attached a_system.root_type as l_root_type then
				l_root_type.base_class.set_marked (True)
			end
			system_processor.compile_degree_5 (l_all_classes, True)
		end

	delete_unused_class (a_classes: like input_classes)
			-- Delete all classes in `a_classes' which have not been marked.
			-- However, if `output_directory' is not Void, then copy to that
			-- directory all classes in `a_classes' which have been marked
			-- instead.
			-- Print the list of classes which have not been marked.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_new_filename: STRING
		do
			nb := a_classes.count
			from i := 1 until i > nb loop
				l_class := a_classes.item (i)
				if not l_class.is_marked then
					error_handler.report_info_message ("Unused class " + l_class.upper_name)
					if output_directory /= Void then
						-- Do nothing.
					elseif not attached l_class.filename as l_filename then
						-- Do nothing.
					elseif not is_file_deletable (l_filename) then
						report_file_not_deleted_error (l_filename)
					else
						file_system.delete_file (l_filename)
					end
				elseif output_directory = Void then
					-- Do nothing.
				elseif not attached l_class.filename as l_old_filename then
					-- Do nothing.
				elseif not attached class_output_directory (l_class) as l_directory then
					report_no_output_directory_for_class_error (l_class)
				else
					l_new_filename := filename (l_directory, concat (class_lower_name (l_class), file_system.eiffel_extension))
					if not is_file_overwritable (l_new_filename) then
						report_file_already_exists_error (l_new_filename)
					else
						file_system.copy_file (l_old_filename, l_new_filename)
					end
				end
				i := i + 1
			end
		end

end
