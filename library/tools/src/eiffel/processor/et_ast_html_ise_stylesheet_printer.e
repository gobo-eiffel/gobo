note

	description:

	"[
		Eiffel AST printers to HTML with ISE stylesheet
		which mimics the output of ISE EiffelStudio filter:
				
			ec -filter html-stylesheet -all -config project.ecf
		
		Note that it is recommended that the code being printed has been successfully checked
		through ET_IMPLEMENTATION_CHECKER in order to get better hyper-text results.
		
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_HTML_ISE_STYLESHEET_PRINTER

inherit

	ET_AST_TYPED_PRETTY_PRINTER
		export
			{ANY} print_new_line, print_indentation
		redefine
			make,
			process_c1_character_constant_without_cast_type,
			process_c2_character_constant_without_cast_type,
			process_c3_character_constant_without_cast_type,
			process_extended_feature_name_of_feature,
			process_feature_name,
			process_formal_parameter_type,
			process_identifier,
			process_indexing_tag,
			process_integer_constant_without_cast_type,
			process_keyword,
			process_name_of_formal_parameter,
			process_name_of_named_class,
			process_new_name_of_rename,
			process_precursor_keyword,
			process_real_constant_without_cast_type,
			process_regular_manifest_string_without_cast_type,
			process_special_manifest_string_without_cast_type,
			process_symbol,
			process_tag,
			process_verbatim_string_without_cast_type,
			process_writable,
			print_character,
			print_string,
			print_comment_text
		end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new printer to HTML with ISE stylesheet.
		do
			create quoted_feature_name_buffer.make (20)
			create quoted_class_name_buffer.make (20)
			create internal_feature_name.make ("dummy")
			precursor (a_file, a_system_processor)
		end

feature -- Mapping

	class_mapping: detachable DS_HASH_TABLE [STRING, ET_CLASS]
			-- Mapping between classes and the href for these classes

	feature_mapping: detachable DS_HASH_TABLE [STRING, ET_FEATURE]
			-- Mapping between features and the href for these features

	root_path: detachable STRING
			-- Path from which href in `class_mapping' and `fetaure_mapping'
			-- are retalive

	set_class_mapping (a_class_mapping: like class_mapping)
			-- Set `class_mapping' to `a_class_mapping'.
		do
			class_mapping := a_class_mapping
		ensure
			class_mapping_set: class_mapping = a_class_mapping
		end

	set_feature_mapping (a_feature_mapping: like feature_mapping)
			-- Set `feature_mapping' to `a_feature_mapping'.
		do
			feature_mapping := a_feature_mapping
		ensure
			feature_mapping_set: feature_mapping = a_feature_mapping
		end

	set_root_path (a_root_path: like root_path)
			-- Set `root_path' to `a_root_path'.
		do
			root_path := a_root_path
		ensure
			root_path_set: root_path = a_root_path
		end

feature -- Printing

	print_class_header (a_class: ET_CLASS; a_with_deferred_info: BOOLEAN)
			-- Print the class name of `a_class', an asterisk if `a_class'
			-- is deferred and `a_with_deferred_info' is True, and its
			-- formal generic parameters if any.
			-- Do not print comments.
		require
			a_class_not_void: a_class /= Void
		local
			l_old_comments_ignored: BOOLEAN
			l_old_class: like current_class
		do
			l_old_comments_ignored := comments_ignored
			set_comments_ignored (True)
			l_old_class := current_class
			set_current_class (a_class)
			process_name_of_named_class (a_class.name, a_class)
			if a_with_deferred_info and then a_class.is_deferred then
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_echar)
				print_character ('*')
				print_end_span
			end
			if attached a_class.formal_parameters as l_formal_parameters then
				print_space
				l_formal_parameters.process (Current)
			end
			set_current_class (l_old_class)
			set_comments_ignored (l_old_comments_ignored)
		end

	print_feature_name_in_class (a_feature_name: ET_FEATURE_NAME; a_class: ET_CLASS)
			-- Print `a_feature_name', considered to be the name of a feature in `a_class'.
			-- Do not print comments.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_comments_ignored: BOOLEAN
		do
			l_old_comments_ignored := comments_ignored
			set_comments_ignored (True)
			set_target_type (a_class)
			process_feature_name (a_feature_name)
			set_target_type (Void)
			set_comments_ignored (l_old_comments_ignored)
		end

	print_feature_signature (a_feature: ET_FEATURE)
			-- Print signature of `a_feature'.
			-- Do not print comments.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_old_comments_ignored: BOOLEAN
			l_old_feature: like current_feature
		do
			l_old_feature := current_feature
			current_feature := a_feature
			l_old_comments_ignored := comments_ignored
			set_comments_ignored (True)
			print_unescaped_string (html_start_span_title)
			print_unescaped_character ('%"')
			print_unescaped_character ('`')
			print_string_lower_case (a_feature.name.name)
			print_unescaped_character ('%'')
			if a_feature.implementation_class /= current_class then
				print_string (string_was_declared_in)
				print_string_upper_case (a_feature.implementation_class.name.name)
			else
				print_string (string_is_declared_in_current)
			end
			print_unescaped_character ('%"')
			print_unescaped_character ('>')
			process_extended_feature_name_of_feature (a_feature)
			if attached a_feature.arguments as l_arguments and then not l_arguments.is_empty then
				print_space
				l_arguments.process (Current)
			end
			if attached a_feature.type as l_type then
				tokens.colon_symbol.process (Current)
				print_space
				l_type.process (Current)
			end
			print_end_span
			set_comments_ignored (l_old_comments_ignored)
			current_feature := l_old_feature
		end

	print_cluster_names_recursive (a_clusters: ET_CLUSTERS)
			-- Print names of `a_clusters' (one per line), and recursively
			-- of their explicit subclusters (indented).
			-- Do not print comments.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_old_comments_ignored: BOOLEAN
			i, nb: INTEGER
			l_cluster: ET_CLUSTER
		do
			l_old_comments_ignored := comments_ignored
			set_comments_ignored (True)
			nb := a_clusters.count
			from i := 1 until i > nb loop
				l_cluster := a_clusters.cluster (i)
				if not l_cluster.is_implicit then
					print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_necluster)
					print_string_lower_case (l_cluster.name)
					print_end_span
					print_new_line
					if attached l_cluster.subclusters as l_subclusters then
						indent
						print_cluster_names_recursive (l_subclusters)
						dedent
					end
				end
				i := i + 1
			end
			set_comments_ignored (l_old_comments_ignored)
		end

	print_comment_text (a_comment: STRING)
			-- Print comment held in `a_comment', followed by a new-line.
		local
			i, nb: INTEGER
			c: CHARACTER
			l_in_comment: BOOLEAN
			l_quoted_name: detachable STRING
			l_quoted_class_name: detachable STRING
			l_feature_name: detachable STRING
			l_open_span: BOOLEAN
			l_stop: BOOLEAN
		do
			comment_printed := False
			nb := a_comment.count
			from i := 1 until i > nb loop
				c := a_comment.item (i)
				inspect c
				when ' ', '%T', '%R' then
					if l_in_comment then
						if l_quoted_name /= Void then
							l_quoted_name.append_character (c)
						elseif l_quoted_class_name /= Void then
							l_quoted_class_name.append_character (c)
						else
							if not l_open_span then
								print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
								l_open_span := True
							end
							print_character (c)
						end
					end
				when '%N' then
					if l_in_comment then
						if l_quoted_name /= Void then
							if not l_open_span then
								print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
								l_open_span := True
							end
							print_character ('`')
							print_string (l_quoted_name)
							l_quoted_name := Void
						elseif l_quoted_class_name /= Void then
							if not l_open_span then
								print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
								l_open_span := True
							end
							print_character ('{')
							print_string (l_quoted_class_name)
							l_quoted_class_name := Void
						end
						if l_open_span then
							print_end_span
							l_open_span := False
						end
						print_new_line
						l_in_comment := False
					end
				when '-' then
					if not l_in_comment then
						if i = 1 or else a_comment.item (i - 1) /= '%N' then
								-- This comment does not appear at the beginning of a line.
						elseif i + 2 > nb or else a_comment.item (i + 2) /= '%T' then
								-- The two dashes are not followed by a tab.
						else
								-- This looks like code that has been commented out
								-- (either manually or using EiffelStudio).
								-- Do not indent this comment.
							indentation_printed := True
						end
						print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
						print_string (empty_comment)
						print_end_span
						l_in_comment := True
						i := i + 1
					elseif l_quoted_name /= Void then
						l_quoted_name.append_character (c)
					elseif l_quoted_class_name /= Void then
						l_quoted_class_name.append_character (c)
					else
						if not l_open_span then
							print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
							l_open_span := True
						end
						print_character (c)
					end
				when '`' then
					if l_quoted_name /= Void then
						if l_open_span then
							print_end_span
							l_open_span := False
						end
						print_quoted_name (l_quoted_name, c, {ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
						l_quoted_name := Void
					elseif l_quoted_class_name /= Void then
						l_quoted_class_name.append_character (c)
					else
						l_quoted_name := quoted_feature_name_buffer
						l_quoted_name.wipe_out
					end
				when '%'' then
					if l_quoted_name /= Void then
						if l_open_span then
							print_end_span
							l_open_span := False
						end
						print_quoted_name (l_quoted_name, c, {ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
						l_quoted_name := Void
					elseif l_quoted_class_name /= Void then
						l_quoted_class_name.append_character (c)
					else
						if not l_open_span then
							print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
							l_open_span := True
						end
						print_character (c)
					end
				when '{' then
					if l_quoted_name /= Void then
						l_quoted_name.append_character (c)
					elseif l_quoted_class_name /= Void then
						l_quoted_class_name.append_character (c)
					else
						l_quoted_class_name := quoted_class_name_buffer
						l_quoted_class_name.wipe_out
					end
				when '}' then
					if l_quoted_class_name /= Void then
						if l_open_span then
							print_end_span
							l_open_span := False
						end
						if i + 2 <= nb and then (a_comment.item (i + 1) = '.' and a_comment.item (i + 2).is_alpha) then
							l_feature_name := quoted_feature_name_buffer
							l_feature_name.wipe_out
							from
								i := i + 2
								l_stop := False
							until
								l_stop or i > nb
							loop
								c := a_comment.item (i)
								if c = '_' or c.is_alpha_numeric then
									l_feature_name.append_character (c)
									i := i + 1
								else
									l_stop := True
								end
							end
							i := i - 1
						end
						print_quoted_class_name (l_quoted_class_name, l_feature_name, {ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
						l_quoted_class_name := Void
						l_feature_name := Void
					elseif l_quoted_name /= Void then
						l_quoted_name.append_character (c)
					else
						if not l_open_span then
							print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
							l_open_span := True
						end
						print_character (c)
					end
				else
					if l_quoted_name /= Void then
						l_quoted_name.append_character (c)
					elseif l_quoted_class_name /= Void then
						l_quoted_class_name.append_character (c)
					else
						if not l_open_span then
							print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
							l_open_span := True
						end
						print_character (c)
					end
				end
				i := i + 1
			end
			if l_in_comment then
				if l_quoted_name /= Void then
					if not l_open_span then
						print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
						l_open_span := True
					end
					print_character ('`')
					print_string (l_quoted_name)
					l_quoted_name := Void
				elseif l_quoted_class_name /= Void then
					if not l_open_span then
						print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ecomment)
						l_open_span := True
					end
					print_character ('{')
					print_string (l_quoted_class_name)
					l_quoted_class_name := Void
				end
				if l_open_span then
					print_end_span
					l_open_span := False
				end
					-- There was no new-line at the end of the comment
					-- (probably because it appeared at the end of the file).
					-- But in the header comment we promised to write one.
				print_new_line
			end
			comment_printed := True
		end

	print_character (c: CHARACTER)
			-- Print character `c', or its escaped version if it's a special HTML character.
			-- Print indentation first if not done yet.
		do
			if not indentation_printed then
				print_indentation
			end
			put_character (c)
			comment_printed := False
		end

	print_string (s: STRING)
			-- Print string `s', or its escaped version if it contains special HTML characters.
			-- Print indentation first if not done yet.
		local
			i, nb: INTEGER
		do
			if not indentation_printed then
				print_indentation
			end
			nb := s.count
			from i := 1 until i > nb loop
				put_character (s.item (i))
				i := i + 1
			end
			comment_printed := False
		end

	print_string_lower_case (s: STRING)
			-- Print lower-case version of string `s', or its escaped version if it contains special HTML characters.
			-- Print indentation first if not done yet.
		local
			i, nb: INTEGER
		do
			if not indentation_printed then
				print_indentation
			end
			nb := s.count
			from i := 1 until i > nb loop
				put_character (s.item (i).as_lower)
				i := i + 1
			end
			comment_printed := False
		end

	print_string_upper_case (s: STRING)
			-- Print upper-case version of string `s', or its escaped version if it contains special HTML characters.
			-- Print indentation first if not done yet.
		local
			i, nb: INTEGER
		do
			if not indentation_printed then
				print_indentation
			end
			nb := s.count
			from i := 1 until i > nb loop
				put_character (s.item (i).as_upper)
				i := i + 1
			end
			comment_printed := False
		end

	print_unescaped_character (c: CHARACTER)
			-- Print character `c'.
			-- Print indentation first if not done yet.
		do
			if not indentation_printed then
				print_indentation
			end
			file.put_character (c)
			comment_printed := False
		end

	print_unescaped_string (s: STRING)
			-- Print string `s'.
			-- Print indentation first if not done yet.
		require
			s_not_void: s /= Void
		do
			if not indentation_printed then
				print_indentation
			end
			file.put_string (s)
			comment_printed := False
		end

	print_start_span_class (a_css_class: STRING)
			-- Print <SPAN CLASS="`a_css_class'">.
		require
			a_css_class_not_void: a_css_class /= Void
			a_css_class_not_empty: not a_css_class.is_empty
		do
			print_unescaped_string (html_start_span_class)
			print_unescaped_character ('%"')
			print_string (a_css_class)
			print_unescaped_character ('%"')
			print_unescaped_character ('>')
		end

	print_end_span
			-- Print </SPAN>.
		do
			print_unescaped_string (html_end_span)
		end

	print_start_a_class (a_css_class, a_href: STRING)
			-- Print <A CLASS="`a_css_class'" HREF="`a_href'">.
			-- Note that `a_href' is prefixed by `root_path' if not Void.
		require
			a_css_class_not_void: a_css_class /= Void
			a_css_class_not_empty: not a_css_class.is_empty
		do
			print_unescaped_string (html_start_a_class)
			print_unescaped_character ('%"')
			print_string (a_css_class)
			print_unescaped_character ('%"')
			print_unescaped_character (' ')
			print_unescaped_string (html_href)
			print_unescaped_character ('%"')
			if attached root_path as l_root_path then
				print_string (l_root_path)
			end
			print_string (a_href)
			print_unescaped_character ('%"')
			print_unescaped_character ('>')
		end

	print_end_a
			-- Print </A>.
		do
			print_unescaped_string (html_end_a)
		end

feature {ET_AST_PROCESSOR} -- Processing

	process_alias_name_with_href (a_alias_name: ET_ALIAS_NAME; a_href: STRING)
			-- Process `a_alias_name' with `a_href'.
		require
			a_alias_name_not_void: a_alias_name /= Void
			a_href_not_void: a_href /= Void
		do
			a_alias_name.alias_keyword.process (Current)
			print_space
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
			print_character ('"')
			print_end_span
			if a_alias_name.is_keyword then
				print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword, a_href)
			else
				print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol, a_href)
			end
			print_string_lower_case (a_alias_name.operator_name)
			print_end_a
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
			print_character ('"')
			print_end_span
			if attached a_alias_name.convert_keyword as l_convert_keyword then
				print_space
				l_convert_keyword.process (Current)
			end
			comment_finder.find_comments (a_alias_name, comment_list)
		end

	process_c1_character_constant_without_cast_type (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_echar)
			precursor (a_constant)
			print_end_span
		end

	process_c2_character_constant_without_cast_type (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_echar)
			precursor (a_constant)
			print_end_span
		end

	process_c3_character_constant_without_cast_type (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_echar)
			precursor (a_constant)
			print_end_span
		end

	process_extended_feature_name_of_feature (a_feature: ET_FEATURE)
			-- Process extended feature name of `a_feature'.
		local
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_href: detachable STRING
			i, nb: INTEGER
		do
			l_extended_feature_name := a_feature.extended_name
			l_feature_name := l_extended_feature_name.feature_name
			print_unescaped_string (html_start_a_name)
			print_unescaped_character ('%"')
			print_character ('f')
			print_character ('_')
			print_string_lower_case (l_feature_name.name)
			print_unescaped_character ('%"')
			print_unescaped_character ('>')
			print_end_a
			if attached feature_mapping as l_feature_mapping then
				l_href := l_feature_mapping.value (a_feature.implementation_feature)
			end
			if l_href /= Void then
				process_feature_name_with_href (l_feature_name, l_href)
				if attached l_extended_feature_name.alias_names as l_alias_names and then not l_alias_names.is_empty then
					nb := l_alias_names.count
					from i := 1 until i > nb loop
						print_space
						process_alias_name_with_href (l_alias_names.item (i), l_href)
						i := i + 1
					end
				end
			else
				l_extended_feature_name.process (Current)
			end
		end

	process_feature_name (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name'.
		local
			l_href: detachable STRING
			l_feature_name: ET_FEATURE_NAME
			l_old_comments_ignored: BOOLEAN
		do
			l_feature_name := a_feature_name
			if a_feature_name.is_feature_name then
				if attached target_class as l_target_class then
					if attached l_target_class.seeded_feature (a_feature_name.seed) as l_feature then
						l_feature_name := l_feature.name
						if attached feature_mapping as l_feature_mapping then
							l_href := l_feature_mapping.value (l_feature.implementation_feature)
						end
					end
				end
			end
			l_old_comments_ignored := comments_ignored
			set_comments_ignored (True)
			if l_href /= Void then
				process_feature_name_with_href (l_feature_name, l_href)
			else
				l_feature_name.process (Current)
			end
			set_comments_ignored (l_old_comments_ignored)
			comment_finder.find_comments (a_feature_name, comment_list)
		end

	process_feature_name_with_href (a_feature_name: ET_FEATURE_NAME; a_href: STRING)
			-- Process `a_feature_name' with `a_href'.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_href_not_void: a_href /= Void
		do
			if attached {ET_IDENTIFIER} a_feature_name as l_identifier then
				print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_efeature, a_href)
				print_string_lower_case (l_identifier.name)
				process_break (l_identifier.break)
				print_end_a
			else
				a_feature_name.process (Current)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		do
			if a_type.implementation_class /= current_class then
				a_type.named_type (current_class).process (Current)
			else
				precursor (a_type)
			end
		end

	process_identifier (an_identifier: ET_IDENTIFIER)
			-- Process `an_identifier'.
		do
			if
				an_identifier.is_argument or
				an_identifier.is_local or
				an_identifier.is_object_test_local or
				an_identifier.is_iteration_item
			then
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_elocal)
				print_string (an_identifier.name)
				print_end_span
				process_break (an_identifier.break)
			else
				precursor (an_identifier)
			end
		end

	process_indexing_tag (a_tag: ET_TAG)
			-- Process `a_tag' when appearing in an indexing clause.
		local
			l_identifier: ET_IDENTIFIER
		do
			l_identifier := a_tag.identifier
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eitag)
			print_string_lower_case (l_identifier.name)
			print_end_span
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			tokens.colon_symbol.process (Current)
			comment_finder.find_comments (a_tag, comment_list)
		end

	process_integer_constant_without_cast_type (a_constant: ET_INTEGER_CONSTANT)
			-- Process `a_constant' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_enumber)
			precursor (a_constant)
			print_end_span
		end

	process_keyword (a_keyword: ET_KEYWORD)
			-- Process `a_keyword'.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword)
			print_string (a_keyword.text)
			print_end_span
			process_break (a_keyword.break)
		end

	process_name_of_formal_parameter (a_parameter: ET_FORMAL_PARAMETER_TYPE)
			-- Process name of formal parameter `a_parameter'.
		local
			l_name: ET_IDENTIFIER
		do
			l_name := a_parameter.name
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_egeneric)
			print_string_upper_case (l_name.name)
			print_end_span
			process_break (l_name.break)
		end

	process_name_of_named_class (a_class_name: ET_CLASS_NAME; a_named_class: ET_NAMED_CLASS)
			-- Process `a_class_name' which is the name of `a_named_class'.
		local
			l_href: detachable STRING
			l_class: ET_CLASS
		do
			if attached {ET_IDENTIFIER} a_class_name as l_identifier then
				l_class := a_named_class.actual_class
				if attached class_mapping as l_class_mapping then
					l_href := l_class_mapping.value (l_class)
				end
			end
			if l_href /= Void then
				print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eclass, l_href)
				print_string_upper_case (a_class_name.name)
				process_break (a_class_name.break)
				print_end_a
			else
				a_class_name.process (Current)
			end
		end

	process_new_name_of_rename (a_rename: ET_RENAME)
			-- Process new name of `a_rename'.
		local
			l_extended_feature_name: ET_EXTENDED_FEATURE_NAME
			l_feature_name: ET_FEATURE_NAME
			l_href: detachable STRING
			i, nb: INTEGER
		do
			l_extended_feature_name := a_rename.new_name
			l_feature_name := l_extended_feature_name.feature_name
			if attached feature_mapping as l_feature_mapping then
				if attached current_class.seeded_feature (l_feature_name.seed) as l_feature then
					l_href := l_feature_mapping.value (l_feature.implementation_feature)
				end
			end
			if l_href /= Void then
				process_feature_name_with_href (l_feature_name, l_href)
				if attached l_extended_feature_name.alias_names as l_alias_names and then not l_alias_names.is_empty then
					nb := l_alias_names.count
					from i := 1 until i > nb loop
						print_space
						process_alias_name_with_href (l_alias_names.item (i), l_href)
						i := i + 1
					end
				end
			else
				l_extended_feature_name.process (Current)
			end
		end

	process_precursor_keyword (a_keyword: ET_PRECURSOR_KEYWORD)
			-- Process `a_keyword'.
		local
			l_href: detachable STRING
		do
			if attached feature_mapping as l_feature_mapping then
				if attached target_class as l_target_class then
					if attached l_target_class.seeded_feature (a_keyword.seed) as l_feature then
						l_href := l_feature_mapping.value (l_feature.implementation_feature)
					end
				end
			end
			if l_href /= Void then
				print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_ekeyword, l_href)
				print_string (a_keyword.name)
				process_break (a_keyword.break)
				print_end_a
			else
				precursor (a_keyword)
			end
		end

	process_real_constant_without_cast_type (a_constant: ET_REAL_CONSTANT)
			-- Process `a_constant' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_enumber)
			precursor (a_constant)
			print_end_span
		end

	process_regular_manifest_string_without_cast_type (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_estring)
			precursor (a_string)
			print_end_span
		end

	process_special_manifest_string_without_cast_type (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_estring)
			precursor (a_string)
			print_end_span
		end

	process_symbol (a_symbol: ET_SYMBOL)
			-- Process `a_symbol'.
		do
			if a_symbol.is_dot then
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_edot)
			else
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
			end
			print_string (a_symbol.text)
			print_end_span
			process_break (a_symbol.break)
		end

	process_tag (a_tag: ET_TAG)
			-- Process `a_tag'.
		local
			l_identifier: ET_IDENTIFIER
		do
			l_identifier := a_tag.identifier
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_etag)
			print_string_lower_case (l_identifier.name)
			print_end_span
				-- The AST may or may not contain the colon.
				-- So we have to print it explicitly here.
			tokens.colon_symbol.process (Current)
			comment_finder.find_comments (a_tag, comment_list)
		end

	process_verbatim_string_without_cast_type (a_string: ET_VERBATIM_STRING)
			-- Process `a_string' without cast type.
		do
			print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_estring)
			precursor (a_string)
			print_end_span
		end

	process_writable (a_writable: ET_WRITABLE)
			-- Process `a_writable'.
		local
			l_href: detachable STRING
		do
			if attached {ET_IDENTIFIER} a_writable as l_identifier and then l_identifier.is_feature_name then
				if attached feature_mapping as l_feature_mapping then
					if attached current_class.seeded_feature (l_identifier.seed) as l_feature then
						l_href := l_feature_mapping.value (l_feature.implementation_feature)
					end
				end
				if l_href /= Void then
					process_feature_name_with_href (l_identifier, l_href)
				else
					l_identifier.process (Current)
				end
			else
				a_writable.process (Current)
			end
		end

feature {NONE} -- Printing

	put_character (c: CHARACTER)
			-- Print character `c', or its escaped version if it's a special HTML character.
		do
			inspect c
			when '<' then
				file.put_string (html_lt)
			when '>' then
				file.put_string (html_gt)
			when '%"' then
				file.put_string (html_quot)
			when '&' then
				file.put_string (html_ampersand)
			else
				file.put_character (c)
			end
		end

	print_quoted_name (a_quoted_name: STRING; a_end_quote: CHARACTER; a_css_class: STRING)
			-- Print quoted name appearing a CSS element of class `a_css_class'.
		require
			a_quoted_name_not_void: a_quoted_name /= Void
			a_css_class_not_void: a_css_class /= Void
			a_css_class_not_empty: not a_css_class.is_empty
		local
			l_href: detachable STRING
			l_feature_name: ET_IDENTIFIER
		do
			if not a_quoted_name.is_empty then
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
				print_character ('`')
				print_end_span
				if attached feature_mapping as l_feature_mapping then
					l_feature_name := internal_feature_name
					l_feature_name.set_name (a_quoted_name)
					if attached current_class.named_feature (l_feature_name) as l_named_feature then
						l_href := l_feature_mapping.value (l_named_feature.implementation_feature)
					end
				end
				if l_href /= Void then
					print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_efeature, l_href)
					print_string (a_quoted_name)
					print_end_a
				else
					print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_equoted)
					print_string (a_quoted_name)
					print_end_span
				end
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
				print_character (a_end_quote)
				print_end_span
			else
				print_start_span_class (a_css_class)
				print_character ('`')
				print_character (a_end_quote)
				print_end_span
			end
		end

	print_quoted_class_name (a_quoted_class_name: STRING; a_feature_name: detachable STRING; a_css_class: STRING)
			-- Print quoted class name (possibly followed by a fetaure name)
			-- appearing a CSS element of class `a_css_class'.
		require
			a_quoted_class_name_not_void: a_quoted_class_name /= Void
			a_css_class_not_void: a_css_class /= Void
			a_css_class_not_empty: not a_css_class.is_empty
		local
			l_class: detachable ET_CLASS
			l_href: detachable STRING
			l_feature_name: ET_IDENTIFIER
		do
			if not a_quoted_class_name.is_empty then
				if attached class_mapping as l_class_mapping then
					if attached current_universe.master_class_by_name (a_quoted_class_name) as l_master_class then
						l_class := l_master_class.actual_class
						l_href := l_class_mapping.value (l_class)
					end
				end
			end
			if l_href /= Void then
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
				print_character ('{')
				print_end_span
				print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_eclass, l_href)
				print_string (a_quoted_class_name)
				print_end_a
				print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_esymbol)
				print_character ('}')
				print_end_span
			else
				print_start_span_class (a_css_class)
				print_character ('{')
				print_string (a_quoted_class_name)
				print_character ('}')
				print_end_span
			end
			if a_feature_name /= Void then
				if not a_feature_name.is_empty then
					l_href := Void
					if l_class /= Void and attached feature_mapping as l_feature_mapping then
						l_feature_name := internal_feature_name
						l_feature_name.set_name (a_feature_name)
						if attached l_class.named_feature (l_feature_name) as l_named_feature then
							l_href := l_feature_mapping.value (l_named_feature.implementation_feature)
						end
					end
					if l_href /= Void then
						print_start_span_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_edot)
						print_character ('.')
						print_end_span
						print_start_a_class ({ET_ISE_STYLESHEET_CONSTANTS}.css_efeature, l_href)
						print_string (a_feature_name)
						print_end_a
					else
						print_start_span_class (a_css_class)
						print_character ('.')
						print_string (a_feature_name)
						print_end_span
					end
				else
					print_start_span_class (a_css_class)
					print_character ('.')
					print_end_span
				end
			end
		end

feature {NONE} -- Implementation

	internal_feature_name: ET_IDENTIFIER
			-- 	Feature name object to be used internally

	quoted_feature_name_buffer: STRING
			-- Buffer for quoted feature names in comments

	quoted_class_name_buffer: STRING
			-- Buffer for quoted class names in comments

feature {NONE} -- Constants

	html_ampersand: STRING = "&#38;"
			-- Escaped '&' symbol

	html_lt: STRING = "&lt;"
			-- Escaped '<' symbol

	html_gt: STRING = "&gt;"
			-- Escaped '>' symbol

	html_quot: STRING = "&quot;"
			-- Escaped '%"' symbol

	html_start_span_class: STRING = "<SPAN CLASS="
			-- <SPAN CLASS=

	html_start_span_title: STRING = "<SPAN TITLE="
			-- <SPAN TITLE=

	html_end_span: STRING = "</SPAN>"
			-- </SPAN>

	html_start_a_name: STRING = "<A NAME="
			-- <A NAME=

	html_start_a_class: STRING = "<A CLASS="
			-- <A CLASS=

	html_end_a: STRING = "</A>"
			-- </A>

	html_href: STRING = "HREF="
			-- HREF=

	string_was_declared_in: STRING  = " was declared in "
			-- String constant

	string_is_declared_in_current: STRING = " is declared in `Current'"
			-- String constant

	empty_comment: STRING = "--"
			-- Empty comment

invariant

	internal_feature_name_not_void: internal_feature_name /= Void
	quoted_feature_name_buffer_not_void: quoted_feature_name_buffer /= Void
	quoted_class_name_buffer_not_void: quoted_class_name_buffer /= Void

end
