﻿note

	description:

		"Objects that strip white space from selected elements."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_STRIPPER

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

	ST_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER; a_stripper_mode: detachable XM_XSLT_MODE; an_underlying_receiver: XM_XPATH_RECEIVER)
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			receiver_not_void: an_underlying_receiver /= Void
		do
			transformer := a_transformer
			context := a_transformer.new_xpath_context
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

	Strip_default: INTEGER = 0
			-- Element is stripped of white space unless xml:space is "preserve"

	Always_preserve: INTEGER = 1
			-- Element is never stripped of white space

	Always_strip: INTEGER = 2
			-- Element is always stripped of white space

	Preserve_parent: INTEGER = 4
			-- Parent element requests preserve white space

	Must_not_strip: INTEGER = 8
			-- Simple content model forbids stripping

	found_space_preserving_mode: INTEGER
			-- Result from `find_space_preserving_mode'

	find_space_preserving_mode (a_name_code: INTEGER)
			-- Find space-preserving mode for element identitifed by `a_name_code'
		require
			valid_name_code: a_name_code > 0
		local
			l_rule: detachable XM_XSLT_RULE
		do
			if preserve_all then
				found_space_preserving_mode := Always_preserve
			elseif strip_all then
				found_space_preserving_mode := Strip_default
			else
				check attached context as l_context then
					orphan.set_name_code (a_name_code)
					check attached stripper_mode as l_stripper_mode then
						l_stripper_mode.match_rule (orphan, l_context)
						l_rule := l_stripper_mode.last_matched_rule
					end
					check attached l_context.transformer as l_context_transformer then
						if l_context_transformer.is_error then
							found_space_preserving_mode := Strip_default
						elseif l_rule = Void then
							found_space_preserving_mode := Always_preserve
						else
							check
								boolean_rule: l_rule.handler.is_boolean
							end
							if l_rule.handler.as_boolean then
								found_space_preserving_mode := Always_preserve
							else
								found_space_preserving_mode := Strip_default
							end
						end
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

	set_strip_all
			-- Strip all whitespace nodes.
		do
			strip_all := True
			preserve_all := False
		ensure
			stripping: strip_all = True and preserve_all = False
		end

feature -- Events

	open
			-- New document
		do
			check attached strip_stack as l_strip_stack then
				l_strip_stack.put (Always_preserve)
				Precursor
			end
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		local
			a_preservation_status, a_parent_preservation_status: INTEGER
		do
			check attached strip_stack as l_strip_stack then
				Precursor (a_name_code, a_type_code, properties)
				a_parent_preservation_status := l_strip_stack.item
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
				l_strip_stack.force (a_preservation_status)
				mark_as_written
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		local
			a_preservation_status: INTEGER
		do

			-- Test for xml:space="preserve"

			if fingerprint_from_name_code (a_name_code) = Xml_space_type_code then
				if STRING_.same_string (a_value, "preserve") then
					check attached strip_stack as l_strip_stack then
						a_preservation_status := INTEGER_.bit_or (l_strip_stack.item, Preserve_parent)
						l_strip_stack.replace (a_preservation_status)
					end
				elseif STRING_.same_string (a_value, "default") then
					check attached strip_stack as l_strip_stack then
						a_preservation_status := l_strip_stack.item
						if INTEGER_.bit_and (a_preservation_status, Preserve_parent) /= 0 then
							a_preservation_status := a_preservation_status - Preserve_parent
							l_strip_stack.replace (a_preservation_status)
						end
					end
				end
			end
			Precursor (a_name_code, a_type_code, a_value, properties)
		end

	end_element
			-- Notify the end of an element.
		do
			Precursor
			check attached strip_stack as l_strip_stack then
				l_strip_stack.remove
			end
		end

	notify_characters (chars: STRING; properties: INTEGER)
			-- Notify character data.
		do

			-- Assumes adjacent chunks of text are already concatenated

			if chars.count > 0 then
				if not is_all_whitespace (chars) then
					Precursor (chars, properties)
				else
					check attached strip_stack as l_strip_stack then
						if INTEGER_.bit_and (l_strip_stack.item, INTEGER_.bit_or (INTEGER_.bit_or (Preserve_parent, Always_preserve), Must_not_strip)) /= 0 and then
							INTEGER_.bit_and (l_strip_stack.item, Always_strip) = 0 then
							Precursor (chars, properties)
						end
					end
				end
			end
			mark_as_written
		end

feature -- Duplication

	another: XM_XSLT_STRIPPER
			-- A clean copu of `Current'
		do
			check attached transformer as l_transformer then
				create Result.make (l_transformer, stripper_mode, base_receiver)
				Result.clone_attributes (strip_all, preserve_all)
			end
		ensure
			copy_not_void: Result /= Void
		end

feature {XM_XSLT_STRIPPER} -- Local

	clone_attributes (a_strip_all, a_preserve_all: BOOLEAN)
		-- Clone space-preserving/stripping attributes.
		do
			strip_all := a_strip_all
			preserve_all := a_preserve_all
		ensure
			strip_all_set: strip_all = a_strip_all
			preserve_all_set: preserve_all = a_preserve_all
		end

	transformer: detachable XM_XSLT_TRANSFORMER
			-- Transformer - for pattern-evaluation and rule-conflict-reporting

	is_local_invariant_met: BOOLEAN
			-- is the invariant met?
		do
			Result := transformer /= Void and then strip_stack /= Void and then
			(not preserve_all implies stripper_mode /= Void)
		end

feature {NONE} -- Implementation

	preserve_all: BOOLEAN
			-- Do all elements have whitespace preserved?

	strip_stack: detachable DS_ARRAYED_STACK [INTEGER]
			-- Stack of strip-status flags

	stripper_mode: detachable XM_XSLT_MODE
			-- Collection of rules governing stripping

	orphan: XM_XPATH_ORPHAN
			-- Dummy element for `{XM_XSLT_MODE}.rule'

	context: detachable XM_XSLT_EVALUATION_CONTEXT
			-- Dynamic context

invariant

	local_invariant: is_local_invariant_met

end

