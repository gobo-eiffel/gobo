indexing

	description:

		"Common properties for GEANT"

	author:     "Sven Ehrke (sven.ehrke@sven-ehrke.de)"
	copyright:  "Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_SHARED_PROPERTIES

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_EXCEPTIONS

feature -- Access

	Commandline_variables: DS_HASH_TABLE [STRING, STRING] is
		-- Variables specified on the commandline using -D
		-- example: -Dname=value
		once
			!! Result.make (10)
		ensure
			Commandline_variables_not_void: Result /= Void
		end

feature -- Processing

	exit_application (a_code: INTEGER; a_message: STRING) is
			-- Exit application with code 1;
			-- if a_message /= Void log it.
		do
			if a_message /= Void then
				print (a_message)
			end
			print ("%NBUILD FAILED!%N")
			Exceptions.die (1)
		end

	string_tokens (a_string: UC_STRING; a_delimiter: CHARACTER): DS_ARRAYED_LIST [UC_STRING] is
			-- Strings delimited by `a_delimiter' in `a_string';
			-- Candidate for STRING_ROUTINES
		require
			string_not_void: a_string /= Void
		local
			a_uc_delimiter: UC_CHARACTER
			s: UC_STRING
			ucs: UC_STRING
			p_start: INTEGER
			p_end: INTEGER
			nice_string: BOOLEAN
		do
			s := clone (a_string)
			!! Result.make (5)
			a_uc_delimiter.make_from_character (a_delimiter)

				-- Cleanup String:
			from
				s.left_adjust
				s.right_adjust
			until
				nice_string
			loop
				nice_string := True
				if s.count > 0 then
					if s.item (1) = a_uc_delimiter then
						s.tail (s.count - 1)
						nice_string := False
					end
				end
	
				if s.count > 0 then
					if s.item (s.count) = a_uc_delimiter then
						s.head (s.count - 1)
						nice_string := False
					end
				end

			end

				-- Find Tokens:
			from
				p_start := 1
				p_end := s.index_of (a_uc_delimiter, p_start)
			until
				p_end = 0 or p_start > s.count
			loop
				ucs := s.substring (p_start, p_end - 1)
				ucs.left_adjust
				ucs.right_adjust
				if ucs.count > 0 then
					Result.force_last (ucs)
				end
				p_start := p_end + 1

				if p_start <= s.count then
					p_end := s.index_of (a_uc_delimiter, p_start)
				end
			end

				-- Append last token:
			if p_start <= s.count then
				ucs := s.substring (p_start, s.count)
				ucs.left_adjust
				ucs.right_adjust
				if ucs.count > 0 then
					Result.force_last (ucs)
				end
			end
		ensure
			string_tokens_not_void: Result /= Void
		end

	is_element_enabled (a_element: GEANT_ELEMENT): BOOLEAN is
			-- Do conditions enable this `a_element'?
			-- conditions is the boolean expression
			-- "(xml attribute 'if') and not
			-- (xml attribute 'unless')"
			-- if xml attribute 'if' is missing it is assumed to be `True'
			-- if xml attribute 'unless' is missing it is assumed to be `False'
		require
			element_not_void: a_element /= Void
		local
			if_condition: BOOLEAN
			unless_condition: BOOLEAN
			ucs: UC_STRING
		do
				-- Set default execution conditions:
			if_condition := true
			unless_condition := false

				-- Look for an 'if' XML attribute
			if a_element.has_attribute (If_attribute_name) then
				ucs := a_element.attribute_value_by_name (If_attribute_name)
				if_condition := project.variables.boolean_condition_value (ucs.out)
				debug ("geant")
					print (" if    : '" + ucs.out + "'=" + if_condition.out + "%N")
				end
			end

				-- Look for an 'unless' XML attribute
			if a_element.has_attribute (Unless_attribute_name) then
				ucs := a_element.attribute_value_by_name (Unless_attribute_name)
				unless_condition := project.variables.boolean_condition_value (ucs.out)
				debug ("geant")
					print (" unless: '" + ucs.out + "'=" + unless_condition.out + "%N")
				end
			end

			Result := if_condition and not unless_condition
		end

end -- class GEANT_SHARED_PROPERTIES
