indexing

	description:

		"Map"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_MAP

inherit

	ANY

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Create a new fileset.
		require
			project_not_void: a_project /= Void
		do
			project := a_project

				-- Set default type:
			set_type (Type_attribute_value_identity)
		ensure
			project_set: project = a_project
			type_set_to_identity: type.is_equal (Type_attribute_value_identity)
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

feature -- Status report

	is_executable: BOOLEAN is
			-- Can element be executed?
		do
			Result := type /= Void and then
				(type.is_equal (Type_attribute_value_identity) or else
				type.is_equal (Type_attribute_value_flat) or else
				type.is_equal (Type_attribute_value_merge) or else
				type.is_equal (Type_attribute_value_glob))
			if not Result then
				project.log ("  [map] error: value of attribute 'type' incorrect. Valid: {'flat', 'glob', 'identity', 'merge'}%N")
			end
			if Result then
				if type.is_equal (Type_attribute_value_identity) then
					Result := source_pattern = Void
					if not Result then
						project.log ("  [map] error: attribute 'from' must not be set when 'type' is 'identity'%N")
					end
					if Result then
						Result := target_pattern = Void
						if not Result then
							project.log ("  [map] error: attribute 'to' must not be set when 'type' is 'identity'%N")
						end
					end
				end
				if type.is_equal (Type_attribute_value_glob) then
					Result := source_pattern /= Void and then source_pattern.index_of ('*', 1) > 0
					if not Result then
						project.log ("  [map] error: in mode 'glob' attribute 'from' must be set and contain a '*' character%N")
					end
					if Result then
						Result := target_pattern /= Void and then target_pattern.index_of ('*', 1) > 0
						if not Result then
							project.log ("  [map] error: in mode 'glob' attribute 'to' must be set and contain a '*' character%N")
						end
					end
				end
			end
			if Result and then map /= Void then
				Result := map.is_executable
				if not Result then
					project.log ("  [map] error: nested element 'map' is not defined correctly%N")
				end
			end

		ensure
			type_name_not_void: Result implies type /= Void
			type_supported: Result implies
				type.is_equal (Type_attribute_value_identity) or else
				type.is_equal (Type_attribute_value_flat) or else
				type.is_equal (Type_attribute_value_merge) or else
				type.is_equal (Type_attribute_value_glob)

			good_glob_source: Result implies type.is_equal (Type_attribute_value_glob) implies
				source_pattern /= Void and then source_pattern.index_of ('*', 1) > 0

			good_glob_target: Result implies type.is_equal (Type_attribute_value_glob) implies
				target_pattern /= Void and then target_pattern.index_of ('*', 1) > 0

			nested_map_executable: Result implies map /= Void implies map.is_executable
		end

feature -- Access

	type: STRING
			-- Mapping type

	source_pattern: STRING
			-- Source pattern for mapping

	target_pattern: STRING
			-- Target pattern for mapping

	map: GEANT_MAP
			-- Nested Map

	mapped_filename (a_filename: STRING): STRING is
			-- Mapped `a_filename' according to patterns
			-- `source_pattern' and `target_pattern'
			-- depending on `type'
			-- If nested `map' is not Void `map.mapped_filename (a_filename)'
			-- is taken as input for this routine instead of `a_filename'
		require
			a_filename_not_void: a_filename /= Void
			is_executable: is_executable
		local
			s: STRING
			a_map_filename: STRING
			source_prefix: STRING
			source_postfix: STRING
			filename_prefix: STRING
			filename_postfix: STRING
			target_prefix: STRING
			target_postfix: STRING
			a_exit_code: INTEGER
		do
			if map /= Void then
				if map.is_executable then
					a_map_filename := map.mapped_filename (a_filename)
				else
					project.log ("  [map] error: map definition wrong%N")
					a_exit_code := 1
				end
			else
				a_map_filename := clone (a_filename)
			end
			if a_exit_code = 0 then
				if type.is_equal (Type_attribute_value_identity) then
						-- handle identity mapping:
					Result := clone (a_map_filename)
				elseif type.is_equal (Type_attribute_value_flat) then
						-- handle flat mapping:
					Result := clone (unix_file_system.basename (a_map_filename))
				elseif type.is_equal (Type_attribute_value_merge) then
						-- handle merge mapping:
					Result := clone (target_pattern)
				else
						-- handle glob mapping:
					check type_is_glob: type.is_equal (Type_attribute_value_glob) end
					source_prefix := glob_prefix (source_pattern)
					source_postfix := glob_postfix (source_pattern)
					target_prefix := glob_prefix (target_pattern)
					target_postfix := glob_postfix (target_pattern)
	
					filename_prefix := clone (a_map_filename)
					filename_prefix.head (source_prefix.count)
					filename_postfix := clone (a_map_filename)
					filename_postfix.tail (source_postfix.count)
	
					if
						filename_prefix.is_equal (source_prefix) and
						filename_postfix.is_equal (source_postfix)
					then
						s := clone (a_map_filename)
	
	--					s.remove_head (filename_prefix.count) -- Not supported in HACT 4.0.1 and ISE 5.1
						s := string_remove_head (s, filename_prefix.count) -- workaround
	--					s.remove_tail (filename_postfix.count) -- Not supported in HACT 4.0.1 and ISE 5.1
						s := string_remove_tail (s, filename_postfix.count) -- workaround
	
						Result := clone (target_prefix)
						Result.append_string (s)
						Result.append_string (target_postfix)
					else
						project.trace_debug ("  [*map] no match for '" + a_map_filename + "'%N")
						Result := clone (a_map_filename)
					end
				end
				project.trace_debug ("  [*map] mapping '" + a_map_filename + "' to '" + Result + "'%N")
			end
		ensure
			Result_not_void: Result /= Void
		end

feature -- Setting

	set_type (a_type: STRING) is
			-- Set `type' to `a_type'.
		require
			type_not_void: a_type /= Void
			type_supported:
				a_type.is_equal (Type_attribute_value_identity) or else
				a_type.is_equal (Type_attribute_value_flat) or else
				a_type.is_equal (Type_attribute_value_merge) or else
				a_type.is_equal (Type_attribute_value_glob)
		do
			type := a_type
		ensure
			type_set: type.is_equal (a_type)
		end

	set_source_pattern (a_source_pattern: like source_pattern) is
			-- Set `source_pattern' to `a_source_pattern'.
		require
			a_source_pattern_not_void: a_source_pattern /= Void
		do
			source_pattern := a_source_pattern
		ensure
			source_pattern_set: source_pattern = a_source_pattern
		end

	set_target_pattern (a_target_pattern: like target_pattern) is
			-- Set `target_pattern' to `a_target_pattern'.
		require
			a_target_pattern_not_void: a_target_pattern /= Void
		do
			target_pattern := a_target_pattern
		ensure
			target_pattern_set: target_pattern = a_target_pattern
		end

	set_map (a_map: like map) is
			-- Set `map' to `a_map'.
		require
			a_map_not_void: a_map /= Void
		do
			map := a_map
		ensure
			map_set: map = a_map
		end

feature -- Constants

	Type_attribute_value_identity: STRING is
			-- Value 'identity' of xml attribute for type
		once
			Result := "identity"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_flat: STRING is
			-- Value 'flat' of xml attribute for type
		once
			Result := "flat"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_merge: STRING is
			-- Value 'merge' of xml attribute for type
		once
			Result := "merge"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_glob: STRING is
			-- Value 'glob' of xml attribute for type
		once
			Result := "glob"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

--!! '\1' syntax has to be supported for regexp first.
--	Type_attribute_value_regexp: UC_STRING is
--			-- Value 'regexp' of xml attribute for type
--		once
--			Result := new_unicode_string ("regexp")
--		ensure
--			attribute_name_not_void: Result /= Void
--			atribute_name_not_empty: Result.count > 0
--		end

end -- class GEANT_MAP
