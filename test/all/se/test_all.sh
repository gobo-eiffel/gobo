#!/local/bin/bash

echo "Testing precomp..."
$GOBO/test/all/se/test_precomp.sh $1

echo ""
echo "Testing Gobo Eiffel Structure Library..."
$GOBO/test/all/se/test_structure.sh $1

echo ""
echo "Testing geyacc..."
$GOBO/test/all/se/test_geyacc.sh $1

echo ""
echo "Testing gelex..."
$GOBO/test/all/se/test_gelex.sh $1

echo ""
echo "Testing gepp..."
$GOBO/test/all/se/test_gepp.sh $1

echo ""
echo "Testing example ascii2ps..."
$GOBO/test/all/se/test_ascii2ps.sh $1

echo ""
echo "Testing example gegrep..."
$GOBO/test/all/se/test_gegrep.sh $1

echo ""
echo "Testing example eiffel_scanner..."
$GOBO/test/all/se/test_eiffel_scanner.sh $1

echo ""
echo "Testing example eiffel_parser..."
$GOBO/test/all/se/test_eiffel_parser.sh $1

echo ""
echo "Testing example rpcalc..."
$GOBO/test/all/se/test_rpcalc.sh $1

echo ""
echo "Testing example calc..."
$GOBO/test/all/se/test_calc.sh $1

echo ""
echo "Testing example mcalc..."
$GOBO/test/all/se/test_mcalc.sh $1
