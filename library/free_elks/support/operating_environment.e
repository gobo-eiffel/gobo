note
	description: "The objects available from the operating system"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class OPERATING_ENVIRONMENT

feature

	Directory_separator: CHARACTER
			-- Character used to separate subdirectories in a path name on this platform.
			--| To build portable path names, use PATH_NAME and its descendants.
		once
			Result := c_dir_separator
		end

	Current_directory_name_representation: STRING
			-- Representation of the current directory
		once
			Result := eif_current_dir_representation
		end

	home_directory_supported: BOOLEAN
			-- Is the notion of home directory supported on this platform?
		external
			"C use %"eif_path_name.h%""
		alias
			"eif_home_dir_supported"
		end

	root_directory_supported: BOOLEAN
			-- Is the notion of root directory supported on this platform?
		external
			"C use %"eif_path_name.h%""
		alias
			"eif_root_dir_supported"
		end

	case_sensitive_path_names: BOOLEAN
			-- Are path names case sensitive?
		external
			"C use %"eif_path_name.h%""
		alias
			"eif_case_sensitive_path_names"
		end

feature {NONE} -- Implementation

	c_dir_separator: CHARACTER
		external
			"C use %"eif_dir.h%""
		alias
			"eif_dir_separator"
		end

	eif_current_dir_representation: STRING
		external
			"C use %"eif_path_name.h%""
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
