#!/local/bin/bash

echo "Testing precomp..."
$GOBO/test/all/ise/test_precomp.sh $1

echo ""
echo "Testing precomp-base..."
$GOBO/test/all/ise/test_precomp_base.sh $1

echo ""
echo "Testing Gobo Eiffel Structure Library..."
$GOBO/test/all/ise/test_structure.sh $1

echo ""
echo "Testing geyacc..."
$GOBO/test/all/ise/test_geyacc.sh $1

echo ""
echo "Testing gelex..."
$GOBO/test/all/ise/test_gelex.sh $1

echo ""
echo "Testing gepp..."
$GOBO/test/all/ise/test_gepp.sh $1

echo ""
echo "Testing example ascii2ps..."
$GOBO/test/all/ise/test_ascii2ps.sh $1

echo ""
echo "Testing example gegrep..."
$GOBO/test/all/ise/test_gegrep.sh $1

echo ""
echo "Testing example eiffel_scanner..."
$GOBO/test/all/ise/test_eiffel_scanner.sh $1

echo ""
echo "Testing example eiffel_parser..."
$GOBO/test/all/ise/test_eiffel_parser.sh $1

echo ""
echo "Testing example rpcalc..."
$GOBO/test/all/ise/test_rpcalc.sh $1

echo ""
echo "Testing example calc..."
$GOBO/test/all/ise/test_calc.sh $1

echo ""
echo "Testing example mcalc..."
$GOBO/test/all/ise/test_mcalc.sh $1
