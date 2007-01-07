indexing

	description:

		"Objects that strip white space from selected elements."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_STRIPPER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			open, start_element, notify_attribute, end_element, notify_characters
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end
	
	XM_XPATH_TYPE
		export {NONE} all end

	XM_XSLT_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER; a_stripper_mode: XM_XSLT_MODE; an_underlying_receiver: XM_XPATH_RECEIVER) is
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			receiver_not_void: an_underlying_receiver /= Void
		do
			transformer := a_transformer
			context := transformer.new_xpath_context
			stripper_mode := a_stripper_mode
			strip_all := False
			preserve_all := stripper_mode = Void
			create strip_stack.make (100)
			create orphan.make (Element_node, "")
			base_receiver := an_underlying_receiver
			base_uri := an_underlying_receiver.base_uri
			document_uri := an_underlying_receiver.document_uri
		ensure
			transformer_set: transformer = a_transformer
			mode_set: stripper_mode = a_stripper_mode
			base_receiver_set: base_receiver = an_underlying_receiver
		end

feature -- Access

	Strip_default: INTEGER is 0
			-- Element is stripped of white space unless xml:space is "preserve"

	Always_preserve: INTEGER is 1
			-- Element is never stripped of white space

	Always_strip: INTEGER is 2
			-- Element is always stripped of white space

	Preserve_parent: INTEGER is 4
			-- Parent element requests preserve white space

	Must_not_strip: INTEGER is 8
			-- Simple content model forbids stripping

	found_space_preserving_mode: INTEGER
			-- Result from `find_space_preserving_mode'

	find_space_preserving_mode (a_name_code: INTEGER) is
			-- Find space-preserving mode for element identitifed by `a_name_code'
		require
			valid_name_code: a_name_code > 0
		local
			a_rule: XM_XSLT_RULE_VALUE
		do
			if preserve_all then
				found_space_preserving_mode := Always_preserve
			elseif strip_all then
				found_space_preserving_mode := Strip_default
			else
				orphan.set_name_code (a_name_code)
				stripper_mode.match_rule (orphan, context)
				a_rule := stripper_mode.last_matched_rule
				if context.transformer.is_error then
					found_space_preserving_mode := Strip_default
				elseif a_rule = Void then
					found_space_preserving_mode := Always_preserve
				else
					check
						boolean_rule: a_rule.is_boolean
					end
					if a_rule.as_boolean then
						found_space_preserving_mode := Always_preserve
					else
						found_space_preserving_mode := Strip_default
					end
				end
			end
		ensure
			valid_result: found_space_preserving_mode = Always_preserve or found_space_preserving_mode = Strip_default or found_space_preserving_mode = Always_strip
		end

feature -- Status report
	
	strip_all: BOOLEAN
			-- Do all elements have whitespace stripped?

feature -- Status setting

	set_strip_all is
			-- Strip all whitespace nodes.
		do
			strip_all := True
			preserve_all := False
		ensure
			stripping: strip_all = True and preserve_all = False
		end

feature -- Events

	open is
			-- New document
		do
			strip_stack.put (Always_preserve)
			Precursor
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			a_preservation_status, a_parent_preservation_status: INTEGER
		do
			Precursor (a_name_code, a_type_code, properties)
			a_parent_preservation_status := strip_stack.item
			a_preservation_status := INTEGER_.bit_and (a_parent_preservation_status, Preserve_parent)

			find_space_preserving_mode (a_name_code)
			if found_space_preserving_mode = Always_preserve then
				a_preservation_status := INTEGER_.bit_or (a_preservation_status, Always_preserve)
			elseif found_space_preserving_mode = Always_strip then
				a_preservation_status := INTEGER_.bit_or (a_preservation_status, Always_strip)
			end
			if a_preservation_status = Strip_default and a_type_code > 0 and a_type_code /= Untyped_type_code then
				-- TODO: if schema_aware
				-- elements with simple content may not be stripped
				--if ... then  a_preservation_status := INTEGER_.bit_or (a_preservation_status, Must_not_strip)
			end
			strip_stack.force (a_preservation_status)
			mark_as_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_preservation_status: INTEGER
		do

			-- Test for xml:space="preserve"

			if fingerprint_from_name_code (a_name_code) = xml_space_type_code then
				if STRING_.same_string (a_value, "preserve") then
					a_preservation_status := INTEGER_.bit_or (strip_stack.item, Preserve_parent)
					strip_stack.replace (a_preservation_status)
				elseif STRING_.same_string (a_value, "default") then
					a_preservation_status := strip_stack.item
					if INTEGER_.bit_and (a_preservation_status, Preserve_parent) /= 0 then
						a_preservation_status := a_preservation_status - Preserve_parent
						strip_stack.replace (a_preservation_status)
					end
				end
			end
			Precursor (a_name_code, a_type_code, a_value, properties)
		end

	end_element is
			-- Notify the end of an element.
		do
			Precursor
			strip_stack.remove
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do

			-- Assumes adjacent chunks of text are already concatenated

			if chars.count > 0 then
				if not is_all_whitespace (chars) then
					Precursor (chars, properties)
				elseif INTEGER_.bit_and (strip_stack.item, INTEGER_.bit_or (INTEGER_.bit_or (Preserve_parent, Always_preserve), Must_not_strip)) /= 0 and then
					INTEGER_.bit_and (strip_stack.item, Always_strip) = 0 then
					Precursor (chars, properties)
				end
			end
			mark_as_written
		end

feature -- Duplication

	another: XM_XSLT_STRIPPER is
			-- A clean copu of `Current'
		do
			create Result.make (transformer, stripper_mode, base_receiver)
			Result.clone_attributes (strip_all, preserve_all)
		ensure
			copy_not_void: Result /= Void
		end

feature {XM_XSLT_STRIPPER} -- Local

	clone_attributes (a_strip_all, a_preserve_all: BOOLEAN) is
		-- Clone space-preserving/stripping attributes.
		do
			strip_all := a_strip_all
			preserve_all := a_preserve_all
		ensure
			strip_all_set: strip_all = a_strip_all
			preserve_all_set: preserve_all = a_preserve_all
		end

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer - for pattern-evaluation and rule-conflict-reporting

	is_local_invariant_met: BOOLEAN is
			-- is the invariant met?
		do
			Result := transformer /= Void and then strip_stack /= Void and then
			(not preserve_all implies stripper_mode /= Void)
		end

feature {NONE} -- Implementation

	preserve_all: BOOLEAN
			-- Do all elements have whitespace preserved?
	
	strip_stack: DS_ARRAYED_STACK [INTEGER]
			-- Stack of strip-status flags

	stripper_mode: XM_XSLT_MODE
			-- Collection of rules governing stripping

	orphan: XM_XPATH_ORPHAN
			-- Dummy element for `{XM_XSLT_MODE}.rule'

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Dynamic context

invariant

	local_invariant: is_local_invariant_met
	
end
	
