note

	description:

		"Gec tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2005-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEC_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT)
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_integer_value: INTEGER
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

			if has_attribute (Executable_attribute_name) then
					-- executable_filename (optional)
				a_value := attribute_value_or_default (Executable_attribute_name, "")
				if a_value.count > 0 then
					command.set_executable_filename (a_value)
				end
			end
			if has_attribute (Ace_attribute_name) then
					-- ecf_filename (optional)
				a_value := attribute_value_or_default (Ace_attribute_name, "")
				if a_value.count > 0 then
					command.set_ecf_filename (a_value)
				end
			end
			if has_attribute (Ecf_attribute_name) then
					-- ecf_filename (optional)
				a_value := attribute_value_or_default (Ecf_attribute_name, "")
				if a_value.count > 0 then
					command.set_ecf_filename (a_value)
				end
			end
			if has_attribute (Clean_attribute_name) then
					-- clean:
				a_value := attribute_value_or_default (Clean_attribute_name, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
			end
				-- target:
			if has_attribute (Target_attribute_name) then
				a_value := attribute_value_or_default (Target_attribute_name, "")
				if a_value.count > 0 then
					command.set_target_name (a_value)
				end
			end
				-- c_compile.
			if has_attribute (C_compile_attribute_name) then
				a_value := attribute_value (C_compile_attribute_name)
				if a_value /= Void and then not a_value.is_empty then
					command.set_c_compile (a_value)
				end
			end
				-- finalize.
			if has_attribute (Finalize_attribute_name) then
				command.set_finalize (boolean_value (Finalize_attribute_name))
			end
				-- gelint.
			if has_attribute (Gelint_attribute_name) then
				command.set_gelint (boolean_value (Gelint_attribute_name))
			end
				-- catcall.
			if has_attribute (Catcall_attribute_name) then
				a_value := attribute_value (Catcall_attribute_name)
				if a_value /= Void and then not a_value.is_empty then
					command.set_catcall_mode (a_value)
				end
			end
				-- split.
			if has_attribute (Split_attribute_name) then
				command.set_split_mode (boolean_value (Split_attribute_name))
			end
				-- split_size.
			if has_attribute (Split_size_attribute_name) then
				a_value := attribute_value (Split_size_attribute_name)
				if a_value.is_integer then
					a_integer_value := a_value.to_integer
					if a_integer_value > 0 then
						command.set_split_size (a_integer_value)
					end
				end
			end
				-- gc.
			if has_attribute (Gc_attribute_name) then
				a_value := attribute_value (Gc_attribute_name)
				if a_value /= Void and then not a_value.is_empty then
					command.set_garbage_collector (a_value)
				end
			end
				-- thread.
			if has_attribute (Thread_attribute_name) then
				a_value := attribute_value (Thread_attribute_name)
				if a_value.is_integer then
					a_integer_value := a_value.to_integer
					command.set_thread_count (a_value.to_integer)
				end
			end
				-- new_instance_types.
			if has_attribute (New_instance_types_attribute_name) then
				a_value := attribute_value (New_instance_types_attribute_name)
				if a_value /= Void and then not a_value.is_empty then
					command.set_new_instance_types_filename (a_value)
				end
			end
				-- silent.
			if has_attribute (Silent_attribute_name) then
				command.set_silent_mode (boolean_value (Silent_attribute_name))
			end
				-- verbose.
			if has_attribute (Verbose_attribute_name) then
				command.set_verbose_mode (boolean_value (Verbose_attribute_name))
			end
				-- no_benchmark.
			if has_attribute (No_benchmark_attribute_name) then
				command.set_no_benchmark_mode (boolean_value (No_benchmark_attribute_name))
			end
				-- nested_benchmark.
			if has_attribute (Nested_benchmark_attribute_name) then
				command.set_nested_benchmark_mode (boolean_value (Nested_benchmark_attribute_name))
			end
				-- metrics.
			if has_attribute (Metrics_attribute_name) then
				command.set_metrics_mode (boolean_value (Metrics_attribute_name))
			end
			if has_attribute (Exit_code_variable_attribute_name) then
				a_value := attribute_value (Exit_code_variable_attribute_name)
				if a_value.count > 0 then
					command.set_exit_code_variable_name (a_value)
				end
			end
		end

	build_command (a_project: GEANT_PROJECT)
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_GEC_COMMAND
			-- Compilation commands for gec

feature {NONE} -- Constants

	Executable_attribute_name: STRING
			-- Name of xml attribute for "executable"
		once
			Result := "executable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Ace_attribute_name: STRING
			-- Name of xml attribute for "ace"
		once
			Result := "ace"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Ecf_attribute_name: STRING
			-- Name of xml attribute for "ecf"
		once
			Result := "ecf"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Target_attribute_name: STRING
			-- Name of xml attribute for "target"
		once
			Result := "target"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	C_compile_attribute_name: STRING
			-- Name of xml attribute for "c_compile"
		once
			Result := "c_compile"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Catcall_attribute_name: STRING
			-- Name of xml attribute for "catcall"
		once
			Result := "catcall"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Clean_attribute_name: STRING
			-- Name of xml attribute for "clean"
		once
			Result := "clean"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Exit_code_variable_attribute_name: STRING
			-- Name of xml attribute exit_code_variable.
		once
			Result := "exit_code_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Finalize_attribute_name: STRING
			-- Name of xml attribute for "finalize"
		once
			Result := "finalize"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Gc_attribute_name: STRING
			-- Name of xml attribute for "gc"
		once
			Result := "gc"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Gelint_attribute_name: STRING
			-- Name of xml attribute for "gelint"
		once
			Result := "gelint"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Split_attribute_name: STRING
			-- Name of xml attribute for "split"
		once
			Result := "split"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Split_size_attribute_name: STRING
			-- Name of xml attribute for "split_size"
		once
			Result := "split_size"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Thread_attribute_name: STRING
			-- Name of xml attribute for "thread"
		once
			Result := "thread"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	New_instance_types_attribute_name: STRING
			-- Name of xml attribute for "new_instance_types"
		once
			Result := "new_instance_types"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Silent_attribute_name: STRING
			-- Name of xml attribute for "silent"
		once
			Result := "silent"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Verbose_attribute_name: STRING
			-- Name of xml attribute for "verbose"
		once
			Result := "verbose"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	No_benchmark_attribute_name: STRING
			-- Name of xml attribute for "no_benchmark"
		once
			Result := "no_benchmark"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Nested_benchmark_attribute_name: STRING
			-- Name of xml attribute for "nested_benchmark"
		once
			Result := "nested_benchmark"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Metrics_attribute_name: STRING
			-- Name of xml attribute for "metrics"
		once
			Result := "metrics"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
