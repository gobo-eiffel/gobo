<schema>
  <!-- Evaluates conformance reports for Screamatron Torture Test -->
  <pattern>
	<rule context="/">
	    	<report test="count(*)=0"
		>FAIL: no output produced (This report can never happen! Verify by hand)"</report>
 	</rule>
	<rule context="successful-report | failed-assert">
		<report test="1=1"
		>FAIL: there should be no validity errors reported</report>
	</rule>
	<rule context="/*">
		<assert test="self::schematron-output"
		>FAIL: <name/> top-level element should be "schematron-output"</assert>

		<assert test="count(text)=3"
		>FAIL: the should be 3 text elements under schematron-output element</assert>
		<assert test="count(ns)=1"
		>FAIL: there should be one ns elment under schematron-output element</assert>

		<assert test="count(active-pattern)=3"
		>FAIL: there should be three active-element</assert>

		<assert diagnostics="number" test="count(fired-rule)=(383)"
		>FAIL: There should be 383 rules fired (previous version 381)</assert>
	
	</rule>
 </pattern>
	<diagnostics >
		<diagnostic id="number"
		>...<value-of select="count(fired-rule)"/></diagnostic>
	</diagnostics>
</schema>
