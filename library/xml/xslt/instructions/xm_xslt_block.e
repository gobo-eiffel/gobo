indexing

	description:

		"Objects that represent a hypothetical xsl:block instruction"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_BLOCK

inherit

	XM_XSLT_INSTRUCTION

		-- Implements an imaginary xsl:block instruction which simply evaluates
		--  it's contents. Used for top-level templates, xsl:otherwise, etc.

creation

	make, make_otherwise, make_fallback, make_matching_substring,
	make_non_matching_substring, make_if, make_when

feature {NONE} -- Initialization

	make is
			-- Create a general-purpose block.
		do
			instruction_type := General_purpose_block
		ensure
			general_purpose_block: instruction_type = General_purpose_block
		end

	make_otherwise is
			-- Create an xsl:otherwise block.
		do
			instruction_type := Otherwise_block
		ensure
			otherwise_block: instruction_type = Otherwise_block
		end

	make_fallback is
			-- Create an xsl:fallback block.
		do
			instruction_type := Fallback_block
		ensure
			fallback_block: instruction_type = Fallback_block
		end

	make_matching_substring is
			-- Create an xsl:matching_substring block.
		do
			instruction_type := Matching_substring_block
		ensure
			matching_substring_block: instruction_type = Matching_substring_block
		end

	make_non_matching_substring is
			-- Create an xsl:non_matching_substring block.
		do
			instruction_type := Non_matching_substring_block
		ensure
			non_matching_substring_block: instruction_type = Non_matching_substring_block
		end

	make_if is
			-- Create an xsl:if block.
		do
			instruction_type := If_block
		ensure
			if_block: instruction_type = If_block
		end

	make_when is
			-- Create an xsl:when block.
		do
			instruction_type := When_block
		ensure
			when_block: instruction_type = When_block
		end

feature -- Access

	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
			inspect
				instruction_type
			when Otherwise_block then
				Result := "xsl:otherwise"
			when Fallback_block then
				Result := "xsl:fallback"
			when Matching_substring_block then
				Result := "xsl:matching-substring"
			when Non_matching_substring_block then
				Result := "xsl:non-matching-substring"
			when If_block then
				Result := "xsl:if"
			when When_block then
				Result := "xsl:when"
			else
				Result := "[xsl:block]"
			end
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

feature {NONE} -- Implementation

	instruction_type: INTEGER
			-- Type of block

	General_purpose_block, Otherwise_block, Fallback_block,
	Matching_substring_block, Non_matching_substring_block,
	If_block, When_block: INTEGER is unique
			-- Types of block

invariant

	type_of_block: instruction_type >= General_purpose_block and then instruction_type <= When_block

end
	
