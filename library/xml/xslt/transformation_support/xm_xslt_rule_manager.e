indexing

	description:

		"Objects that maintain template-matching rules (one set for each mode)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RULE_MANAGER

inherit

	XM_XSLT_MODE_CONSTANTS

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create mode_for_default_mode.make
			create mode_map.make (5)
		end

feature -- Access

	mode (a_mode_name_code: INTEGER): XM_XSLT_MODE is
			-- Mode corresponding to `a_mode_name_code:'
		require
			mode_registered: is_mode_registered (a_mode_name_code)
		local
			a_node_key: INTEGER
		do
			if a_mode_name_code = Default_mode then
				Result := mode_for_default_mode
			elseif a_mode_name_code = All_modes then
				Result := omni_mode
			else
				a_node_key := fingerprint_from_name_code (a_mode_name_code)
				Result := mode_map.item (a_node_key)
			end
		ensure
			mode_not_void: Result /= Void
		end

feature -- Status report
	
	is_mode_registered (a_mode_name_code: INTEGER): BOOLEAN is
			-- Is a mode registered for `a_mode_name_code'?
		local
			a_node_key: INTEGER		
		do
			if a_mode_name_code = Default_mode then
				Result := True
			elseif a_mode_name_code = All_modes then
				Result := omni_mode /= Void
			else
				a_node_key := fingerprint_from_name_code (a_mode_name_code)
				Result := mode_map.has (a_node_key)
			end
		end

feature -- Element change

	register_mode (a_mode_name_code: INTEGER) is
			-- Register a mode for `a_mode_name_code'.
		require
			mode_not_registered: not is_mode_registered (a_mode_name_code)
		local
			a_node_key: INTEGER
			a_mode: XM_XSLT_MODE
		do
			if a_mode_name_code = All_modes then
				create omni_mode.make
				omni_mode.set_name ("#all")
			else
				a_node_key := fingerprint_from_name_code (a_mode_name_code)

				-- When creating a specific mode, copy all the rules currently held
            --  in `omni_mode', as these apply to all modes

				if omni_mode /= Void then
					create a_mode.make_with_copy (omni_mode)
				else
					create a_mode.make
				end
				mode_map.put (a_mode, a_node_key)
			end
		ensure
			mode_registered: is_mode_registered (a_mode_name_code)
		end

	set_handler_with_default_priority (a_pattern: XM_XSLT_PATTERN; a_handler: XM_XSLT_RULE_VALUE; a_mode: XM_XSLT_MODE; a_precedence: INTEGER) is
			-- Set handler for `a_pattern' using it's default priority.
		require
			pattern_not_void: a_pattern /= Void
			handler_not_void: a_handler /= Void
			mode_not_void: a_mode /= Void
		local
			a_union_pattern: XM_XSLT_UNION_PATTERN
		do

			-- For a union pattern, register the parts separately

			a_union_pattern ?= a_pattern
			if a_union_pattern /= Void then
				set_handler_with_default_priority (a_union_pattern.left_hand_side, a_handler, a_mode, a_precedence)
				set_handler_with_default_priority (a_union_pattern.right_hand_side, a_handler, a_mode, a_precedence)
			else
				set_handler (a_pattern, a_handler, a_mode, a_precedence, a_pattern.default_priority)
			end
		end
				
	set_handler (a_pattern: XM_XSLT_PATTERN; a_handler: XM_XSLT_RULE_VALUE; a_mode: XM_XSLT_MODE; a_precedence: INTEGER; a_priority: DOUBLE) is
			-- Set handler for `a_pattern'.
		require
			pattern_not_void: a_pattern /= Void
			handler_not_void: a_handler /= Void
			mode_not_void: a_mode /= Void
		local
			a_union_pattern: XM_XSLT_UNION_PATTERN
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_MODE, INTEGER]
		do

			-- For a union pattern, register the parts separately

			a_union_pattern ?= a_pattern
			if a_union_pattern /= Void then
				set_handler (a_union_pattern.left_hand_side, a_handler, a_mode, a_precedence, a_priority)
				set_handler (a_union_pattern.right_hand_side, a_handler, a_mode, a_precedence, a_priority)
			else
				a_mode.add_rule (a_pattern, a_handler,  a_precedence, a_priority)

				-- If adding a rule to the omni_mode (mode='all'),
				--  then add it to all the other modes as well

				if a_mode = omni_mode then
					mode_for_default_mode.add_rule (a_pattern, a_handler,  a_precedence, a_priority)

					from
						a_cursor := mode_map.new_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						a_cursor.item.add_rule (a_pattern, a_handler,  a_precedence, a_priority)
						a_cursor.forth
					end
				end
			end
		end

feature {NONE} -- Implementation

	mode_for_default_mode: XM_XSLT_MODE
			-- Mode for ode handlers with default mode

	omni_mode: XM_XSLT_MODE
			-- Mode for node handlers that specify mode="all"

	mode_map: DS_HASH_TABLE [XM_XSLT_MODE, INTEGER]
			-- Map of fingerprints to non-default modes

invariant

	mode_map_not_void: mode_map /= Void
	default_mode_not_void: mode_for_default_mode /= Void

end
	
