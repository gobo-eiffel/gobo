indexing

	description:

		"Eiffel console-mode signature viewers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SIGNATURE_VIEWER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_class
		end

	KL_SHARED_STANDARD_FILES

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new signature viewer for classes in `a_universe'.
		do
			universe := a_universe
			current_context := a_universe.unknown_class
			input_file := std.input
			output_file := std.output
		end

feature -- Access

	input_file: KI_TEXT_INPUT_STREAM
			-- Input file

	output_file: KI_TEXT_OUTPUT_STREAM
			-- Output file

	current_context: ET_TYPE_CONTEXT
			-- Current type context

feature -- Execution

	execute is
			-- Execute signature viewer.
		local
			a_name: STRING
			stop: BOOLEAN
			a_class: ET_CLASS
			a_base_type: ET_BASE_TYPE
		do
			from until stop loop
				output_file.put_string ("Enter class name: ")
				input_file.read_line
				if not input_file.end_of_input then
					create a_name.make_from_string (input_file.last_string)
					if a_name.is_empty then
						stop := True
					else
						a_base_type := base_type (a_name)
						if a_base_type /= Void then
							current_context := a_base_type
							a_class := a_base_type.direct_base_class (universe)
							process_class (a_class)
						end
					end
				else
					stop := True
				end
			end
			current_context := universe.unknown_class
		end

feature {ET_AST_NODE} -- Processing

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		local
			a_name: STRING
			an_identifier: ET_IDENTIFIER
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			i, nb: INTEGER
			stop: BOOLEAN
		do
			from until stop loop
				output_file.put_string ("Enter feature name: ")
				input_file.read_line
				if not input_file.end_of_input then
					create a_name.make_from_string (input_file.last_string)
					if a_name.is_empty then
						stop := True
					elseif a_name.is_equal ("all") then
						l_queries := a_class.queries
						nb := l_queries.count
						from i := 1 until i > nb loop
							process_query (l_queries.item (i))
							output_file.put_new_line
							i := i + 1
						end
						l_procedures := a_class.procedures
						nb := l_procedures.count
						from i := 1 until i > nb loop
							process_procedure (l_procedures.item (i))
							output_file.put_new_line
							i := i + 1
						end
						stop := True
					else
						create an_identifier.make (a_name)
						l_query := a_class.named_query (an_identifier)
						if l_query /= Void then
							process_query (l_query)
							output_file.put_new_line
						else
							l_procedure := a_class.named_procedure (an_identifier)
							if l_procedure /= Void then
								process_procedure (l_procedure)
								output_file.put_new_line
							else
								output_file.put_string ("No feature `")
								output_file.put_string (a_name)
								output_file.put_string ("' in class ")
								output_file.put_string (a_class.upper_name)
								output_file.put_character ('.')
								output_file.put_new_line
							end
						end
					end
				else
					stop := True
				end
			end
		end

	process_query (a_query: ET_QUERY) is
			-- Process `a_query'.
		require
			a_query_not_void: a_query /= Void
		local
			args: ET_FORMAL_ARGUMENT_LIST
			arg: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
		do
			output_file.put_string (a_query.name.name)
			args := a_query.arguments
			if args /= Void then
				output_file.put_string (" (")
				nb := args.count
				from i := 1 until i > nb loop
					arg := args.formal_argument (i)
					output_file.put_string (arg.name.name)
					output_file.put_string (": ")
					output_file.put_string (arg.type.base_type (current_context, universe).to_text)
					if i /= nb then
						output_file.put_string ("; ")
					end
					i := i + 1
				end
				output_file.put_string (")")
			end
			output_file.put_string (": ")
			output_file.put_string (a_query.type.base_type (current_context, universe).to_text)
		end

	process_procedure (a_procedure: ET_PROCEDURE) is
			-- Process `a_procedure'.
		require
			a_procedure_not_void: a_procedure /= Void
		local
			args: ET_FORMAL_ARGUMENT_LIST
			arg: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
		do
			output_file.put_string (a_procedure.name.name)
			args := a_procedure.arguments
			if args /= Void then
				output_file.put_string (" (")
				nb := args.count
				from i := 1 until i > nb loop
					arg := args.formal_argument (i)
					output_file.put_string (arg.name.name)
					output_file.put_string (": ")
					output_file.put_string (arg.type.base_type (current_context, universe).to_text)
					if i /= nb then
						output_file.put_string ("; ")
					end
					i := i + 1
				end
				output_file.put_string (")")
			end
		end

feature {NONE} -- Implementation

	base_type (a_name: STRING): ET_BASE_TYPE is
			-- Build a class type or tuple type from `a_name',
			-- or report error to `output_file'.
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			i := parse_base_type (a_name, 1)
			if i <= a_name.count then
				output_file.put_string ("Invalid type name '")
				output_file.put_string (a_name)
				output_file.put_string ("'.")
				output_file.put_new_line
			else
				Result := last_base_type
			end
			last_base_type := Void
		ensure
			valid_context: Result /= Void implies Result.is_valid_context
		end

	parse_class (str: STRING; a_position: INTEGER): INTEGER is
			-- Parse class in `str' starting at `a_position'.
			-- Make result available in `last_class', or Void
			-- if an error was found (report error to `output_file'.
			-- Return the new position in `str'.
		local
			a_name: STRING
			i, nb: INTEGER
			c: CHARACTER
			an_identifier: ET_IDENTIFIER
			stop: BOOLEAN
		do
			last_class := Void
			from
				i := a_position
				nb := str.count
			until
				i > nb or
				stop
			loop
				c := str.item (i)
				inspect c
				when 'a'..'z', 'A'..'Z', '0'..'9', '_' then
					stop := True
				else
					i := i + 1
				end
			end
			from
				stop := False
				create a_name.make (10)
			until
				i > nb or
				stop
			loop
				c := str.item (i)
				inspect c
				when 'a'..'z', 'A'..'Z', '0'..'9', '_' then
					a_name.append_character (c)
					i := i + 1
				else
					stop := True
				end
			end
			Result := i
			if not a_name.is_empty then
				create an_identifier.make (a_name)
				if universe.has_class (an_identifier) then
					last_class := universe.eiffel_class (an_identifier)
				else
					output_file.put_string ("No class ")
					output_file.put_string (a_name)
					output_file.put_string (" in universe.")
					output_file.put_new_line
					Result := nb + 2
				end
			else
				output_file.put_string ("Invalid type name '")
				output_file.put_string (str)
				output_file.put_string ("'.")
				output_file.put_new_line
				Result := nb + 2
			end
		ensure
			valid_position: Result > a_position
		end

	last_class: ET_CLASS
			-- Last class parsed by `parse_class';
			-- Void if an error was found when parsing

	parse_base_type (str: STRING; a_position: INTEGER): INTEGER is
			-- Parse class type or tuple type in `str' starting at `a_position'.
			-- Make result available in `last_base_type', or Void
			-- if an error was found (report error to `output_file'.
			-- Return the new position in `str'.
		local
			i, nb: INTEGER
			stop: BOOLEAN
			a_class: ET_CLASS
			an_actuals, tmp_actuals: ET_ACTUAL_PARAMETER_LIST
			close_brackets_parsed: BOOLEAN
		do
			last_base_type := Void
			Result := parse_class (str, a_position)
			a_class := last_class
			if a_class /= Void then
				if a_class = universe.tuple_class then
						-- Tuples have a variable number of arguments.
					i := parse_open_bracket (str, Result)
					if i > str.count + 1 then
						create {ET_TUPLE_TYPE} last_base_type.make (Void)
					else
						from
							Result := i
							create tmp_actuals.make
						until
							close_brackets_parsed or stop
						loop
							Result := parse_base_type (str, Result)
							if last_base_type /= Void then
								tmp_actuals.force_first (last_base_type)
								i := parse_comma (str, Result)
								if i > str.count + 1 then
									Result := parse_close_bracket (str, Result)
									if Result > str.count + 1 then
										stop := True
										Result := str.count + 2
									else
										close_brackets_parsed := True
									end
								else
									Result := i
								end
							else
								stop := True
								Result := str.count + 2
							end
						end
						last_base_type := Void
						if not stop then
							nb := tmp_actuals.count
							create an_actuals.make_with_capacity (nb)
							from i := 1 until i > nb loop
								an_actuals.force_first (tmp_actuals.item (i))
								i := i + 1
							end
							create {ET_TUPLE_TYPE} last_base_type.make (an_actuals)
						end
					end
				elseif a_class.is_generic then
					Result := parse_open_bracket (str, Result)
					if Result > str.count + 1 then
						stop := True
					end
					nb := a_class.formal_parameters.count
					create tmp_actuals.make_with_capacity (nb)
					from
						i := 1
					until
						i > nb or stop
					loop
						Result := parse_base_type (str, Result)
						if last_base_type /= Void then
							tmp_actuals.put_first (last_base_type)
							if i /= nb then
								Result := parse_comma (str, Result)
								if Result > str.count + 1 then
									stop := True
								end
							end
						else
							stop := True
							Result := str.count + 2
						end
						i := i + 1
					end
					last_base_type := Void
					if not stop then
						Result := parse_close_bracket (str, Result)
						if Result <= str.count + 1 then
							create an_actuals.make_with_capacity (nb)
							from i := 1 until i > nb loop
								an_actuals.put_first (tmp_actuals.item (i))
								i := i + 1
							end
							create {ET_GENERIC_CLASS_TYPE} last_base_type.make (Void, a_class.name, an_actuals, a_class)
						end
					end
				else
					last_base_type := a_class
				end
			end
		ensure
			valid_position: Result > a_position
			valid_context: last_base_type /= Void implies last_base_type.is_valid_context
		end

	last_base_type: ET_BASE_TYPE
			-- Last class type or tuple type parsed by `parse_base_type';
			-- Void if an error was found when parsing

	parse_open_bracket (str: STRING; a_position: INTEGER): INTEGER is
			-- Parse '[' in `str' starting at `a_position'.
			-- Return the new position in `str', or
			-- 'str.count + 2' if no ']' was found.
		local
			i, nb: INTEGER
			found, error: BOOLEAN
			c: CHARACTER
		do
			from
				i := a_position
				nb := str.count
			until
				i > nb or
				found or error
			loop
				c := str.item (i)
				inspect c
				when '[' then
					i := i + 1
					found := True
				when ' ', '%T', '%R', '%N' then
						-- Skip spaces.
					i := i + 1
				else
					error := True
				end
			end
			if not found or error then
				output_file.put_string ("Invalid type name '")
				output_file.put_string (str)
				output_file.put_string ("'.")
				output_file.put_new_line
				Result := nb + 2
			else
				Result := i
			end
		ensure
			valid_position: Result > a_position
		end

	parse_comma (str: STRING; a_position: INTEGER): INTEGER is
			-- Parse ',' in `str' starting at `a_position'.
			-- Return the new position in `str', or
			-- 'str.count + 2' if no ']' was found.
		local
			i, nb: INTEGER
			found, error: BOOLEAN
			c: CHARACTER
		do
			from
				i := a_position
				nb := str.count
			until
				i > nb or
				found or error
			loop
				c := str.item (i)
				inspect c
				when ',' then
					i := i + 1
					found := True
				when ' ', '%T', '%R', '%N' then
						-- Skip spaces.
					i := i + 1
				else
					error := True
				end
			end
			if not found or error then
				output_file.put_string ("Invalid type name '")
				output_file.put_string (str)
				output_file.put_string ("'.")
				output_file.put_new_line
				Result := nb + 2
			else
				Result := i
			end
		ensure
			valid_position: Result > a_position
		end

	parse_close_bracket (str: STRING; a_position: INTEGER): INTEGER is
			-- Parse ']' in `str' starting at `a_position'.
			-- Return the new position in `str', or
			-- 'str.count + 2' if no ']' was found.
		local
			i, nb: INTEGER
			found, error: BOOLEAN
			c: CHARACTER
		do
			from
				i := a_position
				nb := str.count
			until
				i > nb or
				found or error
			loop
				c := str.item (i)
				inspect c
				when ']' then
					i := i + 1
					found := True
				when ' ', '%T', '%R', '%N' then
						-- Skip spaces.
					i := i + 1
				else
					error := True
				end
			end
			if not found or error then
				output_file.put_string ("Invalid type name '")
				output_file.put_string (str)
				output_file.put_string ("'.")
				output_file.put_new_line
				Result := nb + 2
			elseif found then
				from
					found := False
				until
					i > nb or
					found
				loop
					c := str.item (i)
					inspect c
					when ' ', '%T', '%R', '%N' then
							-- Skip spaces.
						i := i + 1
					else
						found := True
					end
				end
				Result := i
			else
				Result := i
			end
		ensure
			valid_position: Result > a_position
		end

invariant

	current_context_not_void: current_context /= Void
	input_file_not_void: input_file /= Void
	input_file_open_read: input_file.is_open_read
	output_file_not_void: output_file /= Void
	output_file_open_write: output_file.is_open_write

end
