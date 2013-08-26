note

	description:

		"Symbol types"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_TYPE

inherit

	HASHABLE

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_CHARACTER_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

create

	make,
	make_generic,
	make_labeled_tuple,
	make_anchored,
	make_like_current,
	make_qualified_anchored

feature {NONE} -- Initialization

	make (an_id: INTEGER; a_type_mark: detachable STRING; a_name: like name)
			-- Create a new type named `a_name'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		do
			id := an_id
			if a_type_mark = Void then
				name := a_name
			else
				create name.make (a_type_mark.count + a_name.count + 1)
				name.append_string (a_type_mark)
				name.append_character (' ')
				name.append_string (a_name)
			end
		ensure
			id_set: id = an_id
			name_set: a_type_mark = Void implies name = a_name
		end

	make_generic (an_id: INTEGER; a_type_mark: detachable STRING; a_name: like name; generics: DS_ARRAYED_LIST [PR_TYPE])
			-- Create a new generic type named `a_name' and generic
			-- parameters `generics'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			generics_not_void: generics /= Void
			no_void_generic_parameter: not generics.has_void
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			i, nb: INTEGER
		do
			if generics.is_empty then
				make (an_id, a_type_mark, a_name)
			else
				id := an_id
				create name.make (50)
				if a_type_mark /= Void then
					name.append_string (a_type_mark)
					name.append_character (' ')
				end
				name.append_string (a_name)
				name.append_string (" [")
				name.append_string (generics.item (1).name)
				nb := generics.count
				from
					i := 2
				until
					i > nb
				loop
					name.append_string (", ")
					name.append_string (generics.item (i).name)
					i := i + 1
				end
				name.append_character (']')
			end
		ensure
			id_set: id = an_id
		end

	make_labeled_tuple (an_id: INTEGER; a_type_mark: detachable STRING; a_name: like name; generics: DS_ARRAYED_LIST [PR_LABELED_TYPE])
			-- Create a new labeled tuple type named `a_name' and generic
			-- parameters `generics'.
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			generics_not_void: generics /= Void
			no_void_generic_parameter: not generics.has_void
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			i, nb: INTEGER
			l_labeled_type: PR_LABELED_TYPE
			l_labels: DS_ARRAYED_LIST [STRING]
			j, nb2: INTEGER
		do
			if generics.is_empty then
				make (an_id, a_type_mark, a_name)
			else
				id := an_id
				create name.make (50)
				if a_type_mark /= Void then
					name.append_string (a_type_mark)
					name.append_character (' ')
				end
				name.append_string (a_name)
				name.append_string (" [")
				nb := generics.count
				from
					i := 1
				until
					i > nb
				loop
					if i /= 1 then
						name.append_string ("; ")
					end
					l_labeled_type := generics.item (i)
					l_labels := l_labeled_type.labels
					nb2 := l_labels.count
					from
						j := 1
					until
						j > nb2
					loop
						if j /= 1 then
							name.append_string (", ")
						end
						name.append_string (l_labels.item (j))
						j := j + 1
					end
					name.append_string (": ")
					name.append_string (l_labeled_type.type.name)
					i := i + 1
				end
				name.append_character (']')
			end
		ensure
			id_set: id = an_id
		end

	make_anchored (an_id: INTEGER; a_type_mark: detachable STRING; a_name: like name)
			-- Create a new anchored type
			-- of the form "like `a_name'".
		require
			valid_id: id >= 0
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		do
			id := an_id
			if a_type_mark /= Void then
				create name.make (a_type_mark.count + a_name.count + 6)
				name.append_string (a_type_mark)
				name.append_character (' ')
				name.append_string ("like ")
				name.append_string (a_name)
			else
				create name.make (a_name.count + 5)
				name.append_string ("like ")
				name.append_string (a_name)
			end
		ensure
			id_set: id = an_id
		end

	make_like_current (an_id: INTEGER; a_type_mark: detachable STRING)
			-- Create a new  type of the form "like Current".
		require
			valid_id: id >= 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		do
			id := an_id
			if a_type_mark /= Void then
				create name.make (a_type_mark.count + 13)
				name.append_string (a_type_mark)
				name.append_string (" like Current")
			else
				name := "like Current"
			end
		ensure
			id_set: id = an_id
		end

	make_qualified_anchored (an_id: INTEGER; a_type_mark: detachable STRING; a_type: PR_TYPE; a_name: like name)
			-- Create a new anchored type
			-- of the form "like {`a_type'}`a_name'".
		require
			valid_id: id >= 0
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			l_type_name: STRING
		do
			id := an_id
			l_type_name := a_type.name
			if a_type_mark /= Void then
				create name.make (a_type_mark.count + l_type_name.count + a_name.count + 8)
				name.append_string (a_type_mark)
				name.append_character (' ')
				name.append_string ("like {")
				name.append_string (l_type_name)
				name.append_character ('}')
				name.append_string (a_name)
			else
				create name.make (a_name.count + l_type_name.count + 7)
				name.append_string ("like {")
				name.append_string (l_type_name)
				name.append_character ('}')
				name.append_string (a_name)
			end
		ensure
			id_set: id = an_id
		end

feature -- Access

	name: STRING
			-- Type name

	alias_name: STRING
			-- Name to be used in `last_value_name', typically "last_<alias_name>_value".
			-- Use `name' instead if `alias_name' is Void or empty.

	last_value_name: STRING
			-- Name of last value entity
		local
			l_name: STRING
			i, nb: INTEGER
			c: CHARACTER
		do
			l_name := alias_name
			if l_name = Void or else l_name.is_empty then
				l_name := name
			end
			nb := l_name.count
			create Result.make (nb + 11)
			Result.append_string ("last_")
			from
				i := 1
			until
				i > nb
			loop
				c := l_name.item (i)
				inspect c
				when '0' .. '9', 'a' .. 'z', '_' then
					Result.append_character (c)
				when 'A' .. 'Z' then
					Result.append_character (CHARACTER_.as_lower (c))
				else
					Result.append_character ('_')
				end
				i := i + 1
			end
			Result.append_string ("_value")
		ensure
			last_value_name_not_void: Result /= Void
			last_value_name_not_empty: Result.count > 0
		end

	id: INTEGER
			-- Internal type id

	hash_code: INTEGER
			-- Hash value
		do
			Result := id
		end

feature -- Setting

	set_alias_name (a_name: like alias_name)
			-- Set `alias_name' to `a_name'.
		do
			alias_name := a_name
		ensure
			alias_name_set: alias_name = a_name
		end

feature -- Output

	append_dollar_n_to_string (n: INTEGER; nb_rhs: INTEGER; a_rule: PR_RULE; a_string: STRING)
			-- Append typed version of $`n' to `a_string'.
			-- `nb_rhs' is the maximum number of symbols on the
			-- right-hand-side of `a_rule' that can be accessed.
		require
			a_rule_not_void: a_rule /= Void
			n_positive: n > 0
			n_small_enough: n <= nb_rhs
			valid_nb_rhs: nb_rhs <= a_rule.rhs.count
			a_string_not_void: a_string /= Void
		local
			i, offset: INTEGER
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
		do
			rhs := a_rule.rhs
			from
				i := n + 1
			until
				i > nb_rhs
			loop
				if rhs.item (i).type = Current then
					offset := offset + 1
				end
				i := i + 1
			end
			if offset = 0 then
				a_string.append_string ("yyvs")
				INTEGER_.append_decimal_integer (id, a_string)
				a_string.append_string (".item (yyvsp")
				INTEGER_.append_decimal_integer (id, a_string)
				a_string.append_character (')')
			else
				a_string.append_string ("yyvs")
				INTEGER_.append_decimal_integer (id, a_string)
				a_string.append_string (".item (yyvsp")
				INTEGER_.append_decimal_integer (id, a_string)
				a_string.append_string (" - ")
				INTEGER_.append_decimal_integer (offset, a_string)
				a_string.append_character (')')
			end
		end

	append_dollar_dollar_to_string (a_string: STRING)
			-- Append typed version of $$ to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_string ("yyval")
			INTEGER_.append_decimal_integer (id, a_string)
		end

	print_yyvs_declaration (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print declaration of "yyvs" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("yyvs")
			a_file.put_integer (id)
			a_file.put_string (": SPECIAL [")
			a_file.put_string (name)
			a_file.put_line ("]")
			print_indentation (indent + 2, a_file)
			a_file.put_string ("-- Stack for semantic values of type ")
			a_file.put_line (name)
			a_file.put_new_line
			print_indentation (indent, a_file)
			a_file.put_string ("yyvsc")
			a_file.put_integer (id)
			a_file.put_line (": INTEGER")
			print_indentation (indent + 2, a_file)
			a_file.put_string ("-- Capacity of semantic value stack `yyvs")
			a_file.put_integer (id)
			a_file.put_line ("'")
			a_file.put_new_line
			print_indentation (indent, a_file)
			a_file.put_string ("yyvsp")
			a_file.put_integer (id)
			a_file.put_line (": INTEGER")
			print_indentation (indent + 2, a_file)
			a_file.put_string ("-- Top of semantic value stack `yyvs")
			a_file.put_integer (id)
			a_file.put_line ("'")
			a_file.put_new_line
			print_indentation (indent, a_file)
			a_file.put_string ("yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_string (": KL_SPECIAL_ROUTINES [")
			a_file.put_string (name)
			a_file.put_line ("]")
			print_indentation (indent + 2, a_file)
			a_file.put_string ("-- Routines that ought to be in SPECIAL [")
			a_file.put_string (name)
			a_file.put_line ("]")
		end

	print_create_yyvs (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvs := yyspecial_routines.make (yyInitial_stack_size)" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("create yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_new_line
			print_indentation (indent, a_file)
			a_file.put_string ("yyvsc")
			a_file.put_integer (id)
			a_file.put_line (" := yyInitial_yyvs_size")
			print_indentation (indent, a_file)
			a_file.put_string ("yyvs")
			a_file.put_integer (id)
			a_file.put_string (" := yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_string (".make (yyvsc")
			a_file.put_integer (id)
			a_file.put_line (")")
		end

	print_clear_yyvs (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvs.clear_all" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("yyvs")
			a_file.put_integer (id)
			a_file.put_line (".keep_head (0)")
		end

	print_increment_yyvsp (nb: INTEGER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvsp := yyvsp + `nb'" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("yyvsp")
			a_file.put_integer (id)
			a_file.put_string (" := yyvsp")
			a_file.put_integer (id)
			if nb >= 0 then
				a_file.put_string (" + ")
				a_file.put_integer (nb)
			else
				a_file.put_string (" ")
				a_file.put_integer (nb)
			end
			a_file.put_new_line
		end

	print_push_yyval (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvs.put (yyval, yyvsp)" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_string (".force (yyvs")
			a_file.put_integer (id)
			a_file.put_string (", yyval")
			a_file.put_integer (id)
			a_file.put_string (", yyvsp")
			a_file.put_integer (id)
			a_file.put_line (")")
		end

	print_push_last_value (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvsp := yyvsp + 1; yyvs.put (last_value, yyvsp)" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("yyvsp")
			a_file.put_integer (id)
			a_file.put_string (" := yyvsp")
			a_file.put_integer (id)
			a_file.put_line (" + 1")
			print_resize_yyvs (indent, a_file)
			print_indentation (indent, a_file)
			a_file.put_string ("if attached ")
			a_file.put_string (last_value_name)
			a_file.put_string (" as yyl_")
			a_file.put_string (last_value_name)
			a_file.put_line (" then")
			print_indentation (indent + 1, a_file)
			a_file.put_string ("yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_string (".force (yyvs")
			a_file.put_integer (id)
			a_file.put_string (", yyl_")
			a_file.put_string (last_value_name)
			a_file.put_string (", yyvsp")
			a_file.put_integer (id)
			a_file.put_line (")")
			print_indentation (indent, a_file)
			a_file.put_line ("else")
			print_indentation (indent + 1, a_file)
			a_file.put_string ("yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_string (".force (yyvs")
			a_file.put_integer (id)
			a_file.put_string (", ({")
			a_file.put_string (name)
			a_file.put_string ("}).default, yyvsp")
			a_file.put_integer (id)
			a_file.put_line (")")
			print_indentation (indent, a_file)
			a_file.put_line ("end")
		end

	print_pop_last_value (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvsp := yyvsp - 1" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("yyvsp")
			a_file.put_integer (id)
			a_file.put_string (" := ")
			a_file.put_string ("yyvsp")
			a_file.put_integer (id)
			a_file.put_line (" - 1")
		end

	print_resize_yyvs (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print "yyvs := yyspecial_routines.resize (yyvs, yyvsp + yyInitial_stack_size)" to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (indent, a_file)
			a_file.put_string ("if yyvsp")
			a_file.put_integer (id)
			a_file.put_string (" >= yyvsc")
			a_file.put_integer (id)
			a_file.put_line (" then")
			print_indentation (indent + 1, a_file)
			a_file.put_line ("debug (%"GEYACC%")")
			print_indentation (indent + 2, a_file)
			a_file.put_string ("std.error.put_line (%"Resize yyvs")
			a_file.put_integer (id)
			a_file.put_line ("%")")
			print_indentation (indent + 1, a_file)
			a_file.put_line ("end")
			print_indentation (indent + 1, a_file)
			a_file.put_string ("yyvsc")
			a_file.put_integer (id)
			a_file.put_string (" := yyvsc")
			a_file.put_integer (id)
			a_file.put_line (" + yyInitial_yyvs_size")
			print_indentation (indent + 1, a_file)
			a_file.put_string ("yyvs")
			a_file.put_integer (id)
			a_file.put_string (" := yyspecial_routines")
			a_file.put_integer (id)
			a_file.put_string (".aliased_resized_area (yyvs")
			a_file.put_integer (id)
			a_file.put_string (", yyvsc")
			a_file.put_integer (id)
			a_file.put_line (")")
			print_indentation (indent, a_file)
			a_file.put_line ("end")
		end

	print_dollar_dollar_declaration (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print $$ declaration to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("%T%T%Tyyval")
			a_file.put_integer (id)
			a_file.put_string (": ")
			a_file.put_string (name)
		end

	print_indentation (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `indent' tabs to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > indent
			loop
				a_file.put_character ('%T')
				i := i + 1
			end
		end

invariant

	valid_id: id >= 0
	name_not_void: name /= Void
	name_not_empty: name.count > 0

end
