#!/local/bin/bash

echo "Testing Gobo Eiffel Structure Library..."
$GOBO/test/all/hact/test_structure.sh $1

echo ""
echo "Testing geyacc..."
$GOBO/test/all/hact/test_geyacc.sh $1

echo ""
echo "Testing gelex..."
$GOBO/test/all/hact/test_gelex.sh $1

echo ""
echo "Testing gepp..."
$GOBO/test/all/hact/test_gepp.sh $1

echo ""
echo "Testing example ascii2ps..."
$GOBO/test/all/hact/test_ascii2ps.sh $1

echo ""
echo "Testing example gegrep..."
$GOBO/test/all/hact/test_gegrep.sh $1

echo ""
echo "Testing example eiffel_scanner..."
$GOBO/test/all/hact/test_eiffel_scanner.sh $1

echo ""
echo "Testing example eiffel_parser..."
$GOBO/test/all/hact/test_eiffel_parser.sh $1

echo ""
echo "Testing example calculator..."
$GOBO/test/all/hact/test_calculator.sh $1

echo ""
echo "Testing example rpcalc..."
$GOBO/test/all/hact/test_rpcalc.sh $1

echo ""
echo "Testing example calc..."
$GOBO/test/all/hact/test_calc.sh $1

echo ""
echo "Testing example mcalc..."
$GOBO/test/all/hact/test_mcalc.sh $1
