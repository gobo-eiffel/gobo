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

	make (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create a general-purpose block.
		require
			executable_not_void: an_executable /= Void				
		do
			executable := an_executable			
			instruction_type := General_purpose_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			general_purpose_block: instruction_type = General_purpose_block
		end

	make_otherwise (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create an xsl:otherwise block.
		require
			executable_not_void: an_executable /= Void				
		do
			executable := an_executable
			instruction_type := Otherwise_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			otherwise_block: instruction_type = Otherwise_block
		end

	make_fallback (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create an xsl:fallback block.
		require
			executable_not_void: an_executable /= Void				
		do
			executable := an_executable
			instruction_type := Fallback_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			fallback_block: instruction_type = Fallback_block
		end

	make_matching_substring (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create an xsl:matching_substring block.
		require
			executable_not_void: an_executable /= Void				
		do
			executable := an_executable
			instruction_type := Matching_substring_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			matching_substring_block: instruction_type = Matching_substring_block
		end

	make_non_matching_substring (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create an xsl:non_matching_substring block.
		require
			executable_not_void: an_executable /= Void				
		do
			executable := an_executable
			instruction_type := Non_matching_substring_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			non_matching_substring_block: instruction_type = Non_matching_substring_block
		end

	make_if (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create an xsl:if block.
		require
			executable_not_void: an_executable /= Void				
		do
			executable := an_executable
			instruction_type := If_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			if_block: instruction_type = If_block
		end

	make_when (an_executable: XM_XSLT_EXECUTABLE) is
			-- Create an xsl:when block.
		require
			executable_not_void: an_executable /= Void		
		do
			executable := an_executable
			instruction_type := When_block
			create children.make (0)
		ensure
			executable_set: executable = an_executable
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

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			process_children_leaving_tail (a_context)
		end

feature {NONE} -- Implementation

	instruction_type: INTEGER
			-- Type of block

	General_purpose_block: INTEGER is 1
	Otherwise_block: INTEGER is 2
	Fallback_block: INTEGER is 3
	Matching_substring_block: INTEGER is 4
	Non_matching_substring_block: INTEGER is 5
	If_block: INTEGER is 6
	When_block: INTEGER is 7
			-- Types of block

invariant

	type_of_block: instruction_type >= General_purpose_block and then instruction_type <= When_block

end
	
