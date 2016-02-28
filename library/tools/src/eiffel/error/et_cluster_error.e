note

	description:

		"Eiffel cluster errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009/03/03 $"
	revision: "$Revision: #10 $"

class ET_CLUSTER_ERROR

inherit

	ET_ERROR

create

	make_gcaaa,
	make_gcaab,
	make_gcdep,
	make_gcpro,
	make_gcscm

feature {NONE} -- Initialization

	make_gcaaa (a_cluster: like cluster; a_dirname: STRING)
			-- Create a new GCAAA error: cannot read
			-- `a_cluster''s directory `a_dirname'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_dirname_not_void: a_dirname /= Void
		do
			code := gcaaa_template_code
			etl_code := gcaaa_etl_code
			default_template := gcaaa_default_template
			cluster := a_cluster
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_lower_name ('/'), 2)
			parameters.put (a_dirname, 3)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = cluster full pathname
		end

	make_gcaab (a_cluster: like cluster; a_filename: STRING)
			-- Create a new GCAAB error: cannot read Eiffel file
			-- `a_filename' in `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_filename_not_void: a_filename /= Void
		do
			code := gcaab_template_code
			etl_code := gcaab_etl_code
			default_template := gcaab_default_template
			cluster := a_cluster
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_lower_name ('/'), 2)
			parameters.put (a_filename, 3)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = filename
		end

	make_gcdep (a_cluster: like cluster; a_class, a_dependant: ET_CLASS; a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT)
			-- Create a new GCDEP error: class `a_class' (recursively) from cluster
			-- `a_cluster' has a dependant class `a_dependant' which is not
			-- contained in the dependence constraint `a_constraint'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_dependant_not_void: a_dependant /= Void
			a_dependant_preparsed: a_dependant.is_preparsed
			a_constraint_not_void: a_constraint /= Void
		local
			i, nb: INTEGER
			a_string: STRING
			l_group_names: DS_ARRAYED_LIST [STRING]
			l_group_pathnames: DS_HASH_TABLE [LX_WILDCARD, STRING]
			l_cursor: DS_HASH_TABLE_CURSOR [LX_WILDCARD, STRING]
		do
			code := gcdep_template_code
			etl_code := gcdep_etl_code
			default_template := gcdep_default_template
			cluster := a_cluster
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_lower_name ('/'), 2)
			parameters.put (a_class.upper_name, 3)
			parameters.put (a_class.group.full_lower_name ('/'), 4)
			parameters.put (a_dependant.upper_name, 5)
			parameters.put (a_dependant.group.full_lower_name ('/'), 6)
			l_group_names := a_constraint.group_names
			nb := l_group_names.count
			if nb = 0 then
				l_group_pathnames := a_constraint.group_pathnames
				if not l_group_pathnames.is_empty then
					create a_string.make (50)
					l_cursor := l_group_pathnames.new_cursor
					from l_cursor.start until l_cursor.after loop
						if not a_string.is_empty then
							a_string.append_string (", ")
						end
						a_string.append_string (l_cursor.key)
						l_cursor.forth
					end
				else
					a_string := a_constraint.current_cluster.full_lower_name ('/')
				end
			else
				create a_string.make (50)
				from i := 1 until i > nb loop
					a_string.append_string (l_group_names.item (i))
					a_string.append_string (", ")
					i := i + 1
				end
				a_string.append_string (a_constraint.current_cluster.full_lower_name ('/'))
			end
			parameters.put (a_string, 7)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = class name
			-- dollar3: $4 = class' group full name
			-- dollar5: $5 = dependant name
			-- dollar6: $6 = dependant's group full name
			-- dollar7: $7 = constraint cluster list
		end

	make_gcpro (a_cluster: like cluster; a_class, a_provider: ET_CLASS; a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT)
			-- Create a new GCPRO error: class `a_class' (recursively) from cluster
			-- `a_cluster' has a provider class `a_provider' which is not
			-- contained in the dependence constraint `a_constraint'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_provider_not_void: a_provider /= Void
			a_provider_preparsed: a_provider.is_preparsed
			a_constraint_not_void: a_constraint /= Void
		local
			i, nb: INTEGER
			a_string: STRING
			l_group_names: DS_ARRAYED_LIST [STRING]
			l_group_pathnames: DS_HASH_TABLE [LX_WILDCARD, STRING]
			l_cursor: DS_HASH_TABLE_CURSOR [LX_WILDCARD, STRING]
		do
			code := gcpro_template_code
			etl_code := gcpro_etl_code
			default_template := gcpro_default_template
			cluster := a_cluster
			create parameters.make_filled (empty_string, 1, 7)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_lower_name ('/'), 2)
			parameters.put (a_class.upper_name, 3)
			parameters.put (a_class.group.full_lower_name ('/'), 4)
			parameters.put (a_provider.upper_name, 5)
			parameters.put (a_provider.group.full_lower_name ('/'), 6)
			l_group_names := a_constraint.group_names
			nb := l_group_names.count
			if nb = 0 then
				l_group_pathnames := a_constraint.group_pathnames
				if not l_group_pathnames.is_empty then
					create a_string.make (50)
					l_cursor := l_group_pathnames.new_cursor
					from l_cursor.start until l_cursor.after loop
						if not a_string.is_empty then
							a_string.append_string (", ")
						end
						a_string.append_string (l_cursor.key)
						l_cursor.forth
					end
				else
					a_string := a_constraint.current_cluster.full_lower_name ('/')
				end
			else
				create a_string.make (50)
				from i := 1 until i > nb loop
					a_string.append_string (l_group_names.item (i))
					a_string.append_string (", ")
					i := i + 1
				end
				a_string.append_string (a_constraint.current_cluster.full_lower_name ('/'))
			end
			parameters.put (a_string, 7)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = class name
			-- dollar3: $4 = class' group full name
			-- dollar5: $5 = provider name
			-- dollar6: $6 = provider's group full name
			-- dollar7: $7 = constraint cluster list
		end

	make_gcscm (a_cluster: like cluster; a_message: STRING)
			-- Create a new GCSCM error: there was an error when retrieving
			-- the SCM mapping description for `a_cluster', as explained in
			-- `a_message'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_message_not_void: a_message /= Void
		do
			code := gcscm_template_code
			etl_code := gcscm_etl_code
			default_template := gcscm_default_template
			cluster := a_cluster
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_lower_name ('/'), 2)
			parameters.put (a_message, 3)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = message
		end

feature -- Access

	cluster: ET_CLUSTER
			-- Cluster where current error occurred

feature -- Setting

	set_cluster (a_cluster: like cluster)
			-- Set `cluster' to `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			cluster := a_cluster
		ensure
			cluster_set: cluster = a_cluster
		end

feature {NONE} -- Implementation

	gcaaa_default_template: STRING = "[$1] cluster $2: cannot read cluster directory '$3'."
	gcaab_default_template: STRING = "[$1] cluster $2: cannot read Eiffel file '$3'."
	gcdep_default_template: STRING = "[$1] cluster $2: class $3 (from cluster $4) is a provider of class $5 (from cluster $6) which is not contained in any of the clusters $7."
	gcpro_default_template: STRING = "[$1] cluster $2: class $3 (from cluster $4) depends on class $5 (from cluster $6) which is not contained in any of the clusters $7."
	gcscm_default_template: STRING = "[$1] cluster $2: $3"
			-- Default templates

	gcaaa_etl_code: STRING = "GCAAA"
	gcaab_etl_code: STRING = "GCAAB"
	gcdep_etl_code: STRING = "GCDEP"
	gcpro_etl_code: STRING = "GCPRO"
	gcscm_etl_code: STRING = "GCSCM"
			-- ETL validity codes

	gcaaa_template_code: STRING = "gcaaa"
	gcaab_template_code: STRING = "gcaab"
	gcdep_template_code: STRING = "gcdep"
	gcpro_template_code: STRING = "gcpro"
	gcscm_template_code: STRING = "gcscm"
			-- Template error codes

invariant

	cluster_not_void: cluster /= Void

end
