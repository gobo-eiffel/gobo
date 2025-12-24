note

	description:

		"Browsable names of classes or formal parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_NAMED_TYPE

inherit

	ET_BROWSABLE_NAME

feature -- Basic operations

	build_completion (a_builder: ET_BROWSABLE_COMPLETION_BUILDER)
			-- Build list of completion suggestions.
		local
			i, nb: INTEGER
		do
			if not is_completion_disabled then
					-- Classes avaiable from `current_class`.
				current_class.universe.master_classes_do_all (
					agent (a_master_class: ET_MASTER_CLASS; aa_builder: ET_BROWSABLE_COMPLETION_BUILDER)
						local
							l_actual_class: ET_CLASS
						do
							l_actual_class := a_master_class.actual_class
							if not l_actual_class.is_unknown then
								aa_builder.add_class (l_actual_class, Current)
							end
						end (?, a_builder))
				if not is_only_class_name_expected then
					if attached current_class.formal_parameters as l_formal_parameters then
						nb := l_formal_parameters.count
						from i := 1 until i > nb loop
							a_builder.add_formal_parameter (l_formal_parameters.formal_parameter (i), Current)
							i := i + 1
						end
					end
					a_builder.add_keyword (tokens.attached_keyword, Current)
					a_builder.add_keyword (tokens.detachable_keyword, Current)
					a_builder.add_keyword (tokens.separate_keyword, Current)
					a_builder.add_keyword (tokens.expanded_keyword, Current)
					a_builder.add_keyword (tokens.reference_keyword, Current)
					a_builder.add_keyword (tokens.like_keyword, Current)
				end
			end
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
		end

	append_feature_description_to_string (a_feature: ET_FEATURE; a_string: STRING_8)
			-- Append description of `a_feature` to `a_string'.
		do
		end

	append_tuple_label_description_to_string (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_tuple_label` to `a_string'.
		do
		end

	append_formal_agument_description_to_string (a_argument: ET_FORMAL_ARGUMENT; a_string: STRING_8)
			-- Append description of `a_argument` to `a_string'.
		do
		end

	append_local_variable_description_to_string (a_local_variable: ET_LOCAL_VARIABLE; a_string: STRING_8)
			-- Append description of `a_local_variable` to `a_string'.
		do
		end

	append_class_description_to_string (a_class: ET_CLASS; a_string: STRING_8)
			-- Append description of `a_class` to `a_string'.
		local
			l_printer: ET_AST_PRETTY_PRINTER
			l_stream: KL_STRING_OUTPUT_STREAM
			i, nb: INTEGER
			l_formal_parameter: ET_FORMAL_PARAMETER
			l_note_list: DS_ARRAYED_LIST [ET_NOTE_TERM]
			l_splitter: ST_SPLITTER
		do
			a_string.append_string (tokens.class_keyword.text)
			a_string.append_character (' ')
			a_string.append_string (a_class.upper_name)
			if attached a_class.formal_parameters as l_formal_parameters and then l_formal_parameters.count > 0 then
				a_string.append_character (' ')
				a_string.append_character ('[')
				nb := l_formal_parameters.count
				from i := 1 until i > nb loop
					if i /= 1 then
						a_string.append_character (',')
						a_string.append_character (' ')
					end
					l_formal_parameter := l_formal_parameters.formal_parameter (i)
					a_string.append_string (l_formal_parameter.upper_name)
					a_string.append_character (' ')
					a_string.append_string (tokens.arrow_symbol.text)
					a_string.append_character (' ')
					if attached l_formal_parameter.constraint as l_constraint then
						if l_printer = Void then
							create l_stream.make (a_string)
							create l_printer.make (l_stream)
						end
						l_constraint.process (l_printer)
						if attached l_formal_parameter.creation_procedures as l_creation_procedures then
							a_string.append_character (' ')
							l_creation_procedures.process (l_printer)
						end
					else
						a_string.append_string (tokens.detachable_keyword.text)
						a_string.append_character (' ')
						a_string.append_string (tokens.separate_keyword.text)
						a_string.append_character (' ')
						a_string.append_string (tokens.any_class_name.upper_name)
					end
					i := i + 1
				end
				a_string.append_character (']')
			end
			if attached a_class.first_note_clause as l_note_clause then
				create l_note_list.make (1)
				l_note_clause.append_tagged_note_terms_to_list ("description", l_note_list)
				nb := l_note_list.count
				from i := 1 until i > nb loop
					if attached {ET_MANIFEST_STRING} l_note_list.item (i) as l_string then
						if l_splitter = Void then
							create l_splitter.make_with_separators ("%R%N")
						end
						across l_splitter.split (l_string.literal) as l_line loop
							l_line.adjust
							a_string.append_string ("%N%T-- ")
							if l_line.starts_with ("%%") then
								l_line.remove_head (1)
								l_line.left_adjust
							end
							if l_line.ends_with ("%%") then
								l_line.remove_tail (1)
								l_line.right_adjust
							end
							a_string.append_string (l_line)
						end
					end
					i := i + 1
				end
			end
		end

	append_formal_parameter_description_to_string (a_formal_parameter: ET_FORMAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_formal_parameter` to `a_string'.
		local
			l_printer: ET_AST_PRETTY_PRINTER
			l_stream: KL_STRING_OUTPUT_STREAM
		do
			a_string.append_string (current_class.upper_name)
			a_string.append_character (' ')
			a_string.append_character ('[')
			a_string.append_character (' ')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character (' ')
			a_string.append_string (a_formal_parameter.upper_name)
			a_string.append_character (' ')
			a_string.append_string (tokens.arrow_symbol.text)
			a_string.append_character (' ')
			if attached a_formal_parameter.constraint as l_constraint then
				create l_stream.make (a_string)
				create l_printer.make (l_stream)
				l_constraint.process (l_printer)
				if attached a_formal_parameter.creation_procedures as l_creation_procedures then
					a_string.append_character (' ')
					l_creation_procedures.process (l_printer)
				end
			else
				a_string.append_string (tokens.detachable_keyword.text)
				a_string.append_character (' ')
				a_string.append_string (tokens.separate_keyword.text)
				a_string.append_character (' ')
				a_string.append_string (tokens.any_class_name.upper_name)
			end
			a_string.append_character (' ')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character (' ')
			a_string.append_character (']')
		end

end
