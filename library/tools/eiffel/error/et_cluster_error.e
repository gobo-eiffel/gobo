indexing

	description:

		"Eiffel cluster errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTER_ERROR

inherit

	ET_ERROR

creation

	make_gcaaa,
	make_gcaab

feature {NONE} -- Initialization

	make_gcaaa (a_cluster: like cluster; a_dirname: STRING) is
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
			create parameters.make (1, 3)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_name ('.'), 2)
			parameters.put (a_dirname, 3)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = cluster full pathname
		end

	make_gcaab (a_cluster: like cluster; a_filename: STRING) is
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
			create parameters.make (1, 3)
			parameters.put (etl_code, 1)
			parameters.put (cluster.full_name ('.'), 2)
			parameters.put (a_filename, 3)
		ensure
			cluster_set: cluster = a_cluster
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = cluster full name
			-- dollar3: $3 = filename
		end

feature -- Access

	cluster: ET_CLUSTER
			-- Cluster where current error occurred

feature -- Setting

	set_cluster (a_cluster: like cluster) is
			-- Set `cluster' to `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			cluster := a_cluster
		ensure
			cluster_set: cluster = a_cluster
		end

feature {NONE} -- Implementation

	gcaaa_default_template: STRING is "[$1] Cluster $2: cannot read cluster directory '$3'."
	gcaab_default_template: STRING is "[$1] Cluster $2: cannot read Eiffel file '$3'."
			-- Default templates

	gcaaa_etl_code: STRING is "GCAAA"
	gcaab_etl_code: STRING is "GCAAB"
			-- ETL validity codes

	gcaaa_template_code: STRING is "gcaaa"
	gcaab_template_code: STRING is "gcaab"
			-- Template error codes

invariant

	cluster_not_void: cluster /= Void

end
