note

	description:

		"Map"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_MAP

inherit

	ANY

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Create a new fileset.
		require
			project_not_void: a_project /= Void
		do
			project := a_project
				-- Set default type:
			set_type (Type_attribute_value_identity)
		ensure
			project_set: project = a_project
			type_set_to_identity: type = Type_attribute_value_identity
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

feature -- Status report

	is_executable: BOOLEAN
			-- Can element be executed?
		do
			Result := type /= Void and then
				(STRING_.same_string (type, Type_attribute_value_identity) or else
				STRING_.same_string (type, Type_attribute_value_flat) or else
				STRING_.same_string (type, Type_attribute_value_merge) or else
				STRING_.same_string (type, Type_attribute_value_regexp) or else
				STRING_.same_string (type, Type_attribute_value_glob))
			if not Result then
				project.log (<<"  [map] error: value of attribute 'type' incorrect. Valid: {'flat', 'glob', 'regexp', 'identity', 'merge'}">>)
			end
			if Result then
				if STRING_.same_string (type, Type_attribute_value_identity) then
					Result := source_pattern = Void
					if not Result then
						project.log (<<"  [map] error: attribute 'from' must not be set when 'type' is 'identity'">>)
					end
					if Result then
						Result := target_pattern = Void
						if not Result then
							project.log (<<"  [map] error: attribute 'to' must not be set when 'type' is 'identity'">>)
						end
					end
				end
				if STRING_.same_string (type, Type_attribute_value_glob) then
					Result := attached source_pattern as l_source_pattern and then l_source_pattern.index_of ('*', 1) > 0
					if not Result then
						project.log (<<"  [map] error: in mode 'glob' attribute 'from' must be set and contain a '*' character">>)
					end
					if Result then
						Result := attached target_pattern as l_target_pattern and then l_target_pattern.index_of ('*', 1) > 0
						if not Result then
							project.log (<<"  [map] error: in mode 'glob' attribute 'to' must be set and contain a '*' character">>)
						end
					end
				end
			end
			if Result and then attached map as l_map then
				Result := l_map.is_executable
				if not Result then
					project.log (<<"  [map] error: nested element 'map' is not defined correctly">>)
				end
			end
		ensure
			type_name_not_void: Result implies type /= Void
			type_supported: Result implies
				(STRING_.same_string (type, Type_attribute_value_identity) or else
				STRING_.same_string (type, Type_attribute_value_flat) or else
				STRING_.same_string (type, Type_attribute_value_merge) or else
				STRING_.same_string (type, Type_attribute_value_regexp) or else
				STRING_.same_string (type, Type_attribute_value_glob))
			good_glob_source: Result implies (STRING_.same_string (type, Type_attribute_value_glob) implies
				(attached source_pattern as l_source_pattern and then l_source_pattern.index_of ('*', 1) > 0))
			good_glob_target: Result implies (STRING_.same_string (type, Type_attribute_value_glob) implies
				(attached target_pattern as l_target_pattern and then l_target_pattern.index_of ('*', 1) > 0))
			nested_map_executable: Result implies (attached map as l_map implies l_map.is_executable)
		end

feature -- Access

	type: STRING
			-- Mapping type

	source_pattern: detachable STRING
			-- Source pattern for mapping

	target_pattern: detachable STRING
			-- Target pattern for mapping

	map: detachable GEANT_MAP
			-- Nested Map

	mapped_filename (a_filename: STRING): STRING
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
			a_map_filename: detachable STRING
			source_prefix: STRING
			source_postfix: STRING
			filename_prefix: STRING
			filename_postfix: STRING
			target_prefix: STRING
			target_postfix: STRING
			regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			if attached map as l_map then
				if l_map.is_executable then
					a_map_filename := l_map.mapped_filename (a_filename)
				else
					project.log (<<"  [map] error: map definition wrong">>)
				end
			else
				a_map_filename := a_filename
			end
			if a_map_filename /= Void then
				if STRING_.same_string (type, Type_attribute_value_identity) then
						-- handle identity mapping:
					Result := a_map_filename
				elseif STRING_.same_string (type, Type_attribute_value_flat) then
						-- handle flat mapping:
					Result := unix_file_system.basename (a_map_filename)
				elseif STRING_.same_string (type, Type_attribute_value_merge) then
						-- handle merge mapping:
					if attached target_pattern as l_target_pattern then
						Result := l_target_pattern
					else
						Result := ""
					end
				elseif STRING_.same_string (type, Type_attribute_value_regexp) then
						-- handle regexp mapping:
					if attached source_pattern as l_source_pattern and attached target_pattern as l_target_pattern then
						create regexp.make
						regexp.compile (l_source_pattern)
						if regexp.is_compiled then
							regexp.match (a_map_filename)
							if regexp.has_matched then
								Result := regexp.replace_all (l_target_pattern)
							else
								project.trace_debug (<<"  [*map] no match for '", a_map_filename, "%'">>)
								Result := a_map_filename
							end
						else
							Result := a_map_filename
							project.log (<<"regexp ", l_source_pattern," could not be compiled">>)
						end
					else
						Result := a_map_filename
						project.trace_debug (<<"  [*map] no match for '", a_map_filename, "%'">>)
					end
				elseif attached source_pattern as l_source_pattern and attached target_pattern as l_target_pattern then
						-- handle glob mapping:
					check type_is_glob: STRING_.same_string (type, Type_attribute_value_glob) end
					source_prefix := glob_prefix (l_source_pattern)
					source_postfix := glob_postfix (l_source_pattern)
					target_prefix := glob_prefix (l_target_pattern)
					target_postfix := glob_postfix (l_target_pattern)
					filename_prefix := STRING_.cloned_string (a_map_filename)
					filename_prefix.keep_head (source_prefix.count)
					filename_postfix := STRING_.cloned_string (a_map_filename)
					filename_postfix.keep_tail (source_postfix.count)
					if
						STRING_.same_string (filename_prefix, source_prefix) and
						STRING_.same_string (filename_postfix, source_postfix)
					then
						s := STRING_.cloned_string (a_map_filename)
						s.remove_head (filename_prefix.count)
						s.remove_tail (filename_postfix.count)
						Result := STRING_.cloned_string (target_prefix)
						Result := STRING_.appended_string (Result, s)
						Result := STRING_.appended_string (Result, target_postfix)
					else
						project.trace_debug (<<"  [*map] no match for '", a_map_filename, "%'">>)
						Result := a_map_filename
					end
				else
					Result := ""
				end
				project.trace_debug (<<"  [*map] mapping '", a_map_filename, "' to '", Result, "%'">>)
			else
				Result := ""
			end
		ensure
			mapped_filename_not_void: Result /= Void
		end

feature -- Setting

	set_type (a_type: STRING)
			-- Set `type' to `a_type'.
		require
			type_not_void: a_type /= Void
			type_supported:
				STRING_.same_string (a_type, Type_attribute_value_identity) or else
				STRING_.same_string (a_type, Type_attribute_value_flat) or else
				STRING_.same_string (a_type, Type_attribute_value_merge) or else
				STRING_.same_string (a_type, Type_attribute_value_glob)
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

	set_source_pattern (a_source_pattern: like source_pattern)
			-- Set `source_pattern' to `a_source_pattern'.
		require
			a_source_pattern_not_void: a_source_pattern /= Void
		do
			source_pattern := a_source_pattern
		ensure
			source_pattern_set: source_pattern = a_source_pattern
		end

	set_target_pattern (a_target_pattern: like target_pattern)
			-- Set `target_pattern' to `a_target_pattern'.
		require
			a_target_pattern_not_void: a_target_pattern /= Void
		do
			target_pattern := a_target_pattern
		ensure
			target_pattern_set: target_pattern = a_target_pattern
		end

	set_map (a_map: like map)
			-- Set `map' to `a_map'.
		require
			a_map_not_void: a_map /= Void
		do
			map := a_map
		ensure
			map_set: map = a_map
		end

feature -- Constants

	Type_attribute_value_identity: STRING
			-- Value 'identity' of xml attribute for type
		once
			Result := "identity"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_flat: STRING
			-- Value 'flat' of xml attribute for type
		once
			Result := "flat"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_merge: STRING
			-- Value 'merge' of xml attribute for type
		once
			Result := "merge"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_glob: STRING
			-- Value 'glob' of xml attribute for type
		once
			Result := "glob"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Type_attribute_value_regexp: STRING
			-- Value 'regexp' of xml attribute for type
		once
			Result := "regexp"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
