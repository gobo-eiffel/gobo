indexing



	description:



		"Input commands"



	library: "Gobo Eiffel Ant"

	copyright: "Copyright (c) 2006, Sven Ehrke and others"

	license: "Eiffel Forum License v2 (see forum.txt)"

	date: "$Date$"

	revision: "$Revision$"



class GEANT_INPUT_COMMAND



inherit



	GEANT_COMMAND



	KL_STANDARD_FILES

		export {NONE} all end



create



	make



feature -- Status report



	is_executable : BOOLEAN is

			-- Can command be executed?

		do

			Result := (name /= Void and then name.count > 0) and message /= Void

		ensure then

			name_not_void: Result implies name /= Void

			name_not_empty: Result implies name.count > 0

			message_not_void: Result implies message /= Void

		end



feature -- Access



	name: STRING

			-- Name of variable



	message: STRING

			-- Question to fill variable



	default_value: STRING

			-- Default answer



	validargs: STRING

			-- validargs

			-- comma separated String containing valid input arguments.

			-- If set, input task will reject any input not defined here.

			-- Validargs are compared case sensitive.

			-- If you want 'a' and 'A' to be accepted you will need to define both arguments

			-- within validargs			



	answer_required: BOOLEAN

			-- Answer required (non empty answer allowed)



feature -- Setting



	set_name (a_name: like name) is

			-- Set `name' to `a_name'.

		require

			a_name_not_void: a_name /= Void

			a_name_not_empty: a_name.count > 0

		do

			name := a_name

		ensure

			name_set: name = a_name

		end



	set_message (a_message: like message) is

			-- Set `message' to `a_message'.

		require

			a_message_not_void: a_message /= Void

		do

			message := a_message

		ensure

			message_set: message = a_message

		end



	set_default_value (a_default_value: like default_value) is

			-- Set `default_value' to `a_default_value'.

		require

			a_default_value_not_void: a_default_value /= Void

		do

			default_value := a_default_value

		ensure

			default_value_set: default_value = a_default_value

		end



	set_answer_required (a_answer_required: like answer_required) is

			-- Set `answer_required' to `a_answer_required'.

		do

			answer_required := a_answer_required

		ensure

			answer_required_set: answer_required = a_answer_required

		end



	set_validargs (a_validargs: like validargs) is

			-- Set `validargs' to `a_validargs'.

		require

			a_validargs_not_void: a_validargs /= Void

		do

			validargs := a_validargs

		ensure

			validargs_set: validargs = a_validargs

		end



feature -- Execution



	execute is

			-- Put variable in project variables pool.

		local

			s: STRING

			l_answer_required: BOOLEAN

		do

			l_answer_required := answer_required

			exit_code := 0

			from

			until

				s /= Void

			loop

				project.trace (<<"  [input] name=", name, " message=%"", message, "%"">>)

				output.put_string (message)

				if default_value /= Void then

					output.put_string (" default=[" + default_value + "]")

				end

				output.put_string (" ")

				input.read_line

				s := STRING_.cloned_string (input.last_string)

				if s.count = 0 then

					if default_value /= Void then

						s := default_value

					elseif l_answer_required then

						s := Void

						output.put_string (" -> Answer is required.%N")

					end

				elseif validargs /= Void then

					if not STRING_.has_substring (validargs, s) then

						s := Void

						output.put_string (" -> Answer is not valid. %N")

						output.put_string ("    valid values: " + validargs + "%N")

					end

				end

			end

			project.variables.set_variable_value (name, s)

			exit_code := 0

		end



end

