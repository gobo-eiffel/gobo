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
			start_document, start_element, notify_attribute, end_element, notify_characters
		end

	XM_XPATH_STANDARD_NAMESPACES

	XM_UNICODE_CHARACTERS_1_1

creation

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER; a_stripper_mode: XM_XSLT_MODE) is
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
		do
			transformer := a_transformer
			stripper_mode := a_stripper_mode
			strip_all := False
			preserve_all := stripper_mode = Void
			create strip_stack.make (100)
			if transformer.name_pool.is_name_code_allocated ("xml", Xml_uri, "space") then
				xml_space_code := transformer.name_pool.name_code ("xml", Xml_uri, "space")
			else
				transformer.name_pool.allocate_name ("xml", Xml_uri, "space")
				xml_space_code := transformer.name_pool.last_name_code
			end
		ensure
			transformer_set: transformer = a_transformer
			mode_set: stripper_mode = a_stripper_mode
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

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer - for pattern-evaluation and rule-conflict-reporting

	space_preserving_mode (a_name_code: INTEGER): INTEGER is
			-- Space-preserving mode for element identitifed by `a_name_code'
		require
			valid_name_code: transformer.name_pool.is_valid_name_code (a_name_code)
		local
			a_rule: XM_XSLT_RULE_VALUE
		do
			if preserve_all then
				Result := Always_preserve
			elseif strip_all then
				Result := Strip_default
			else
				element.set_name_code (a_name_code)
				a_rule := stripper_mode.rule (element, transformer)
					check
						boolean_rule: a_rule.is_boolean
					end
				if a_rule.as_boolean then
					Result := Always_preserve
				else
					Result := Strip_default
				end
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

	start_document: XM_XPATH_DOCUMENT is
			-- New document
		do
			strip_stack.put (Always_preserve)
			Result := Precursor
			element := Result.created_orphan_element
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			a_preservation_status, a_parent_preservation_status: INTEGER
		do
			Precursor (a_name_code, a_type_code, properties)
			a_parent_preservation_status := strip_stack.item
			if a_parent_preservation_status - Preserve_parent < 0 then
				a_preservation_status := Strip_default
			else
				a_preservation_status := Preserve_parent
			end
			if not strip_stack.extendible (1) then
				strip_stack.resize (2 * strip_stack.count)
			end
			strip_stack.put (a_preservation_status)
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_preservation_status: INTEGER
		do

			-- Test for xml:space="preserve"

		  if a_name_code = xml_space_code and then STRING_.same_string (a_value, "preserve") then
			  a_preservation_status := strip_stack.item
			  if a_preservation_status < Preserve_parent then
				  a_preservation_status := a_preservation_status + Preserve_parent
			  end
			  strip_stack.replace (a_preservation_status)
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
		local
			a_preservation_status: INTEGER
		do

			-- Assumes adjacent chunks of text are already concatenated

			if chars.count > 0 then
				if not is_all_whitespace (chars) then
					Precursor (chars, properties)
				elseif strip_stack.item /= Strip_default then
					a_preservation_status := strip_stack.item

					-- Unless Always_strip is set, we do not strip.
				
					if a_preservation_status >= Preserve_parent then
						a_preservation_status := a_preservation_status - Preserve_parent
					end
					if a_preservation_status < Always_strip then
						Precursor (chars, properties)
					end
				end
			end
		end

feature -- Duplication

	another: XM_XSLT_STRIPPER is
			-- A clean copu of `Current'
		do
			create Result.make (transformer, stripper_mode)
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


feature {NONE} -- Implementation

	preserve_all: BOOLEAN
			-- Do all elements have whitespace preserved?
	
	strip_stack: DS_ARRAYED_STACK [INTEGER]
			-- Stack of strip-status flags

	stripper_mode: XM_XSLT_MODE
			-- Collection of rules governing stripping

	xml_space_code: INTEGER
			-- Name code for xml:space attribute

	element: XM_XPATH_ELEMENT
			-- Dummy element for `{XM_XSLT_MODE}.rule'
	
	is_all_whitespace (chars: STRING): BOOLEAN is
			-- Does `chars' consist only of XML white-space characters?
		local
			a_character: CHARACTER
			counter: INTEGER
		do
			from
				counter := 1
				Result := True
			variant
				chars.count + 1 - counter
			until
				Result = False or else counter > chars.count
			loop
				if not is_space (chars.item_code (counter)) then
					Result := False
				end
				counter := counter + 1
			end
		end

invariant

	transformer_not_void: transformer /= Void
	strip_stack_not_void: strip_stack /= Void
	
end
	
