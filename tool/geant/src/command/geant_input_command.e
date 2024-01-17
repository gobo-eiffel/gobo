note

	description:

		"Input commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2006-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_INPUT_COMMAND

inherit

	GEANT_COMMAND

	KL_STANDARD_FILES
		export {NONE} all end

create

	make

feature -- Status report

	is_executable : BOOLEAN
			-- Can command be executed?
		do
			Result := (attached variable as l_variable and then l_variable.count > 0) and message /= Void
		ensure then
			variable_not_void_and_not_empty: Result implies attached variable as l_variable and then l_variable.count > 0
			message_not_void: Result implies message /= Void
		end

feature -- Access

	variable: detachable STRING
			-- Name of variable

	message: detachable STRING
			-- Question to fill variable

	default_value: detachable STRING
			-- Default answer

	validargs: detachable STRING
			-- validargs
			-- comma separated String containing valid input arguments.
			-- If set, input task will reject any input not defined here.
			-- Validargs are compared case sensitive.
			-- If you want 'a' and 'A' to be accepted you will need to define both arguments
			-- within validargs

	validregexp: detachable STRING
			-- validregexp
			-- regular expression validating input.

	answer_required: BOOLEAN
			-- Answer required (non empty answer allowed)

feature -- Setting

	set_variable (a_variable: like variable)
			-- Set `variable' to `a_variable'.
		require
			a_variable_not_void: a_variable /= Void
			a_variable_not_empty: a_variable.count > 0
		do
			variable := a_variable
		ensure
			variable_set: variable = a_variable
		end

	set_message (a_message: like message)
			-- Set `message' to `a_message'.
		require
			a_message_not_void: a_message /= Void
		do
			message := a_message
		ensure
			message_set: message = a_message
		end

	set_default_value (a_default_value: like default_value)
			-- Set `default_value' to `a_default_value'.
		require
			a_default_value_not_void: a_default_value /= Void
		do
			default_value := a_default_value
		ensure
			default_value_set: default_value = a_default_value
		end

	set_answer_required (a_answer_required: like answer_required)
			-- Set `answer_required' to `a_answer_required'.
		do
			answer_required := a_answer_required
		ensure
			answer_required_set: answer_required = a_answer_required
		end

	set_validargs (a_validargs: like validargs)
			-- Set `validargs' to `a_validargs'.
		require
			a_validargs_not_void: a_validargs /= Void
		do
			validargs := a_validargs
		ensure
			validargs_set: validargs = a_validargs
		end

	set_validregexp (a_validregexp: like validregexp)
			-- Set `validregexp' to `a_validregexp'.
		require
			a_validregexp_not_void: a_validregexp /= Void
		do
			validregexp := a_validregexp
		ensure
			validregexp_set: validregexp = a_validregexp
		end

feature -- Execution

	execute
			-- Put variable in project variables pool.
		local
			s: STRING
			l_answer_required: BOOLEAN
			regexp: RX_PCRE_REGULAR_EXPRESSION
			l_valid_args: DS_LIST [STRING]
			splitter: ST_SPLITTER
			l_tester: KL_STRING_EQUALITY_TESTER
		do
			check is_executable: attached message as l_message and attached variable as l_variable then
				exit_code := 0

				l_answer_required := answer_required
				if attached validargs as l_validargs then
					create splitter.make_with_separators (",")
					l_valid_args := splitter.split (l_validargs)
					create l_tester
					l_valid_args.set_equality_tester (l_tester)
				end
				if attached validregexp as l_validregexp then
					create regexp.make
					regexp.compile (l_validregexp)
					if not regexp.is_compiled then
						project.log (<<"  [input] error: validregexp %"", l_validregexp ,"%" definition is not valid">>)
						exit_code := 1
					end
				end
				if exit_code = 0 then
					from
					until
						s /= Void
					loop
						project.trace (<<"  [input] variable=", l_variable, " prompt=%"", l_message, "%"">>)
						output.put_string (l_message)
						if attached default_value as l_default_value then
							output.put_string (" default=[" + l_default_value + "]")
						end
						output.put_string (" ")
						input.read_line
						s := STRING_.cloned_string (input.last_string)
						if s.count = 0 then
							if attached default_value as l_default_value then
								s := l_default_value
							else
								s := Void
							end
						end
						if attached validargs as l_validargs and then l_valid_args /= Void then
							if s = Void or else not l_valid_args.has (s) then
								s := Void
								output.put_string (" -> Invalid answer's value. %N")
								output.put_string ("    Valid values: " + l_validargs + "%N")
							end
						end
						if attached validregexp as l_validregexp and then regexp /= Void then
							if s = Void or else not regexp.matches (s) then
								s := Void
								output.put_string (" -> Invalid answer's format. %N")
								output.put_string ("    Valid format: /" + l_validregexp + "/%N")
							end
						end
						if l_answer_required and s = Void then
							s := Void
							output.put_string (" -> Answer is required.%N")
						end
					end
					project.set_variable_value (l_variable, s)
					exit_code := 0
				end
			end
		end

end
