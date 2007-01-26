indexing
	description: "Find out if two paths corresponds to exactly the same file."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2006, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	FILE_COMPARER

feature -- Comparison

	same_files (a_path1, a_path2: STRING): BOOLEAN is
			-- Are `a_path1' and `a_path1'
		require
			a_path1_not_void: a_path1 /= Void
			a_path1_not_empty: not a_path1.is_empty
			a_path2_not_void: a_path2 /= Void
			a_path2_not_empty: not a_path2.is_empty
		local
			l_p1, l_p2: C_STRING
		do
			create l_p1.make (a_path1)
			create l_p2.make (a_path2)
			Result := c_same_files (l_p1.item, l_p2.item)
		end

feature {NONE} -- Implementation

	c_same_files (a_path1, a_path2: POINTER): BOOLEAN is
			-- Do C paths `a_path1' and `a_path2' represent the same file?
		require
			a_path1_not_null: a_path1 /= default_pointer
			a_path2_not_null: a_path2 /= default_pointer
		external
			"C inline use %"eif_eiffel.h%""
		alias
			"[
				EIF_BOOLEAN Result = EIF_FALSE;
			#ifdef EIF_WINDOWS
					/* To check this, we use `CreateFileA' to open both file, and then using the information
					 * returned by `GetFileInformationByHandle' we can check whether or not they are indeed
					 * the same.
					 * Note: it is important to use the A version of CreateFileA because arguments
					 * are ASCII strings, not unicode. */
				BY_HANDLE_FILE_INFORMATION l_path1_info, l_path2_info;
				HANDLE l_path2_file = CreateFileA ((LPCSTR) $a_path2, GENERIC_READ, FILE_SHARE_READ, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
				HANDLE l_path1_file = CreateFileA ((LPCSTR) $a_path1, GENERIC_READ, FILE_SHARE_READ, NULL,
						OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			
				if ((l_path2_file == INVALID_HANDLE_VALUE) || (l_path1_file == INVALID_HANDLE_VALUE)) {
						/* We do not need the handles anymore, simply close them. Since Microsoft
						 * API accepts INVALID_HANDLE_VALUE we don't check the validity of arguments. */
					CloseHandle(l_path2_file);
					CloseHandle(l_path1_file);
				} else {
					BOOL success = GetFileInformationByHandle (l_path2_file, &l_path2_info);
					success = success && GetFileInformationByHandle (l_path1_file, &l_path1_info);
						/* We do not need the handles anymore, simply close them. */
					CloseHandle(l_path2_file);
					CloseHandle(l_path1_file);
					if (success) {
							/* Check that `path2' and `path1' do not represent the same file. */
						if
							((l_path2_info.dwVolumeSerialNumber == l_path1_info.dwVolumeSerialNumber) &&
							(l_path2_info.nFileIndexLow == l_path1_info.nFileIndexLow) &&
							(l_path2_info.nFileIndexHigh == l_path1_info.nFileIndexHigh))
						{
							Result = EIF_TRUE;
						}
					}
				}
			#else
				struct stat buf1, buf2;
				int status;
				#ifdef HAS_LSTAT
				status = lstat($a_path1, &buf1);
				if (status == 0) {
						/* We found a file, now let's check if it is not a symbolic link. If it is, we use `stat'
					 	 * to ensure the validity of the link. */
					if ((buf1.st_mode & S_IFLNK) == S_IFLNK) {
						status = stat ($a_path1, &buf1);
					}
				}
				
				if (status == 0) {
					status = lstat($a_path2, &buf2);
					if (status == 0) {
							/* We found a file, now let's check if it is not a symbolic link. If it is, we use `stat'
						 	 * to ensure the validity of the link. */
						if ((buf2.st_mode & S_IFLNK) == S_IFLNK) {
							status = stat ($a_path2, &buf2);
						}
					}
				}
				#else
				status = stat ($a_path1, &buf1);
				if (status == 0) {
					status = stat ($a_path2, &buf2);
				}
				#endif
				if (status == 0) {
						/* Both files are present, check they represent the same one. */
					if ((buf1.st_dev == buf2.st_dev) && (buf1.st_ino == buf2.st_ino)) {
						Result = EIF_TRUE;
					}
				}
			#endif
				return Result;
			]"
		end

end
