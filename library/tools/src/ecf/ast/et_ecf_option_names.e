note

	description:

		"ECF option names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_OPTION_NAMES

feature -- Names

	assertions_check_option_name: STRING = "check"
			-- Name of "assertions" option "check"
			--
			-- Values: true|false

	assertions_invariant_option_name: STRING = "invariant"
			-- Name of "assertions" option "invariant"
			--
			-- Values: true|false

	assertions_loop_option_name: STRING = "loop"
			-- Name of "assertions" option "loop"
			--
			-- Values: true|false

	assertions_postcondition_option_name: STRING = "postcondition"
			-- Name of "assertions" option "postcondition"
			--
			-- Values: true|false

	assertions_precondition_option_name: STRING = "precondition"
			-- Name of "assertions" option "precondition"
			--
			-- Values: true|false

	assertions_supplier_precondition_option_name: STRING = "supplier_precondition"
			-- Name of "assertions" option "supplier_precondition"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.2.0.

	cat_call_detection_option_name: STRING = "cat_call_detection"
			-- Name of option "cat_call_detection"
			--
			-- Values: none|conformance|all
			-- Was: true|false until ECF 1.13.0 included.
			--
			-- Note: introduced in ECF 1.10.0.
			-- Note: superseded by the capability "catcall_detection" in ECF 1.16.0.

	debug_option_name: STRING = "debug"
			-- Name of option "debug"
			--
			-- Values: true|false

	full_class_checking_option_name: STRING = "full_class_checking"
			-- Name of option "full_class_checking"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.2.0.

	is_attached_by_default_option_name: STRING = "is_attached_by_default"
			-- Name of option "is_attached_by_default"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.3.0.

	is_obsolete_iteration_option_name: STRING = "is_obsolete_iteration"
			-- Name of option "is_obsolete_iteration"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.22.0.

	is_obsolete_routine_type_option_name: STRING = "is_obsolete_routine_type"
			-- Name of option "is_obsolete_routine_type"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.15.0.			

	is_void_safe_option_name: STRING = "is_void_safe"
			-- Name of option "is_void_safe"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.3.0.
			-- Note: superseded by "void_safety" in ECF 1.5.0,
			--       where "false" had the meaning of "none",
			--       and "true" had the meaning of "all" in ECF 1.5.0, and then "transitional" in ECF 1.11.0.
			-- Note: introduced again in ECF 1.9.0.
			-- Note: merged into "void_safety" in ECF 1.11.0,
			--       where "true" had the meaning of "all",
			--       and "false" was just ignored.

	manifest_array_type_option_name: STRING = "manifest_array_type"
			-- Name of option "manifest_array_type"
			--
			-- Values: mismatch_error|mismatch_warning|standard
			--
			-- Note: introduced in ECF 1.18.0.
			-- Note that this option is different from the old warning with the
			-- same name which has been removed in ECF 1.18.0.

	msil_application_optimize_option_name: STRING = "msil_application_optimize"
			-- Name of option "msil_application_optimize"
			--
			-- Values: true|false

	namespace_option_name: STRING = "namespace"
			-- Name of option "namespace"
			--
			-- Values: string

	optimize_option_name: STRING = "optimize"
			-- Name of option "optimize"
			--
			-- Values: true|false

	profile_option_name: STRING = "profile"
			-- Name of option "profile"
			--
			-- Values: true|false

	syntax_option_name: STRING = "syntax"
			-- Name of option "syntax"
			--
			-- Values: obsolete|transitional|standard|provisional
			--
			-- Note: introduced in ECF 1.5.0.

	syntax_level_option_name: STRING = "syntax_level"
			-- Name of option "syntax_level"
			--
			-- Values: 0|1|2
			--
			-- Note: introduced in ECF 1.4.0.
			-- Note: superseded by "syntax" in ECF 1.5.0.

	trace_option_name: STRING = "trace"
			-- Name of option "trace"
			--
			-- Values: true|false

	void_safety_option_name: STRING = "void_safety"
			-- Name of option "void_safety"
			--
			-- Values: none|conformance|initialization|transitional|all
			-- Was: none|initialization|all until ECF 1.10.0 included,
			--      where "all" had the meaning of "transitional".
			--
			-- Note: introduced in ECF 1.5.0.
			-- Note: superseded by the capability "void_safety" in ECF 1.16.0.

	warning_option_name: STRING = "warning"
			-- Name of option "warning"
			--
			-- Values: none|warning|error
			-- Was: true|false until ECF 1.20.0 included,
			--      where "false" had the meaning of "none"
			--      and "true" has the meaning of "warning".

	warning_export_class_missing_option_name: STRING = "export_class_missing"
			-- Name of "warning" option "export_class_missing"
			--
			-- Values: true|false

	warning_manifest_array_type_name: STRING = "manifest_array_type"
			-- Name of "warning" option "manifest_array_type"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.17.0.
			-- Note: removed in ECF 1.18.0.
			-- Note that this warning is different from the option and setting
			-- with the same name which have been introduced in ECF 1.18.0.

	warning_obsolete_class_option_name: STRING = "obsolete_class"
			-- Name of "warning" option "obsolete_class"
			--
			-- Values: true|false

	warning_obsolete_feature_option_name: STRING = "obsolete_feature"
			-- Name of "warning" option "obsolete_feature"
			--
			-- Values: none|current|all
			-- Was: true|false until ECF 1.20.0 included,
			--      where "false" had the meaning of "none"
			--      and "true" has the meaning of "current".


	warning_old_verbatim_strings_option_name: STRING = "old_verbatim_strings"
			-- Name of "warning" option "old_verbatim_strings"
			--
			-- Values: true|false

	warning_once_in_generic_option_name: STRING = "once_in_generic"
			-- Name of "warning" option "once_in_generic"
			--
			-- Values: true|false

	warning_option_unknown_class_option_name: STRING = "option_unknown_class"
			-- Name of "warning" option "option_unknown_class"
			--
			-- Values: true|false

	warning_renaming_unknown_class_option_name: STRING = "renaming_unknown_class"
			-- Name of "warning" option "renaming_unknown_class"
			--
			-- Values: true|false

	warning_same_uuid_option_name: STRING = "same_uuid"
			-- Name of "warning" option "same_uuid"
			--
			-- Values: true|false

	warning_syntax_option_name: STRING = "syntax"
			-- Name of "warning" option "syntax"
			--
			-- Values: true|false

	warning_unused_local_option_name: STRING = "unused_local"
			-- Name of "warning" option "unused_local"
			--
			-- Values: true|false

	warning_vjrv_option_name: STRING = "vjrv"
			-- Name of "warning" option "vjrv"
			--
			-- Values: true|false

	warning_vwab_option_name: STRING = "vwab"
			-- Name of "warning" option "vwab"
			--
			-- Values: true|false
			--
			-- Note: introduced in ECF 1.10.0.

	warning_vweq_option_name: STRING = "vweq"
			-- Name of "warning" option "vweq"
			--
			-- Values: true|false

feature -- Values

	all_option_value: STRING = "all"
			-- Value "all"
			--
			-- Used in "cat_call_detection", "void_safety" and "warning" option "obsolete_feature".

	conformance_option_value: STRING = "conformance"
			-- Value "conformance"
			--
			-- Used in "cat_call_detection" and "void_safety".

	current_option_value: STRING = "current"
			-- Value "current"
			--
			-- Used in "warning" option "obsolete_feature".

	error_option_value: STRING = "error"
			-- Value "error"
			--
			-- Used in "warning".

	false_option_value: STRING = "false"
			-- Value "false"

	initialization_option_value: STRING = "initialization"
			-- Value "initialization"
			--
			-- Used in "void_safety".

	mismatch_error_option_value: STRING = "mismatch_error"
			-- Value "mismatch_error"
			--
			-- Used in "manifest_array_type".

	mismatch_warning_option_value: STRING = "mismatch_warning"
			-- Value "mismatch_warning"
			--
			-- Used in "manifest_array_type".

	none_option_value: STRING = "none"
			-- Value "none"
			--
			-- Used in "cat_call_detection", "void_safety", "warning" and
			-- "warning" option "obsolete_feature".

	obsolete_option_value: STRING = "obsolete"
			-- Value "obsolete"
			--
			-- Used in "syntax".

	provisional_option_value: STRING = "provisional"
			-- Value "provisional"
			--
			-- Used in "syntax".

	standard_option_value: STRING = "standard"
			-- Value "standard"
			--
			-- Used in "syntax" and "manifest_array_type".

	transitional_option_value: STRING = "transitional"
			-- Value "transitional"
			--
			-- Used in "syntax" and "void_safety".

	true_option_value: STRING = "true"
			-- Value "true"

	warning_option_value: STRING = "warning"
			-- Value "warning"
			--
			-- Used in "warning".

end
