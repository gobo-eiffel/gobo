note

	description:

		"Gobo Eiffel Documentation Format: list of descendant classes"

	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_DESCENDANTS_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			make,
			set_ast_factory
		end

	ET_SHARED_CLASS_COMPARATOR_BY_NAME
		export {NONE} all end

create

	make

create {GEDOC_DESCENDANTS_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- <Precursor>
		do
			create descendant_classes.make (100)
			precursor (a_input_filename, a_system_processor)
		end

feature {NONE} -- Processing

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
		local
			l_all_classes: like input_classes
			l_formats: DS_ARRAYED_LIST [like Current]
			l_sorter: DS_QUICK_SORTER [ET_CLASS]
		do
			if not input_classes.is_empty then
				create l_all_classes.make (a_system.class_count_recursive)
				a_system.classes_do_unless_recursive (agent l_all_classes.force_last, agent {ET_CLASS}.is_none)
				system_processor.compile_degree_5 (l_all_classes, False)
				system_processor.compile_degree_4 (l_all_classes)
				create l_formats.make (system_processor.processor_count)
				system_processor.do_all (agent add_format (?, l_formats))
				l_all_classes.do_all (agent {ET_CLASS}.set_marked (False))
				system_processor.process_custom (l_all_classes)
				across l_formats as i_format loop
					if i_format /= Current then
						descendant_classes.append_last (i_format.descendant_classes)
					end
				end
				create l_sorter.make (class_comparator_by_name)
				descendant_classes.sort (l_sorter)
				across descendant_classes as i_class loop
					error_handler.report_info_message (i_class.upper_name)
				end
				has_error := l_formats.there_exists (agent {like Current}.has_error)
			end
		end

feature {GEDOC_DESCENDANTS_FORMAT} -- Processing

	process_ancestors (a_class: ET_CLASS)
			-- Process ancestors of `a_class' if it has not been marked yet.
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			l_input_classes: like input_classes
			l_is_descendant: BOOLEAN
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					if a_class.is_none then
						-- Do nothing.
					else
						l_is_descendant := True
						l_input_classes := input_classes
						nb := l_input_classes.count
						from i := 1 until i > nb loop
							if not a_class.conforming_ancestors.has_class (l_input_classes.item (i)) then
								l_is_descendant := False
									-- Jump out of the loop.
								i := nb + 1
							end
							i := i + 1
						end
						if l_is_descendant then
							descendant_classes.force_last (a_class)
						end
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
			end
		end

	descendant_classes: DS_ARRAYED_LIST [ET_CLASS]
			-- List of descendant classes found so far

feature {NONE} -- Implementation

	add_format (a_system_processor: ET_SYSTEM_PROCESSOR; a_formats: DS_ARRAYED_LIST [like Current])
			-- Add format associated with `a_system_processor' to `a_formats'.
		require
			a_system_processor_not_void: a_system_processor /= Void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
		local
			l_format: like Current
		do
			if a_system_processor = system_processor then
				l_format := Current
			else
				create l_format.make_from_format (Current, a_system_processor)
			end
			a_system_processor.set_custom_processor (agent l_format.process_ancestors)
			a_formats.force_last (l_format)
		ensure
			no_void_format: not a_formats.has_void
			one_more: a_formats.count = old a_formats.count + 1
			system_processor_set: a_formats.last.system_processor = a_system_processor
		end

invariant

	descendant_classes_not_void: descendant_classes /= Void
	no_void_descendant_class: not descendant_classes.has_void

end
