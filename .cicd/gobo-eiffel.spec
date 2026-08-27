# Map RPM arch names to the naming used in GitHub release assets.
%ifarch x86_64
%global gobo_arch  x86_64
%endif
%ifarch aarch64
%global gobo_arch  arm64
%endif

# gobo_full_version is the string that gec --version returns, used verbatim
# in the asset filename.  It is passed at build time via:
#   rpmbuild --define "gobo_full_version YY.MM.DD+commit"
# The Version tag uses only the YY.MM part (from the release tag).
%{!?gobo_full_version: %global gobo_full_version %{version}}

Name:           gobo-eiffel
Version:        26.05
Release:        1%{?dist}
Summary:        Portable Eiffel libraries and tools

License:        MIT
URL:            https://github.com/gobo-eiffel/gobo

# The binary archive is produced by the GitHub pipeline and already contains
# all compiled tool binaries.  It unpacks to a single top-level directory
# named "gobo/".  The archive is renamed to a stable filename by the CI job
# before being handed to rpmbuild.
Source0:        gobo-linux-%{gobo_arch}-%{gobo_full_version}.tar.xz

# No source compilation needed; binaries are pre-compiled.
%global debug_package %{nil}

# Gobo is a self-contained tree: every binary locates itself via /proc/self/exe
# and infers $GOBO = parent(parent(binary)) = /usr/lib/gobo.
# The entire package therefore lives under a single prefix.
# Symlinks in /usr/bin point to the real files in /usr/lib/gobo/bin/ so that
# the kernel resolves the symlink before exec, meaning /proc/self/exe always
# returns the real path and the self-location logic in each binary still works.
%define gobodir  %{_libdir}/gobo

%description
Gobo Eiffel provides portable Eiffel libraries and tools that work across
multiple Eiffel compilers. The package includes:

Libraries (in %{gobodir}/library/):
  argument, free_elks, kernel, lexical, math, parse, pattern,
  regexp, string, structure, test, time, tools, utility, xml

Tools (in %{gobodir}/bin/, also accessible via /usr/bin symlinks):
  gec      - Gobo Eiffel Compiler
  gecc     - Gobo Eiffel C Compiler driver
  geant    - Gobo Eiffel Ant (build tool)
  gedoc    - Gobo Eiffel Documentation generator
  gecop    - Gobo Eiffel Code Pretty-printer
  geimage  - Gobo Eiffel Image tool
  gelex    - Gobo Eiffel Lex (lexer generator)
  gelint   - Gobo Eiffel Lint (static analysis)
  gelsp    - Gobo Eiffel Language Server Protocol
  gepp     - Gobo Eiffel Preprocessor
  getest   - Gobo Eiffel Test (unit test framework)
  gexslt   - Gobo Eiffel XSLT Processor
  geyacc   - Gobo Eiffel Yacc (parser generator)

The C runtime headers and compiler configuration required by gec are
included in %{gobodir}/tool/gec/backend/c/.

%prep
%setup -q -n gobo

%build
# Binaries are already compiled in the binary archive; nothing to build.

%install
# Install the entire archive tree under %{gobodir}. Keeping all files
# together is what makes the zero-env-var, self-relocating design work.
install -d %{buildroot}%{gobodir}
cp -a . %{buildroot}%{gobodir}/

# Default C compiler for gec on Linux.  The delivery archive sets this to
# "zig" (used during CI build); reset it to gcc for standard Linux installs.
echo gcc > %{buildroot}%{gobodir}/tool/gec/backend/c/config/default.cfg

# Symlinks in /usr/bin so the tools are on PATH without setting any env var.
# Because Linux resolves symlinks before exec, /proc/self/exe returns the
# real path (%{gobodir}/bin/<tool>) and the self-location logic in each
# binary correctly infers GOBO=%{gobodir}.
install -d %{buildroot}%{_bindir}
for tool in gec gecc geant gedoc gecop geimage gelex gelint gelsp gepp getest gexslt geyacc; do
    if [ -f %{buildroot}%{gobodir}/bin/$tool ]; then
        ln -s %{gobodir}/bin/$tool %{buildroot}%{_bindir}/$tool
    fi
done

%files
%license %{gobodir}/LICENSE.txt
%doc %{gobodir}/Readme.md %{gobodir}/History.md %{gobodir}/Release_notes.md
%{gobodir}/bin/
%{gobodir}/library/
%{gobodir}/tool/
%{gobodir}/misc/
%{gobodir}/build.eant
%{_bindir}/gec
%{_bindir}/gecc
%{_bindir}/geant
%{_bindir}/gedoc
%{_bindir}/gecop
%{_bindir}/geimage
%{_bindir}/gelex
%{_bindir}/gelint
%{_bindir}/gelsp
%{_bindir}/gepp
%{_bindir}/getest
%{_bindir}/gexslt
%{_bindir}/geyacc

%changelog
* Tue May 26 2026 Gobo Eiffel packager - 26.05-1
- Initial RPM package built from pre-compiled binary archive
- All files installed under /usr/lib/gobo/ to preserve the self-relocation
  mechanism (binaries infer $GOBO from their own location via /proc/self/exe)
- /usr/bin symlinks provide PATH access without any environment variable
