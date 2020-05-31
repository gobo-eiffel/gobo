note

	description:

		"Gobo Eiffel Documentation Format: list of implicit conversions"

	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_IMPLICIT_CONVERTS_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			make,
			prepare_system,
			set_ast_factory
		end

create

	make

create {GEDOC_IMPLICIT_CONVERTS_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- <Precursor>
		do
			create explicit_convert_expression_finder.make
			create explicit_convert_expressions.make (250)
			precursor (a_input_filename, a_system_processor)
		end

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
			l_ast_factory: ET_DECORATED_AST_FACTORY
		do
			create l_ast_factory.make
			set_explicit_convert_class_names (l_ast_factory)
			system_processor.set_ast_factory (l_ast_factory)
		end

	set_explicit_convert_class_names (a_ast_factory: ET_DECORATED_AST_FACTORY)
			-- Set 'explicit_convert_class_names' in `a_ast_factory'.
		require
			a_ast_factory_not_void: a_ast_factory /= Void
		local
			l_conversions: DS_ARRAYED_LIST [TUPLE [detachable LX_DFA_WILDCARD, detachable LX_DFA_WILDCARD]]
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_pattern: STRING
			l_from_wildcard: LX_DFA_WILDCARD
			l_to_wildcard: LX_DFA_WILDCARD
		do
			create l_conversions.make_default
			if attached override_variables as l_override_variables then
				if attached l_override_variables.primary_value ("convert") as l_convert then
					create l_regexp.make
					l_regexp.compile ("(([^-]|-[^>])*)->(.*)")
					if l_regexp.recognizes (l_convert) then
						l_pattern := l_regexp.captured_substring (1)
						l_pattern.left_adjust
						l_pattern.right_adjust
						create l_from_wildcard.compile_case_insensitive (l_pattern)
						if not l_from_wildcard.is_compiled then
							report_invalid_class_wildcard_error (l_pattern)
						end
						l_pattern := l_regexp.captured_substring (3)
						l_pattern.left_adjust
						l_pattern.right_adjust
						create l_to_wildcard.compile_case_insensitive (l_pattern)
						if not l_to_wildcard.is_compiled then
							report_invalid_class_wildcard_error (l_pattern)
						end
						l_conversions.force_last ([l_from_wildcard, l_to_wildcard])
					end
				end
			end
			a_ast_factory.set_explicit_convert_class_names (l_conversions)
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		local
			l_input_classes: like input_classes
			l_all_classes: like input_classes
			l_formats: DS_ARRAYED_LIST [like Current]
		do
			create l_all_classes.make (a_system.class_count_recursive)
			a_system.classes_do_unless_recursive (agent l_all_classes.force_last, agent {ET_CLASS}.is_none)
			l_input_classes := input_classes
			system_processor.compile_degree_5 (l_all_classes, False)
			system_processor.compile_degree_4 (l_all_classes)
			system_processor.compile_degree_3 (l_input_classes)
			create l_formats.make (system_processor.processor_count)
			system_processor.do_all (agent add_format (?, l_formats))
			l_input_classes.do_all (agent {ET_CLASS}.set_marked (False))
			system_processor.process_custom (l_input_classes)
			has_error := l_formats.there_exists (agent {like Current}.has_error)
		end

feature {GEDOC_IMPLICIT_CONVERTS_FORMAT} -- Processing

	process_implicit_converts (a_class: ET_CLASS)
			-- Process implicit conversions in `a_class' if it has not been marked yet.
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			l_expression: ET_EXPLICIT_CONVERT_EXPRESSION
			l_position: ET_POSITION
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					if a_class.is_none then
						-- Do nothing.
					else
						explicit_convert_expressions.wipe_out
						explicit_convert_expression_finder.find_explicit_convert_expressions (a_class, explicit_convert_expressions)
						nb := explicit_convert_expressions.count
						from i := 1 until i > nb loop
							l_expression := explicit_convert_expressions.item (i)
							l_position := l_expression.position
							error_handler.report_info_message ("[CONVERT] " + a_class.upper_name + " (" + l_position.line.out + "," + l_position.column.out + "): conversion from '" + l_expression.source_type.to_text + "' to '" + l_expression.target_type.to_text + "' using feature `" + l_expression.convert_feature.name.lower_name + "`.%N----")
							i := i + 1
						end
						explicit_convert_expressions.wipe_out
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
			end
		end

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
			a_system_processor.set_custom_processor (agent l_format.process_implicit_converts)
			a_formats.force_last (l_format)
		ensure
			no_void_format: not a_formats.has_void
			one_more: a_formats.count = old a_formats.count + 1
			system_processor_set: a_formats.last.system_processor = a_system_processor
		end

	explicit_convert_expression_finder: ET_EXPLICIT_CONVERT_EXPRESSION_FINDER
			-- Used to find convert expressions

	explicit_convert_expressions: DS_ARRAYED_LIST [ET_EXPLICIT_CONVERT_EXPRESSION]
			-- Convert expressions found by `explicit_convert_expression_finder'

feature {NONE} -- Error handling

	report_invalid_class_wildcard_error (a_wildcard: STRING)
			-- Report that the wildcard specified for conversion is invalid.
		require
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Invalid wildcard '" + a_wildcard + "' in variable 'convert'.")
			report_error (l_error)
		end

invariant

	explicit_convert_expression_finder_not_void: explicit_convert_expression_finder /= Void
	explicit_convert_expressions_not_void: explicit_convert_expressions /= Void
	no_void_explicit_convert_expression: not explicit_convert_expressions.has_void

end
