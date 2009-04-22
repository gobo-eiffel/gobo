indexing

	description:

		"ECF file rules"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_FILE_RULE

inherit

	ET_ECF_CONDITIONED

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_exclude: like exclude; a_include: like include) is
			-- Create a new file rule.
		require
			no_void_exclude: a_exclude /= Void implies not a_exclude.has_void
			no_void_include: a_include /= Void implies not a_include.has_void
		do
			exclude := a_exclude
			include := a_include
			exclude_regexp := compile_regexp (exclude)
			include_regexp := compile_regexp (include)
		ensure
			exclude_set: exclude = a_exclude
			include_set: include = a_include
		end

feature -- Status report

	is_included (a_pathname: STRING): BOOLEAN is
			-- Is `a_pathname' included according to the exclude/include rules?
			-- That means it is either not excluded or it is included.
		do
			Result := True
			if exclude_regexp /= Void and then exclude_regexp.is_compiled then
				exclude_regexp.match (a_pathname)
				if exclude_regexp.has_matched then
					Result := False
					if include_regexp /= Void and then include_regexp.is_compiled then
							-- It's excluded, check if there is an include that matches
						include_regexp.match (a_pathname)
						Result := include_regexp.has_matched
					end
				end
			end
		end

feature -- Access

	exclude: DS_HASH_SET [STRING]
			-- Exclude patterns

	include: DS_HASH_SET [STRING]
			-- Include patterns

feature {NONE} -- Implementation

	exclude_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Exclude regular expression

	include_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Include regular expression

	compile_regexp (a_patterns: DS_HASH_SET [STRING]): RX_PCRE_REGULAR_EXPRESSION is
			-- Compile `a_patterns' into a regular expression
		local
			l_cursor: DS_HASH_SET_CURSOR [STRING]
			l_regexp_str: STRING
		do
			if a_patterns /= Void and then not a_patterns.is_empty then
				create l_regexp_str.make (50)
				l_cursor := a_patterns.new_cursor
				from l_cursor.start until l_cursor.after loop
					if not l_regexp_str.is_empty then
						l_regexp_str.append_character ('|')
					end
					l_regexp_str.append_character ('(')
					l_regexp_str.append_string (l_cursor.item)
					l_regexp_str.append_character (')')
					l_cursor.forth
				end
				create Result.make
				if operating_system.is_windows then
					Result.set_caseless (True)
				end
				Result.compile (l_regexp_str)
			end
		end

invariant

	no_void_exclude: exclude /= Void implies not exclude.has_void
	no_void_include: include /= Void implies not include.has_void

end
