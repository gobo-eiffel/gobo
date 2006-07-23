indexing

	description:

		"Objects which create XSLT stylesheets and transformers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRANSFORMER_FACTORY

inherit

	ANY

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_EIFFEL_PARSER_FACTORY
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
		do
			configuration := a_configuration
			create stylesheet_cache.make_with_equality_testers (10, Void, string_equality_tester)
			is_caching := True
		ensure
			configuration_set: configuration = a_configuration
			caching: is_caching
		end

feature -- Access

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration

	created_transformer: XM_XSLT_TRANSFORMER
			-- Transformer from last call to `create_new_transformer'

	is_stylesheet_cached (a_uri_reference: STRING): BOOLEAN is
			-- Is `a_uri_reference' cached?
		require
			uri_not_void: a_uri_reference /= Void
		do
			Result := stylesheet_cache.has (a_uri_reference)
		end

	cached_stylesheet (a_uri_reference: STRING): XM_XSLT_EXECUTABLE is
			-- Cached stylesheet
		require
				uri_not_void: a_uri_reference /= Void
		do
			Result := stylesheet_cache.item (a_uri_reference)
		end

feature -- Status report

	was_error: BOOLEAN
			-- Did `create_new_transformer' fail?

	last_error_message: STRING
			-- Error reported by last call to `create_new_transformer'

	is_caching: BOOLEAN
			-- Is `Current' caching compiled stylesheets?

feature -- Status setting

	set_caching (on_or_off: BOOLEAN) is
			-- Turn caching `on_or_off'.
		do
			is_caching := on_or_off
		ensure
			set: is_caching = on_or_off
		end

feature -- Creation

	create_new_transformer (a_source: XM_XSLT_SOURCE; a_uri: UT_URI) is
			-- New transformer
		require
			source_not_void: a_source /= Void
			absolute_base_uri: a_uri /= Void and then a_uri.is_absolute
		local
			l_compiler: XM_XSLT_STYLESHEET_COMPILER
			l_uri: UT_URI
		do
			was_error := False
			create l_uri.make_resolve (a_uri, a_source.uri_reference)
			if is_stylesheet_cached (l_uri.full_reference) then
				create created_transformer.make (configuration, cached_stylesheet (l_uri.full_reference), Current)
			else
				create l_compiler.make (configuration)
				l_compiler.prepare (a_source, a_uri)
				if l_compiler.load_stylesheet_module_failed then
					was_error := True
					last_error_message := l_compiler.load_stylesheet_module_error
				else
					if is_caching then
						stylesheet_cache.force_new (l_compiler.executable, l_uri.full_reference)
					end
					created_transformer := l_compiler.new_transformer (Current)
				end
			end
		ensure
			error_or_transformer_not_void: not was_error implies created_transformer /= Void
		end

	associated_stylesheet (a_uri: STRING; a_medium: STRING; a_chooser: XM_XSLT_PI_CHOOSER): XM_XSLT_SOURCE is
			-- Stylesheet associated with `a_uri'
		require
			source_uri_not_a_fragment: a_uri /= Void and then a_uri.index_of ('#', 1) = 0
			medium_not_void: a_medium /= Void
			chooser_not_void: a_chooser /= Void
		local
			a_pi_parser: XM_XSLT_PROCESSING_INSTRUCTION_PARSER
			an_xml_parser: XM_PARSER
			an_error_collector: XM_PARSER_STOP_ON_ERROR_FILTER
			some_candidate_stylesheets, selected_stylesheets: DS_ARRAYED_LIST [XM_XSLT_XML_STYLESHEET]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_XML_STYLESHEET]
			a_candidate: XM_XSLT_XML_STYLESHEET
			candidate_approved, preferred_seen: BOOLEAN
			another_uri: UT_URI
			a_candidate_count, a_selected_index: INTEGER
			selectable_candidate_indices: DS_ARRAYED_LIST [INTEGER]
			selectable_candidates: DS_ARRAYED_LIST [STRING]
		do
			an_xml_parser := new_eiffel_parser
			an_error_collector := an_xml_parser.new_stop_on_error_filter
			create a_pi_parser.make (an_error_collector)
			an_xml_parser.set_callbacks (a_pi_parser)
			an_xml_parser.set_dtd_callbacks (a_pi_parser)
			an_xml_parser.set_resolver (configuration.entity_resolver)
			an_xml_parser.parse_from_system (a_uri)
			some_candidate_stylesheets := a_pi_parser.stylesheets
			if some_candidate_stylesheets.count > 0 then
				from
					create selected_stylesheets.make (some_candidate_stylesheets.count)
					create selectable_candidates.make (some_candidate_stylesheets.count)
					create selectable_candidate_indices.make (some_candidate_stylesheets.count)
					a_cursor := some_candidate_stylesheets.new_cursor; a_cursor.start
				variant
					some_candidate_stylesheets.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_candidate := a_cursor.item
					candidate_approved := a_candidate.applicable_media.has (a_medium) or else a_candidate.applicable_media.has ("all")
					if candidate_approved then
						if a_candidate.is_alternate then
							a_candidate_count := a_candidate_count + 1
							selected_stylesheets.put_last (a_candidate)
							selectable_candidate_indices.put_last (a_candidate_count)
							selectable_candidates.put_last (a_candidate.title)
						elseif a_candidate.is_preferred then
							if not preferred_seen then
								preferred_seen := True
								a_candidate_count := a_candidate_count + 1
								selected_stylesheets.put_last (a_candidate)
								selectable_candidate_indices.put_first (a_candidate_count)
								selectable_candidates.put_first (a_candidate.title)
							end
						else
							a_candidate_count := a_candidate_count + 1
							selected_stylesheets.put_last (a_candidate)
						end
					end
					a_cursor.forth
				end
				if selectable_candidates.count > 1 then
					a_selected_index := a_chooser.selected_index (selectable_candidates)
					selectable_candidate_indices.remove (a_selected_index)
					trim_selected_stylesheets (selected_stylesheets, selectable_candidate_indices)
				end
				if selected_stylesheets.count > 0 then
					create another_uri.make_resolve (configuration.entity_resolver.uri, a_uri)
					Result := composite_stylesheet (another_uri, selected_stylesheets)
				end
			end
		end

feature -- Removal

	clear_stylesheet_cache is
			-- Remove all compiled stylesheets from cache.
		do
			stylesheet_cache.wipe_out
		ensure
			empty_cache: stylesheet_cache.is_empty
		end

	remove_stylesheet (a_uri_reference: STRING) is
			-- Remove `a_uri_reference' from cache?
		require
			uri_not_void: a_uri_reference /= Void
			stylesheet_cached: is_stylesheet_cached (a_uri_reference)
		do
			stylesheet_cache.remove (a_uri_reference)
		ensure
			removed: not is_stylesheet_cached (a_uri_reference)
		end

feature {NONE} -- Implementation

	stylesheet_cache: DS_HASH_TABLE [XM_XSLT_EXECUTABLE, STRING]
			-- Compiled stylesheets indexed by full URI (including any fragment)

	composite_stylesheet (a_uri: UT_URI;  selected_stylesheets: DS_ARRAYED_LIST [XM_XSLT_XML_STYLESHEET]): XM_XSLT_SOURCE is
			-- Stylesheet which xsl:imports all of `selected_stylesheets'
		require
			source_uri_absolute: a_uri /= Void and then a_uri.is_absolute
			selected_stylesheets_not_empty: selected_stylesheets /= Void and then selected_stylesheets.count > 0
		local
			another_uri: UT_URI
			a_text: STRING
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_XML_STYLESHEET]
		do
			if selected_stylesheets.count = 1 then
				create another_uri.make_resolve (a_uri, selected_stylesheets.item (1).uri)
				-- TODO - set MIME type and charset parameters?
				create {XM_XSLT_URI_SOURCE} Result.make (another_uri.full_reference)
			else
				a_text := STRING_.concat ("<xsl:transform version='2.0' xmlns:xsl='", Xslt_uri)
				a_text := STRING_.appended_string (a_text, "' xml:base='")
				a_text := STRING_.appended_string (a_text, a_uri.full_reference)
				a_text := STRING_.appended_string (a_text, "'>")
				from
					a_cursor := selected_stylesheets.new_cursor; a_cursor.start
				variant
					selected_stylesheets.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_text := STRING_.appended_string (a_text, " <xsl:import href='")
					a_text := STRING_.appended_string (a_text, a_cursor.item.uri)
					a_text := STRING_.appended_string (a_text, "'/>")
					a_cursor.forth
				end
				a_text := STRING_.appended_string (a_text, "</xsl:transform>")

				-- TODO - set MIME type and charset parameters?

				create {XM_XSLT_STRING_SOURCE} Result.make (a_uri.full_reference, a_text)
			end
		ensure
			result_not_void: Result /= Void
		end

	trim_selected_stylesheets (selected_stylesheets: DS_ARRAYED_LIST [XM_XSLT_XML_STYLESHEET]; selectable_candidate_indices: DS_ARRAYED_LIST [INTEGER]) is
			-- Remove entries from `selected_stylesheets' by index.
		require
			multiple_selected_stylesheets: selected_stylesheets /= Void and then selected_stylesheets.count > 0
			selectable_candidate_indices_not_empty: selectable_candidate_indices /= Void and then selectable_candidate_indices.count > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do

			-- The indices are in ascending order, so we process them
			--  back-to-front to avoid removing prior entries
			--  (and thus wrecking the index numbers)

			from
				a_cursor := selectable_candidate_indices.new_cursor; a_cursor.finish
			until
				a_cursor.before
			loop
				selected_stylesheets.remove (a_cursor.item)
				a_cursor.back
			end
		end

invariant

	configuration_not_void: configuration /= Void
	error_message: was_error implies last_error_message /= Void
	cache_not_void: stylesheet_cache /= Void

end

