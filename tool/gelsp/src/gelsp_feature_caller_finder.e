note

	description:

		"Finders of callers of a given feature"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FEATURE_CALLER_FINDER

inherit

	ET_FEATURE_CALLER_FINDER
		rename
			make as make_caller_finder
		redefine
			find_callers_in_class,
			find_callers_in_system,
			report_caller
		end

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_message_manager: like message_manager; a_system_processor: like system_processor)
			-- Create a new feature caller finder.
		require
			a_response_not_void: a_response /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			message_manager := a_message_manager
			make_caller_finder (a_system_processor)
		ensure
			response_set: response = a_response
			message_manager_set: message_manager = a_message_manager
			system_processor_set: system_processor = a_system_processor
		end

feature -- Access

	response: LS_CALL_HIERARCHY_INCOMING_CALLS_RESPONSE
			-- List of call hierarchy incoming calls to be built

	message_manager: GELSP
			-- Message manager

feature -- Basic operations

	find_callers_in_class (a_callee_feature: ET_FEATURE; a_callee_class, a_class: ET_CLASS)
			-- Find callers in `a_class' of `a_callee_feature' from `a_callee_class'.
		do
			precursor (a_callee_feature, a_callee_class, a_class)
			last_caller := Void
			last_call_hierarchy_incoming_call := Void
		end

	find_callers_in_system (a_callee_feature: ET_FEATURE; a_callee_class: ET_CLASS; a_system: ET_SYSTEM)
			-- Find callers in `a_system' of `a_callee_feature' from `a_callee_class'.
		do
			set_system_classes_sorted (True)
			precursor (a_callee_feature, a_callee_class, a_system)
			last_caller := Void
			last_call_hierarchy_incoming_call := Void
		end

	report_caller (a_call_name: ET_CALL_NAME; a_caller: ET_STANDALONE_CLOSURE)
			-- Report that `callee_feature' from `callee_class' is called
			-- in `a_caller` from `current_class` by `a_call_name`.
		local
			l_class: ET_CLASS
			l_range: LS_RANGE
			l_detail: LS_STRING
			l_ranges: LS_RANGE_LIST
		do
			if a_caller = last_caller and then attached last_call_hierarchy_incoming_call as l_incoming_call then
				l_class := a_caller.implementation_class
				l_range := message_manager.range (a_call_name, l_class)
				l_ranges := l_incoming_call.from_ranges
				l_ranges.put_last (l_range)
				create l_detail.make_from_utf8 ("(*" + l_ranges.count.out + " from " + l_class.upper_name + ")")
				l_incoming_call.from_.set_detail (l_detail)
			elseif attached message_manager.call_hierarchy_incoming_call (a_call_name, a_caller) as l_incoming_call then
				response.add_call_hierarchy_incoming_call (l_incoming_call)
				last_caller := a_caller
				last_call_hierarchy_incoming_call := l_incoming_call
			end
		end

feature {NONE} -- Implementation

	last_caller: detachable ET_STANDALONE_CLOSURE
			-- Last caller found

	last_call_hierarchy_incoming_call: detachable LS_CALL_HIERARCHY_INCOMING_CALL
			-- Call hierarchy incoming call associated with `last_caller`, if any

invariant

	response_not_void: response /= Void
	message_manager_not_void: message_manager /= Void

end
