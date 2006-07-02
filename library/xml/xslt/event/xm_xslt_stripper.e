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

	XM_XPATH_TYPE

	XM_XSLT_STRING_ROUTINES

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
			if shared_name_pool.is_name_code_allocated ("xml", Xml_uri, "space") then
				xml_space_code := shared_name_pool.name_code ("xml", Xml_uri, "space")
			else
				shared_name_pool.allocate_name ("xml", Xml_uri, "space")
				xml_space_code := shared_name_pool.last_name_code
			end
			create orphan.make (Element_node, "")
			base_receiver := an_underlying_receiver
			system_id := an_underlying_receiver.system_id
			debug ("XSLT stripper")
				std.error.put_string ("Stripper mode is " + stripper_mode.out)
				std.error.put_new_line
				std.error.put_string ("Preserve all? " + preserve_all.out)
				std.error.put_new_line
			end
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

	space_preserving_mode (a_name_code: INTEGER): INTEGER is
			-- Space-preserving mode for element identitifed by `a_name_code'
		require
			valid_name_code: a_name_code > 0
		local
			a_rule: XM_XSLT_RULE_VALUE
		do
			debug ("XSLT stripper")
				std.error.put_string ("Space-preserving mode: preserve all? " + preserve_all.out)
				std.error.put_new_line
			end
			if preserve_all then
				Result := Always_preserve
			elseif strip_all then
				Result := Strip_default
			else
				orphan.set_name_code (a_name_code)
				a_rule := stripper_mode.rule (orphan, context)
				if a_rule = Void then
					Result := Always_preserve
				else
					check
						boolean_rule: a_rule.is_boolean
					end
					if a_rule.as_boolean then
						debug ("XSLT stripper")
							std.error.put_string ("Rule is preserve%N")
						end
						Result := Always_preserve
					else
						debug ("XSLT stripper")
							std.error.put_string ("Rule is default%N")
						end
						Result := Strip_default
					end
				end
			end
			debug ("XSLT stripper")
				std.error.put_string ("Space-preserving mode: " + Result.out)
				std.error.put_new_line
			end
		ensure
			valid_result: Result = Always_preserve or else Result = Strip_default or else Result = Always_strip
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
			debug ("XSLT stripper")
				std.error.put_string ("Possibly stripping element " + shared_name_pool.display_name_from_name_code (a_name_code))
				std.error.put_new_line
			end
			Precursor (a_name_code, a_type_code, properties)
			a_parent_preservation_status := strip_stack.item
			if a_parent_preservation_status - Preserve_parent < 0 then
				a_preservation_status := Strip_default
			else
				a_preservation_status := Preserve_parent
			end

			if space_preserving_mode (a_name_code) = Always_preserve then
				a_preservation_status := a_preservation_status + Always_preserve
			end
			debug ("XSLT stripper")
				std.error.put_string ("Preservation status is " + a_preservation_status.out)
				std.error.put_new_line
			end
			strip_stack.force (a_preservation_status)
			is_written := True
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_preservation_status: INTEGER
		do

			-- Test for xml:space="preserve"

			if a_name_code = xml_space_code then
				if STRING_.same_string (a_value, "preserve") then
					debug ("XSLT stripper")
						std.error.put_string ("Found xml:space='preserve'%N")
					end
					a_preservation_status := strip_stack.item
					if a_preservation_status < Preserve_parent then
						a_preservation_status := a_preservation_status + Preserve_parent
					end
					strip_stack.replace (a_preservation_status)
				elseif STRING_.same_string (a_value, "default") then
					debug ("XSLT stripper")
						std.error.put_string ("Found xml:space='default'%N")
					end
					if a_preservation_status >= Preserve_parent then
						a_preservation_status := a_preservation_status - Preserve_parent
					end
					strip_stack.replace (a_preservation_status)
				end
				debug ("XSLT stripper")
					std.error.put_string ("Preservation status is now " + a_preservation_status.out)
					std.error.put_new_line
				end
			end
			debug ("XSLT stripper")
				std.error.put_string ("Notifying attribute " + shared_name_pool.display_name_from_name_code (a_name_code))
				std.error.put_new_line
			end
			Precursor (a_name_code, a_type_code, a_value, properties)
		end

	end_element is
			-- Notify the end of an element.
		do
			debug ("XSLT stripper")
				std.error.put_string ("Leaving element%N")
			end
			Precursor
			strip_stack.remove
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_preservation_status: INTEGER
		do

			-- Assumes adjacent chunks of text are already concatenated

			if chars.count > 0 then
				if not is_all_whitespace (chars) then
					debug ("XSLT stripper")
						std.error.put_string ("Not all whitespace so not preserving%N")
					end
					Precursor (chars, properties)
				elseif strip_stack.item /= Strip_default then
					a_preservation_status := strip_stack.item

					-- Unless Always_strip is set, we do not strip.
				
					if a_preservation_status >= Preserve_parent then
						a_preservation_status := a_preservation_status - Preserve_parent
					end
					if a_preservation_status /= Always_strip then
						debug ("XSLT stripper")
							std.error.put_string ("Preserving " + chars.count.out + " blanks%N")
						end
						Precursor (chars, properties)
					end
				else
					debug ("XSLT stripper")
						std.error.put_string ("Strip default so not preserving%N")
					end
				end
			end
			is_written := True
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

	xml_space_code: INTEGER
			-- Name code for xml:space attribute

	orphan: XM_XPATH_ORPHAN
			-- Dummy element for `{XM_XSLT_MODE}.rule'

	context: XM_XSLT_EVALUATION_CONTEXT
			-- Dynamic context

invariant

	local_invariant: is_local_invariant_met
	
end
	
