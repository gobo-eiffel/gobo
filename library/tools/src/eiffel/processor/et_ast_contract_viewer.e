note

	description:

	"[
		Eiffel AST contract viewers. Do not print feature implementations, only
		exported features with their assertions.
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_AST_CONTRACT_VIEWER

inherit

	ET_AST_PRETTY_PRINTER
		redefine
			process_attribute,
			process_class,
			process_constant_attribute,
			process_creator_list,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_procedure,
			process_extended_attribute,
			process_external_function,
			process_external_procedure,
			process_once_function,
			process_once_procedure,
			process_features,
			process_unique_attribute
		end

create

	make, make_null

feature {ET_AST_NODE} -- Processing

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			precursor (a_feature)
			print_new_line
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_obsolete_string: ET_MANIFEST_STRING
		do
			if use_as_type then
				process_name_of_named_class (a_class.name, a_class)
				if attached a_class.formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
					print_space
					l_formal_parameters.process (Current)
				end
			else
				if bom_enabled and then a_class.has_utf8_bom then
					print_bom
				end
				process_break (a_class.leading_break)
				if not comment_list.is_empty then
					process_comments
						-- Add an extra line after the comment.
					print_new_line
				end
				if attached a_class.first_note_clause as l_note_clause then
					l_note_clause.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				if attached a_class.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
					print_space
				end
				if attached a_class.class_mark as l_class_mark then
					l_class_mark.process (Current)
					print_space
				end
				if attached a_class.external_keyword as l_external_keyword then
					l_external_keyword.process (Current)
					print_space
				end
				a_class.class_keyword.process (Current)
				print_space
				print_string ("interface")
				print_space
				process_name_of_named_class (a_class.name, a_class)
				if attached a_class.formal_parameters as l_formal_parameters then
					if l_formal_parameters.is_empty then
							-- Do not print empty brackets, but keep the comments if any.
						comment_finder.find_comments (l_formal_parameters, comment_list)
					else
						print_space
						l_formal_parameters.process (Current)
					end
				end
				process_comments
				print_new_line
				print_new_line
				if attached a_class.obsolete_message as l_obsolete_message then
					tokens.obsolete_keyword.process (Current)
					l_obsolete_string := l_obsolete_message.manifest_string
					comment_finder.add_excluded_node (l_obsolete_string)
					comment_finder.find_comments (l_obsolete_message, comment_list)
					comment_finder.reset_excluded_nodes
					indent
					process_comments
					print_new_line
					print_new_line
					l_obsolete_string.process (Current)
					dedent
					process_comments
					print_new_line
					print_new_line
				end
				if attached a_class.creators as l_creators then
					l_creators.process (Current)
				end
				if attached a_class.convert_features as l_convert_features then
					l_convert_features.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				process_features (a_class)
				if attached a_class.invariants as l_invariants then
					l_invariants.process (Current)
					process_comments
				end
				if attached a_class.second_note_clause as l_note_clause then
					if (not attached a_class.invariants as l_invariants or else l_invariants.is_empty) and then a_class.queries.declared_count > 0 and then a_class.queries.item (a_class.queries.declared_count).is_attribute and then (a_class.procedures.declared_count = 0 or else a_class.procedures.item (a_class.procedures.declared_count).position < a_class.queries.item (a_class.queries.declared_count).position) then
							-- Print a semicolon in order to avoid syntax error.
							-- For example if we have:
							--
							--     feature
							--         attr: INTEGER
							--     note
							--         license: "..."
							--     end
							--
							-- it could also be seen as:
							--
							--     feature
							--         attr: INTEGER
							--             note
							--                  license: "..."
							--             end
							--
							-- even if this is not syntactically correct since the end
							-- of the class is missing.
						tokens.semicolon_symbol.process (Current)
					end
					l_note_clause.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				a_class.end_keyword.process (Current)
				process_comments_on_same_line
				print_new_line
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			precursor (a_feature)
			print_new_line
		end

	process_creator_list (a_list: ET_CREATOR_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_creator: ET_CREATOR
			l_is_exported: BOOLEAN
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_creator := a_list.item (i)
				l_is_exported := not attached l_creator.clients_clause as l_clients or else l_clients.has_class_name (tokens.any_class_name)
				if l_is_exported then
					l_creator.process (Current)
					process_comments
					print_new_line
					print_new_line
				end
				i := i + 1
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		do
			process_query (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		do
			process_procedure (a_feature)
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			process_query (a_feature)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			process_procedure (a_feature)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_query (a_feature)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			process_query (a_feature)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			process_procedure (a_feature)
		end

	process_features (a_class: ET_CLASS)
			-- Process feature clauses of `a_class'.
		local
			a_feature_clause: ET_FEATURE_CLAUSE
			l_queries: ET_QUERY_LIST
			l_query: detachable ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: detachable ET_PROCEDURE
			i, nb: INTEGER
			j, nb_queries: INTEGER
			k, nb_procedures: INTEGER
			l_is_exported: BOOLEAN
		do
			if attached a_class.feature_clauses as a_feature_clauses then
				j := 1
				l_queries := a_class.queries
				nb_queries := l_queries.declared_count
				k := 1
				l_procedures := a_class.procedures
				nb_procedures := l_procedures.declared_count
				nb := a_feature_clauses.count
				from i := 1 until i > nb loop
					a_feature_clause := a_feature_clauses.item (i)
					l_is_exported := not attached a_feature_clause.clients_clause as l_clients or else l_clients.has_class_name (tokens.any_class_name)
					if l_is_exported then
						a_feature_clause.process (Current)
						process_comments
						print_new_line
						print_new_line
					end
					from
						if j <= nb_queries then
							l_query := l_queries.item (j)
							if l_query.feature_clause /= a_feature_clause then
								l_query := Void
							end
						end
						if k <= nb_procedures then
							l_procedure := l_procedures.item (k)
							if l_procedure.feature_clause /= a_feature_clause then
								l_procedure := Void
							end
						end
					until
						l_query = Void and l_procedure = Void
					loop
						indent
						if l_query /= Void and then (l_procedure = Void or else (l_query.name.position < l_procedure.name.position)) then
							if l_is_exported then
								l_query.process (Current)
							end
							from
							until
								l_query = Void or else l_query.synonym = Void
							loop
								j := j + 1
								if j <= nb_queries then
									l_query := l_queries.item (j)
								else
									l_query := Void
								end
							end
							j := j + 1
							if j <= nb_queries then
								l_query := l_queries.item (j)
								if l_query.feature_clause /= a_feature_clause then
									l_query := Void
								end
							else
								l_query := Void
							end
						elseif l_procedure /= Void then
							if l_is_exported then
								l_procedure.process (Current)
							end
							from
							until
								l_procedure = Void or else l_procedure.synonym = Void
							loop
								k := k + 1
								if k <= nb_procedures then
									l_procedure := l_procedures.item (k)
								else
									l_procedure := Void
								end
							end
							k := k + 1
							if k <= nb_procedures then
								l_procedure := l_procedures.item (k)
								if l_procedure.feature_clause /= a_feature_clause then
									l_procedure := Void
								end
							else
								l_procedure := Void
							end
						end
						dedent
						if l_is_exported then
							print_new_line
						end
					end
					i := i + 1
				end
			end
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			process_query (a_feature)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			process_procedure (a_feature)
		end

	process_procedure (a_feature: ET_PROCEDURE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_synonym: detachable ET_FEATURE
			l_obsolete_string: ET_MANIFEST_STRING
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				if attached l_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
					print_space
				end
				process_extended_feature_name_of_feature (l_synonym)
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			if attached a_feature.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
			if use_is_keyword then
				print_space
				tokens.is_keyword.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			if attached a_feature.first_note as l_note then
				process_note_clause (l_note, False)
				process_comments
				print_new_line
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
				process_comments
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
				process_comments
			end
			dedent
		end

	process_query (a_feature: ET_QUERY)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_declared_type: ET_DECLARED_TYPE
			l_type: ET_TYPE
			l_synonym: detachable ET_FEATURE
			l_obsolete_string: ET_MANIFEST_STRING
		do
			from
				l_synonym := a_feature
			until
				l_synonym = Void
			loop
				if attached l_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
					print_space
				end
				process_extended_feature_name_of_feature (l_synonym)
				l_synonym := l_synonym.synonym
				if l_synonym /= Void then
						-- The AST may or may not contain the comma.
						-- So we have to print it explicitly here.
					tokens.comma_symbol.process (Current)
					print_space
				end
			end
			if attached a_feature.arguments as l_arguments then
				if l_arguments.is_empty then
						-- Do not print empty parentheses, but keep the comments if any.
					comment_finder.find_comments (l_arguments, comment_list)
				else
					print_space
					l_arguments.process (Current)
				end
			end
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			l_declared_type := a_feature.declared_type
			l_type := l_declared_type.type
			tokens.colon_symbol.process (Current)
			comment_finder.add_excluded_node (l_type)
			comment_finder.find_comments (l_declared_type, comment_list)
			comment_finder.reset_excluded_nodes
			print_space
			l_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				print_space
				l_assigner.process (Current)
			end
			if use_is_keyword then
				print_space
				tokens.is_keyword.process (Current)
			end
			if attached {ET_FUNCTION} a_feature as l_function and then attached l_function.is_keyword as l_is_keyword then
				process_break (l_is_keyword.break)
			end
			indent
			process_comments
			print_new_line
			if attached a_feature.first_note as l_note then
				process_note_clause (l_note, False)
				process_comments
				print_new_line
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				tokens.obsolete_keyword.process (Current)
				l_obsolete_string := l_obsolete_message.manifest_string
				comment_finder.add_excluded_node (l_obsolete_string)
				comment_finder.find_comments (l_obsolete_message, comment_list)
				comment_finder.reset_excluded_nodes
				indent
				process_comments
				print_new_line
				l_obsolete_string.process (Current)
				process_comments
				print_new_line
				dedent
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
				process_comments
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
				process_comments
			end
			dedent
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		do
			precursor (a_feature)
			print_new_line
		end

end
