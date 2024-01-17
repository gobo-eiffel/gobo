note

	description:

		"ECF capability names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_CAPABILITY_NAMES

feature -- Names

	catcall_detection_capability_name: STRING = "catcall_detection"
			-- Name of capability "catcall_detection"
			--
			-- Values: none|conformance|all
			-- Note: ordered (none<conformance<all).

	concurrency_capability_name: STRING = "concurrency"
			-- Name of "support" capability "concurrency"
			--
			-- Values: thread|none|scoop
			-- Note: ordered (thread<none<scoop).

	void_safety_capability_name: STRING = "void_safety"
			-- Name of "support" capability "void_safety"
			--
			-- Values: none|conformance|initialization|transitional|all
			-- Note: ordered (none<conformance<initialization<transitional<all).

feature -- Values

	all_capability_value: STRING = "all"
			-- Value "all"
			--
			-- Used in "catcall_detection" and "void_safety".

	conformance_capability_value: STRING = "conformance"
			-- Value "conformance"
			--
			-- Used in "catcall_detection" and "void_safety".

	initialization_capability_value: STRING = "initialization"
			-- Value "initialization"
			--
			-- Used in "void_safety".

	none_capability_value: STRING = "none"
			-- Value "none"
			--
			-- Used in "catcall_detection", "concurrency" and "void_safety".

	scoop_capability_value: STRING = "scoop"
			-- Value "scoop"
			--
			-- Used in "concurrency".

	thread_capability_value: STRING = "thread"
			-- Value "thread"
			--
			-- Used in "concurrency".

	transitional_capability_value: STRING = "transitional"
			-- Value "transitional"
			--
			-- Used in "void_safety".

	value_separator: CHARACTER = ' '
			-- Separator used in case of multiple values

	value_separators: STRING = " "
			-- Separator used in case of multiple values
			-- (To be used in ST_SPLITTER.)

end
