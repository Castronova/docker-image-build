#!/usr/bin/env bats

source '/tmp/bats-support/load.bash'
source '/tmp/bats-assert/load.bash'
source '/tmp/bats-file/load.bash'


# Basic grid analysis
@test "mpiexec -np 3 pitremove logan.tif -fel loganfel.tif" {
cd Base
mpiexec -np 3 pitremove logan.tif
assert_file_exist loganfel.tif
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfel4.tiff -4way" {
cd Base
mpiexec -np 3 pitremove -z logan.tif -fel loganfel4.tiff -4way
assert_file_exist loganfel4.tiff
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfeldm.tif -depmask logpitmask.tif" {
cd Base
mpiexec -np 3 pitremove -z logan.tif -fel loganfeldm.tif -depmask logpitmask.tif
assert_file_exist loganfeldm.tif
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfeldm4.tif -depmask logpitmask.tif -4way" {
cd Base
mpiexec -np 3 pitremove -z logan.tif -fel loganfeldm4.tif -depmask logpitmask.tif -4way
assert_file_exist loganfeldm4.tif
}
@test "mpiexec -n 5 d8flowdir -p loganp.tif -sd8 logansd8.tif -fel loganfel.tif" {
cd Base
mpiexec -n 5 d8flowdir -p loganp.tif -sd8 logansd8.tif -fel loganfel.tif
assert_file_exist logansd8.tif
}
@test "mpiexec -n 4 dinfflowdir -ang loganang.tif -slp loganslp.tif -fel loganfel.tif" {
cd Base
mpiexec -n 4 dinfflowdir -ang loganang.tif -slp loganslp.tif -fel loganfel.tif
}
@test "mpiexec -n 6 d8flowdir -p loganpnf.tif -sd8 logansd8nf.tif -fel logan.tif" {
cd Base
mpiexec -n 6 d8flowdir -p loganpnf.tif -sd8 logansd8nf.tif -fel logan.tif
}
@test "mpiexec -n 3 dinfflowdir -ang loganangnf.tif -slp loganslpnf.tif -fel logan.tif" {
cd Base
mpiexec -n 3 dinfflowdir -ang loganangnf.tif -slp loganslpnf.tif -fel logan.tif
}
@test "mpiexec -np 4 aread8 logan.tif" {
cd Base
mpiexec -np 4 aread8 logan.tif
}
@test "mpiexec -np 12 areadinf logan.tif" {
cd Base
mpiexec -np 12 areadinf logan.tif
}
@test "mpiexec -np 4 aread8 -p loganpnf.tif -ad8 loganad8nf.tif" {
cd Base
mpiexec -np 4 aread8 -p loganpnf.tif -ad8 loganad8nf.tif
}
@test "mpiexec -np 12 areadinf -ang loganangnf.tif -sca loganscanf.tif" {
cd Base
mpiexec -np 12 areadinf -ang loganangnf.tif -sca loganscanf.tif
}
@test "mpiexec -n 7 aread8 -p loganp.tif -o Outlet.shp -ad8 loganad8o.tif" {
cd Base
mpiexec -n 7 aread8 -p loganp.tif -o Outlet.shp -ad8 loganad8o.tif
}
@test "mpiexec -n 1 areadinf -ang loganang.tif -o Outlet.shp -sca loganscao.tif" {
cd Base
mpiexec -n 1 areadinf -ang loganang.tif -o Outlet.shp -sca loganscao.tif
}
@test "mpiexec -n 5 gridnet -p loganp.tif -plen loganplen.tif -tlen logantlen.tif -gord logangord.tif" {
cd Base
mpiexec -n 5 gridnet -p loganp.tif -plen loganplen.tif -tlen logantlen.tif -gord logangord.tif 
}
@test "mpiexec -n 5 gridnet -p loganp.tif -plen loganplen1.tif -tlen logantlen1.tif -gord logangord1.tif -mask loganad8.tif -thresh 100" {
cd Base
mpiexec -n 5 gridnet -p loganp.tif -plen loganplen1.tif -tlen logantlen1.tif -gord logangord1.tif -mask loganad8.tif -thresh 100 
}
@test "mpiexec -n 7 gridnet -p loganp.tif -plen loganplen2.tif -tlen logantlen2.tif -gord logangord2.tif -o Outlet.shp" {
cd Base
mpiexec -n 7 gridnet -p loganp.tif -plen loganplen2.tif -tlen logantlen2.tif -gord logangord2.tif -o Outlet.shp 
}

#stream network peuker douglas
@test "mpiexec -np 7 peukerdouglas -fel loganfel.tif -ss loganss.tif" {
cd Base
mpiexec -np 7 peukerdouglas -fel loganfel.tif -ss loganss.tif
}
@test "mpiexec -n 4 aread8 -p loganp.tif -o Outlet.shp -ad8 loganssa.tif -wg loganss.tif" {
cd Base
mpiexec -n 4 aread8 -p loganp.tif -o Outlet.shp -ad8 loganssa.tif -wg loganss.tif
}
@test "mpiexec -n 4 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp.txt -o Outlet.shp -par 5 500 10 0" {
cd Base
mpiexec -n 4 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp.txt -o Outlet.shp -par 5 500 10 0 
}
@test "mpiexec -n 5 threshold -ssa loganssa.tif -src logansrc.tif -thresh 180" {
cd Base
mpiexec -n 5 threshold -ssa loganssa.tif -src logansrc.tif -thresh 180
}
@test "mpiexec -n 5 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet.shp -w loganw.tif -o Outlet.shp" {
cd Base
mpiexec -n 5 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet.shp -w loganw.tif -o Outlet.shp
}


#stream network slope area
@test "mpiexec -n 3 slopearea -slp loganslp.tif -sca logansca.tif -sa logansa.tif -par 2 1" {
cd Base
mpiexec -n 3 slopearea -slp loganslp.tif -sca logansca.tif -sa logansa.tif -par 2 1
}
@test "mpiexec -n 8 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa1.tif -o Outlet.shp" {
cd Base
mpiexec -n 8 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa1.tif -o Outlet.shp
}
@test "mpiexec -n 4 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa1.tif -drp logandrp1.txt -o Outlet.shp -par 5000 50000 10 1" {
cd Base
mpiexec -n 4 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa1.tif -drp logandrp1.txt -o Outlet.shp -par 5000 50000 10 1 
}
@test "mpiexec -n 5 threshold -ssa loganssa1.tif -src logansrc1.tif -thresh 15000" {
cd Base
mpiexec -n 5 threshold -ssa loganssa1.tif -src logansrc1.tif -thresh 15000
}
@test "mpiexec -n 8 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc1.tif -ord loganord5.tif -tree logantree1.dat -coord logancoord1.dat -net logannet1.shp -w loganw1.tif -o Outlet.shp -sw" {
cd Base
mpiexec -n 8 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc1.tif -ord loganord5.tif -tree logantree1.dat -coord logancoord1.dat -net logannet1.shp -w loganw1.tif -o Outlet.shp -sw
}
@test "mpiexec -n 3 lengtharea -plen loganplen.tif -ad8 loganad8.tif -ss loganlass.tif -par 0.03 1.3" {
cd Base
mpiexec -n 3 lengtharea -plen loganplen.tif -ad8 loganad8.tif -ss loganlass.tif -par 0.03 1.3
}

#Specialized grid analysis
@test "mpiexec -n 3 slopearearatio -slp loganslp.tif -sca logansca.tif -sar logansar.tiff" {
cd Base
mpiexec -n 3 slopearearatio -slp loganslp.tif -sca logansca.tif -sar logansar.tiff
}
@test "mpiexec -np 7 d8hdisttostrm -p loganp.tif -src loganad8.tif -dist logandist1.tif -thresh 200" {
cd Base
mpiexec -np 7 d8hdisttostrm -p loganp.tif -src loganad8.tif -dist logandist1.tif -thresh 200 
}
@test "mpiexec -np 5 d8hdisttostrm -p loganp.tif -src logansrc.tif -dist logandist.tif" {
cd Base
mpiexec -np 5 d8hdisttostrm -p loganp.tif -src logansrc.tif -dist logandist.tif 
}

#downslope influence
@test "mpiexec -np 1 areadinf -ang loganang.tif -wg logandg.tif -sca logandi.tif" {
cd Base
mpiexec -np 1 areadinf -ang loganang.tif -wg logandg.tif -sca logandi.tif
}
@test "mpiexec -n 2 dinfupdependence -ang loganang.tif -dg logandg.tif -dep logandep.tif" {
cd Base
mpiexec -n 2 dinfupdependence -ang loganang.tif -dg logandg.tif -dep logandep.tif
}
@test "mpiexec -n 7 dinfdecayaccum -ang loganang.tif -dm logandm08.tif -dsca logandsca.tif" {
cd Base
mpiexec -n 7 dinfdecayaccum -ang loganang.tif -dm logandm08.tif -dsca logandsca.tif 
}
@test "mpiexec -n 3 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpt.tif -q logansca.tif" {
cd Base
mpiexec -n 3 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpt.tif -q logansca.tif 
}
@test "mpiexec -n 5 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto.tif -q logansca.tif  -o Outlet.shp -csol 2.4" {
cd Base
mpiexec -n 5 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto.tif -q logansca.tif  -o Outlet.shp -csol 2.4
}

#Trans lim accum
@test "mpiexec -n 7 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla.tif -tdep logantdep.tif" {
cd Base
mpiexec -n 7 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla.tif -tdep logantdep.tif
}
@test "mpiexec -n 6 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla1.tif -tdep logantdep1.tif -o Outlet.shp -cs logandg.tif -ctpt loganctpt1.tif" {
cd Base
mpiexec -n 6 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla1.tif -tdep logantdep1.tif -o Outlet.shp -cs logandg.tif -ctpt loganctpt1.tif 
}

#REVERSE ACCUMULATION
@test "mpiexec -n 4 dinfrevaccum -ang loganang.tif -wg logandg.tif -racc loganracc.tif -dmax loganrdmax.tif" {
cd Base
mpiexec -n 4 dinfrevaccum -ang loganang.tif -wg logandg.tif -racc loganracc.tif -dmax loganrdmax.tif
}

#MOVEOUTLETS
@test "mpiexec -n 5 threshold -ssa loganad8.tif -src logansrc2.tif -thresh 200" {
cd Base
mpiexec -n 5 threshold -ssa loganad8.tif -src logansrc2.tif -thresh 200
}
@test "mpiexec -np 3 moveoutletstostrm -p loganp.tif -src logansrc.tif -o OutletstoMove.shp -om Outletsmoved.shp -md 20" {
cd Base
mpiexec -np 3 moveoutletstostrm -p loganp.tif -src logansrc.tif -o OutletstoMove.shp -om Outletsmoved.shp -md 20 
}

#DISTDOWN
@test "mpiexec -n 1 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhave.tif" {
cd Base
mpiexec -n 1 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhave.tif
}
@test "mpiexec -n 2 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhmin.tif -m min h" {
cd Base
mpiexec -n 2 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhmin.tif -m min h
}
@test "mpiexec -n 3 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhmax.tif -m max h" {
cd Base
mpiexec -n 3 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhmax.tif -m max h
}
@test "mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvave.tif -m ave v" {
cd Base
mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvave.tif -m ave v
}
@test "mpiexec -n 5 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvmin.tif -m min v" {
cd Base
mpiexec -n 5 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvmin.tif -m min v
}
@test "mpiexec -n 6 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvmax.tif -m max v" {
cd Base
mpiexec -n 6 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvmax.tif -m max v
}
@test "mpiexec -n 7 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsave.tif -m ave s" {
cd Base
mpiexec -n 7 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsave.tif -m ave s
}
@test "mpiexec -n 8 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmin.tif -m min s" {
cd Base
mpiexec -n 8 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmin.tif -m min s
}
@test "mpiexec -n 1 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmax.tif -m max s" {
cd Base
mpiexec -n 1 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmax.tif -m max s
}
@test "mpiexec -n 2 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpave.tif -m ave p" {
cd Base
mpiexec -n 2 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpave.tif -m ave p
}
@test "mpiexec -n 3 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpmin.tif -m min p" {
cd Base
mpiexec -n 3 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpmin.tif -m min p
}
@test "mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpmax.tif -m max p" {
cd Base
mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpmax.tif -m max p
}
@test "mpiexec -n 2 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvavenc.tif -m ave v -nc" {
cd Base
mpiexec -n 2 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddvavenc.tif -m ave v -nc
}
@test "mpiexec -n 3 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhminnc.tif -m min h -nc" {
cd Base
mpiexec -n 3 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhminnc.tif -m min h -nc
}
@test "mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpmaxnc.tif -m max p -nc" {
cd Base
mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddpmaxnc.tif -m max p -nc
}
@test "mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmaxnc.tif -m max s -nc" {
cd Base
mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmaxnc.tif -m max s -nc
}
@test "mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmaxwg.tif -m max s -wg logandwg.tif" {
cd Base
mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddsmaxwg.tif -m max s -wg logandwg.tif
}
@test "mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhavewg.tif -m ave h -wg logandwg.tif" {
cd Base
mpiexec -n 4 dinfdistdown -ang loganang.tif -fel loganfel.tif -src logansrc.tif -dd loganddhavewg.tif -m ave h -wg logandwg.tif
}

#DISTANCE UP
@test "mpiexec -n 1 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhave.tif" {
cd Base
mpiexec -n 1 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhave.tif
}
@test "mpiexec -n 2 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhmin.tif -m min h -thresh 0.5" {
cd Base
mpiexec -n 2 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhmin.tif -m min h -thresh 0.5
}
@test "mpiexec -n 3 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhmax.tif -m max h -thresh 0.8" {
cd Base
mpiexec -n 3 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhmax.tif -m max h -thresh 0.8
}
@test "mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvave.tif -m ave v" {
cd Base
mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvave.tif -m ave v
}
@test "mpiexec -n 5 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvmin.tif -m min v" {
cd Base
mpiexec -n 5 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvmin.tif -m min v
}
@test "mpiexec -n 6 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvmax.tif -m max v" {
cd Base
mpiexec -n 6 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvmax.tif -m max v
}
@test "mpiexec -n 7 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusave.tif -m ave s -thresh 0.9" {
cd Base
mpiexec -n 7 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusave.tif -m ave s -thresh 0.9
}
@test "mpiexec -n 8 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusmin.tif -m min s" {
cd Base
mpiexec -n 8 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusmin.tif -m min s
}
@test "mpiexec -n 1 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusmax.tif -m max s" {
cd Base
mpiexec -n 1 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusmax.tif -m max s
}
@test "mpiexec -n 2 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupave.tif -m ave p" {
cd Base
mpiexec -n 2 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupave.tif -m ave p
}
@test "mpiexec -n 3 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupmin.tif -m min p" {
cd Base
mpiexec -n 3 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupmin.tif -m min p
}
@test "mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupmax.tif -m max p" {
cd Base
mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupmax.tif -m max p
}
@test "mpiexec -n 2 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvavenc.tif -m ave v -nc" {
cd Base
mpiexec -n 2 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduvavenc.tif -m ave v -nc
}
@test "mpiexec -n 3 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhminnc.tif -m min h -nc" {
cd Base
mpiexec -n 3 dinfdistup -ang loganang.tif -fel loganfel.tif -du loganduhminnc.tif -m min h -nc
}
@test "mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupmaxnc.tif -m max p -nc" {
cd Base
mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandupmaxnc.tif -m max p -nc
}
@test "mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusmaxnc.tif -m max s -nc" {
cd Base
mpiexec -n 4 dinfdistup -ang loganang.tif -fel loganfel.tif -du logandusmaxnc.tif -m max s -nc
}

#AVALANCHE
@test "mpiexec -n 2 dinfavalanche -ang loganang.tif -fel loganfel.tif -ass loganass.tif -rz loganrz.tif -dfs logandfs.tif" {
cd Base
mpiexec -n 2 dinfavalanche -ang loganang.tif -fel loganfel.tif -ass loganass.tif -rz loganrz.tif -dfs logandfs.tif
}
@test "mpiexec -n 3 dinfavalanche -ang loganang.tif -fel loganfel.tif -ass loganass.tif -rz loganrz1.tif -dfs logandfs1.tif -thresh 0.1 -alpha 10" {
cd Base
mpiexec -n 3 dinfavalanche -ang loganang.tif -fel loganfel.tif -ass loganass.tif -rz loganrz1.tif -dfs logandfs1.tif -thresh 0.1 -alpha 10
}
@test "mpiexec -n 4 dinfavalanche -ang loganang.tif -fel loganfel.tif -ass loganass.tif -rz loganrz2.tif -dfs logandfs2.tif -direct -thresh 0.01 -alpha 5" {
cd Base
mpiexec -n 4 dinfavalanche -ang loganang.tif -fel loganfel.tif -ass loganass.tif -rz loganrz2.tif -dfs logandfs2.tif -direct -thresh 0.01 -alpha 5
}

#SLOPEAVEDOWN
@test "mpiexec -n 3 slopeavedown -p loganp.tif -fel loganfel.tif -slpd loganslpd.tif" {
cd Base
mpiexec -n 3 slopeavedown -p loganp.tif -fel loganfel.tif -slpd loganslpd.tif
}
@test "mpiexec -n 3 slopeavedown -p loganp.tif -fel loganfel.tif -slpd loganslpd1.tif -dn 1000" {
cd Base
mpiexec -n 3 slopeavedown -p loganp.tif -fel loganfel.tif -slpd loganslpd1.tif -dn 1000
}

#test case for tiffio partitions within a stripe
@test "mpiexec -n 6 areadinf -ang topo3fel1ang.tif -sca topo3fel1sca.tif" {
cd Base
mpiexec -n 6 areadinf -ang topo3fel1ang.tif -sca topo3fel1sca.tif 
}

#test case for double precision file
@test "mpiexec -n 4 areadinf -ang demDoubleang.tif -sca demDoublesca.tif -wg demDoublewgt.tif" {
cd Base
mpiexec -n 4 areadinf -ang demDoubleang.tif -sca demDoublesca.tif -wg demDoublewgt.tif
}

#gagewatershed test
@test "mpiexec -n 7 gagewatershed -p loganp.tif -o Outletsmoved.shp -gw logangw.tif -id gwid.txt" {
cd Base
mpiexec -n 7 gagewatershed -p loganp.tif -o Outletsmoved.shp -gw logangw.tif -id gwid.txt
}
@test "mpiexec -n 4 gagewatershed -p loganp.tif -o Outletsmoved.shp -gw logangw1.tif" {
cd Base
mpiexec -n 4 gagewatershed -p loganp.tif -o Outletsmoved.shp -gw logangw1.tif 
}
@test "mpiexec -n 5 gagewatershed -p logantp.img -o Outletsmoved2.shp -gw logangw1.tif -id gwid1.txt -upid gwup.txt" {
cd Base
mpiexec -n 5 gagewatershed -p logantp.img -o Outletsmoved2.shp -gw logangw1.tif -id gwid1.txt -upid gwup.txt
}

#Connect down
#@test "mpiexec -n 8 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets.shp -od loganOutlets_Moved.shp -d 1" {
#cd Base
#mpiexec -n 8 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets.shp -od loganOutlets_Moved.shp -d 1
#}

####################################################################
####################################################################

#tests on ft steward data with stream buffer
@test "mpiexec -n 3 pitremove fs_small.tif" {
cd fts
mpiexec -n 3 pitremove fs_small.tif
}
@test "mpiexec -n 4 dinfflowdir fs_small.tif" {
cd fts
mpiexec -n 4 dinfflowdir fs_small.tif
}
@test "mpiexec -n 4 d8flowdir fs_small.tif" {
cd fts
mpiexec -n 4 d8flowdir fs_small.tif
}
@test "mpiexec -n 1 aread8 fs_small.tif" {
cd fts
mpiexec -n 1 aread8 fs_small.tif
}
@test "mpiexec -n 2 threshold -ssa fs_smallad8.tif -src fs_smallsrc.tif -thresh 500" {
cd fts
mpiexec -n 2 threshold -ssa fs_smallad8.tif -src fs_smallsrc.tif -thresh 500
}
@test "mpiexec -n 5 dinfdistdown -ang fs_smallang.tif -fel fs_smallfel.tif -src fs_smallsrc.tif -dd fs_smallddhavewg.tif -m ave h -wg streambuffreclass2.tif" {
cd fts
mpiexec -n 5 dinfdistdown -ang fs_smallang.tif -fel fs_smallfel.tif -src fs_smallsrc.tif -dd fs_smallddhavewg.tif -m ave h -wg streambuffreclass2.tif
}

####################################################################
####################################################################

#test with compressed 16 bit unsigned integer that a user had trouble with
@test "mpiexec -n 8 pitremove MED_01_01.tif" {
cd Base
mpiexec -n 8 pitremove MED_01_01.tif
}

#test with VRT format
@test "mpiexec -n 8 pitremove -z LoganVRT/output.vrt -fel loganvrtfel.tif" {
cd Base
mpiexec -n 8 pitremove -z LoganVRT/output.vrt -fel loganvrtfel.tif
}

#test with img file format
@test "mpiexec -n 8 pitremove -z loganIMG/logan.img -fel loganimgfel.tif" {
cd Base
mpiexec -n 8 pitremove -z loganIMG/logan.img -fel loganimgfel.tif
}

#test with ESRIGRID file format
@test "mpiexec -n 8 pitremove -z loganESRIGRID/logan -fel loganesrigridfel.tif" {
cd Base
mpiexec -n 8 pitremove -z loganESRIGRID/logan -fel loganesrigridfel.tif
}

####################################################################
####################################################################


# Basic grid analysis
@test "mpiexec -np 3 pitremove enogeo.tif" {
cd Geographic
mpiexec -np 3 pitremove enogeo.tif  
}
@test "mpiexec -n 5 d8flowdir -p enogeop.tif -sd8 enogeosd8.tif -fel enogeofel.tif" {
cd Geographic
mpiexec -n 5 d8flowdir -p enogeop.tif -sd8 enogeosd8.tif -fel enogeofel.tif 
}
@test "mpiexec -n 4 dinfflowdir -ang enogeoang.tif -slp enogeoslp.tif -fel enogeofel.tif" {
cd Geographic
mpiexec -n 4 dinfflowdir -ang enogeoang.tif -slp enogeoslp.tif -fel enogeofel.tif
}
@test "mpiexec -np 4 aread8 enogeo.tif" {
cd Geographic
mpiexec -np 4 aread8 enogeo.tif
}
@test "mpiexec -np 12 areadinf enogeo.tif" {
cd Geographic
mpiexec -np 12 areadinf enogeo.tif
}
@test "mpiexec -n 7 aread8 -p enogeop.tif -o Outlets.shp -ad8 enogeoad8o.tif" {
cd Geographic
mpiexec -n 7 aread8 -p enogeop.tif -o Outlets.shp -ad8 enogeoad8o.tif
}
@test "mpiexec -n 1 areadinf -ang enogeoang.tif -o Outlets.shp -sca enogeoscao.tif" {
cd Geographic
mpiexec -n 1 areadinf -ang enogeoang.tif -o Outlets.shp -sca enogeoscao.tif
}
@test "mpiexec -n 5 gridnet -p enogeop.tif -plen enogeoplen.tif -tlen enogeotlen.tif -gord enogeogord.tif" {
cd Geographic
mpiexec -n 5 gridnet -p enogeop.tif -plen enogeoplen.tif -tlen enogeotlen.tif -gord enogeogord.tif 
}
@test "mpiexec -n 5 gridnet -p enogeop.tif -plen enogeoplen1.tif -tlen enogeotlen1.tif -gord enogeogord1.tif -mask enogeoad8.tif -thresh 100" {
cd Geographic
mpiexec -n 5 gridnet -p enogeop.tif -plen enogeoplen1.tif -tlen enogeotlen1.tif -gord enogeogord1.tif -mask enogeoad8.tif -thresh 100 
}
@test "mpiexec -n 7 gridnet -p enogeop.tif -plen enogeoplen2.tif -tlen enogeotlen2.tif -gord enogeogord2.tif -o Outlets.shp" {
cd Geographic
mpiexec -n 7 gridnet -p enogeop.tif -plen enogeoplen2.tif -tlen enogeotlen2.tif -gord enogeogord2.tif -o Outlets.shp 
}

#stream network peuker douglas
@test "mpiexec -np 7 peukerdouglas -fel enogeofel.tif -ss enogeoss.tiff" {
cd Geographic
mpiexec -np 7 peukerdouglas -fel enogeofel.tif -ss enogeoss.tiff
}
@test "mpiexec -n 4 aread8 -p enogeop.tif -o Outlets.shp -ad8 enogeossa.tif -wg enogeoss.tiff" {
cd Geographic
mpiexec -n 4 aread8 -p enogeop.tif -o Outlets.shp -ad8 enogeossa.tif -wg enogeoss.tiff
}
@test "mpiexec -n 4 dropanalysis -p enogeop.tif -fel enogeofel.tif -ad8 enogeoad8.tif -ssa enogeossa.tif -drp enogeodrp.txt -o Outlets.shp -par 5 500 10 0" {
cd Geographic
mpiexec -n 4 dropanalysis -p enogeop.tif -fel enogeofel.tif -ad8 enogeoad8.tif -ssa enogeossa.tif -drp enogeodrp.txt -o Outlets.shp -par 5 500 10 0 
}
@test "mpiexec -n 5 threshold -ssa enogeossa.tif -src enogeosrc.tif -thresh 180" {
cd Geographic
mpiexec -n 5 threshold -ssa enogeossa.tif -src enogeosrc.tif -thresh 180
}
@test "mpiexec -n 5 streamnet -fel enogeofel.tif -p enogeop.tif -ad8 enogeoad8.tif -src enogeosrc.tif -ord enogeoord3.tif -tree enogeotree.dat -coord enogeocoord.dat -net enogeonet.shp -w enogeow.tif -o Outlets.shp" {
cd Geographic
mpiexec -n 5 streamnet -fel enogeofel.tif -p enogeop.tif -ad8 enogeoad8.tif -src enogeosrc.tif -ord enogeoord3.tif -tree enogeotree.dat -coord enogeocoord.dat -net enogeonet.shp -w enogeow.tif -o Outlets.shp
}

#stream network slope area
@test "mpiexec -n 3 slopearea -slp enogeoslp.tif -sca enogeosca.tif -sa enogeosa.tif -par 2 1" {
cd Geographic
mpiexec -n 3 slopearea -slp enogeoslp.tif -sca enogeosca.tif -sa enogeosa.tif -par 2 1
}
@test "mpiexec -n 8 d8flowpathextremeup -p enogeop.tif -sa enogeosa.tif -ssa enogeossa1.tif -o Outlets.shp" {
cd Geographic
mpiexec -n 8 d8flowpathextremeup -p enogeop.tif -sa enogeosa.tif -ssa enogeossa1.tif -o Outlets.shp
}
@test "mpiexec -n 4 dropanalysis -p enogeop.tif -fel enogeofel.tif -ad8 enogeoad8.tif -ssa enogeossa1.tif -drp enogeodrp1.txt -o Outlets.shp -par 10 2000 10 1" {
cd Geographic
mpiexec -n 4 dropanalysis -p enogeop.tif -fel enogeofel.tif -ad8 enogeoad8.tif -ssa enogeossa1.tif -drp enogeodrp1.txt -o Outlets.shp -par 10 2000 10 1 
}
@test "mpiexec -n 5 threshold -ssa enogeossa1.tif -src enogeosrc1.tif -thresh 32" {
cd Geographic
mpiexec -n 5 threshold -ssa enogeossa1.tif -src enogeosrc1.tif -thresh 32
}
@test "mpiexec -n 8 streamnet -fel enogeofel.tif -p enogeop.tif -ad8 enogeoad8.tif -src enogeosrc1.tif -ord enogeoord5.tif -tree enogeotree1.dat -coord enogeocoord1.dat -net enogeonet1.shp -w enogeow1.tif -o Outlets.shp -sw" {
cd Geographic
mpiexec -n 8 streamnet -fel enogeofel.tif -p enogeop.tif -ad8 enogeoad8.tif -src enogeosrc1.tif -ord enogeoord5.tif -tree enogeotree1.dat -coord enogeocoord1.dat -net enogeonet1.shp -w enogeow1.tif -o Outlets.shp -sw
}
@test "mpiexec -n 3 lengtharea -plen enogeoplen.tif -ad8 enogeoad8.tif -ss enogeolass.tif -par 0.03 1.3" {
cd Geographic
mpiexec -n 3 lengtharea -plen enogeoplen.tif -ad8 enogeoad8.tif -ss enogeolass.tif -par 0.03 1.3
}

#Specialized grid analysis
@test "mpiexec -n 3 slopearearatio -slp enogeoslp.tif -sca enogeosca.tif -sar enogeosar.tif" {
cd Geographic
mpiexec -n 3 slopearearatio -slp enogeoslp.tif -sca enogeosca.tif -sar enogeosar.tif
}
@test "mpiexec -np 7 d8hdisttostrm -p enogeop.tif -src enogeoad8.tif -dist enogeodist1.tif -thresh 200" {
cd Geographic
mpiexec -np 7 d8hdisttostrm -p enogeop.tif -src enogeoad8.tif -dist enogeodist1.tif -thresh 200 
}
@test "mpiexec -np 5 d8hdisttostrm -p enogeop.tif -src enogeosrc.tif -dist enogeodist.tif" {
cd Geographic
mpiexec -np 5 d8hdisttostrm -p enogeop.tif -src enogeosrc.tif -dist enogeodist.tif 
}

#MOVEOUTLETS
@test "mpiexec -n 5 threshold -ssa enogeoad8.tif -src enogeosrc2.tif -thresh 200" {
cd Geographic
mpiexec -n 5 threshold -ssa enogeoad8.tif -src enogeosrc2.tif -thresh 200
}
@test "mpiexec -np 3 moveoutletstostrm -p enogeop.tif -src enogeosrc.tif -o Outlets.shp -om Outletsmoved.shp -md 20" {
cd Geographic
mpiexec -np 3 moveoutletstostrm -p enogeop.tif -src enogeosrc.tif -o Outlets.shp -om Outletsmoved.shp -md 20 
}

#DISTDOWN
@test "mpiexec -n 1 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddhave.tif" {
cd Geographic
mpiexec -n 1 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddhave.tif
}
@test "mpiexec -n 2 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddhmin.tif -m min h" {
cd Geographic
mpiexec -n 2 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddhmin.tif -m min h
}
@test "mpiexec -n 3 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddhmax.tif -m max h" {
cd Geographic
mpiexec -n 3 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddhmax.tif -m max h
}
@test "mpiexec -n 4 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddvave.tif -m ave v" {
cd Geographic
mpiexec -n 4 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddvave.tif -m ave v
}
@test "mpiexec -n 5 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddvmin.tif -m min v" {
cd Geographic
mpiexec -n 5 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddvmin.tif -m min v
}
@test "mpiexec -n 6 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddvmax.tif -m max v" {
cd Geographic
mpiexec -n 6 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddvmax.tif -m max v
}
@test "mpiexec -n 7 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddsave.tif -m ave s" {
cd Geographic
mpiexec -n 7 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddsave.tif -m ave s
}
@test "mpiexec -n 8 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddsmin.tif -m min s" {
cd Geographic
mpiexec -n 8 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddsmin.tif -m min s
}
@test "mpiexec -n 1 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddsmax.tif -m max s" {
cd Geographic
mpiexec -n 1 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddsmax.tif -m max s
}
@test "mpiexec -n 2 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddpave.tif -m ave p" {
cd Geographic
mpiexec -n 2 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddpave.tif -m ave p
}
@test "mpiexec -n 3 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddpmin.tif -m min p" {
cd Geographic
mpiexec -n 3 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddpmin.tif -m min p
}
@test "mpiexec -n 4 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddpmax.tif -m max p" {
cd Geographic
mpiexec -n 4 dinfdistdown -ang enogeoang.tif -fel enogeofel.tif -src enogeosrc.tif -dd enogeoddpmax.tif -m max p
}

#DISTANCE UP
@test "mpiexec -n 1 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeoduhave.tif" {
cd Geographic
mpiexec -n 1 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeoduhave.tif
}
@test "mpiexec -n 2 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeoduhmin.tif -m min h -thresh 0.5" {
cd Geographic
mpiexec -n 2 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeoduhmin.tif -m min h -thresh 0.5
}
@test "mpiexec -n 6 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeoduvmax.tif -m max v" {
cd Geographic
mpiexec -n 6 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeoduvmax.tif -m max v
}
@test "mpiexec -n 7 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodusave.tif -m ave s -thresh 0.9" {
cd Geographic
mpiexec -n 7 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodusave.tif -m ave s -thresh 0.9
}
@test "mpiexec -n 8 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodusmin.tif -m min s" {
cd Geographic
mpiexec -n 8 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodusmin.tif -m min s
}
@test "mpiexec -n 1 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodusmax.tif -m max s" {
cd Geographic
mpiexec -n 1 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodusmax.tif -m max s
}
@test "mpiexec -n 2 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodupave.tif -m ave p" {
cd Geographic
mpiexec -n 2 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodupave.tif -m ave p
}
@test "mpiexec -n 3 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodupmin.tif -m min p" {
cd Geographic
mpiexec -n 3 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodupmin.tif -m min p
}
@test "mpiexec -n 4 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodupmax.tif -m max p" {
cd Geographic
mpiexec -n 4 dinfdistup -ang enogeoang.tif -fel enogeofel.tif -du enogeodupmax.tif -m max p
}

#SLOPEAVEDOWN
@test "mpiexec -n 3 slopeavedown -p enogeop.tif -fel enogeofel.tif -slpd enogeoslpd.tif" {
cd Geographic
mpiexec -n 3 slopeavedown -p enogeop.tif -fel enogeofel.tif -slpd enogeoslpd.tif
}

#gagewatershed test
@test "mpiexec -n 7 gagewatershed -p enogeop.tif -o Outletsmoved.shp -gw enogeogw.tif -id gwid.txt" {
cd Geographic
mpiexec -n 7 gagewatershed -p enogeop.tif -o Outletsmoved.shp -gw enogeogw.tif -id gwid.txt
}


####################################################################
####################################################################

# Testing different file extensions
@test "mpiexec -np 3 pitremove logan.tif" {
cd gridtypes
mpiexec -np 3 pitremove logan.tif
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfelim.img" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfelim.img
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfelsd.sdat" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfelsd.sdat
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfel.bil" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfel.bil
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfel1.bin" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfel1.bin
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfel.bil" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfel.bil
}
@test "mpiexec -np 3 d8flowdir -fel loganfel1.bin -p bilp.bil -sd8 binsd8.bin" {
cd gridtypes
mpiexec -np 3 d8flowdir -fel loganfel1.bin -p bilp.bil -sd8 binsd8.bin
}
@test "mpiexec -n 5 aread8 -p bilp.bil -ad8 loganad8.img" {
cd gridtypes
mpiexec -n 5 aread8 -p bilp.bil -ad8 loganad8.img
}
@test "mpiexec -n 2 dinfflowdir -fel loganfel.bil -ang ang.ang -slp slp.slp" {
cd gridtypes
mpiexec -n 2 dinfflowdir -fel loganfel.bil -ang ang.ang -slp slp.slp
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfel2.lg" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfel2.lg
}
@test "mpiexec -np 3 pitremove -z logan.tif -fel loganfel3" {
cd gridtypes
mpiexec -np 3 pitremove -z logan.tif -fel loganfel3
}

##Testing SinmapSI
#@test "mpiexec -n 1 sinmapsi -slp dmslp.tif -sca dmsca.tif -calpar dmcalp.txt -cal dmcal.tif -si dmsi.tif -sat dmsat.tif -par 0.0009 0.00135 9.81 1000" {
#cd sinmapsi
#mpiexec -n 1 sinmapsi -slp dmslp.tif -sca dmsca.tif -calpar dmcalp.txt -cal dmcal.tif -si dmsi.tif -sat dmsat.tif -par 0.0009 0.00135 9.81 1000
#}
#
##Testing with Sinmap manual example
#@test "mpiexec -n 4 pitremove dem" {
#cd sinmapsi
#mpiexec -n 4 pitremove dem
#}
#@test "mpiexec -n 4 dinfflowdir -fel demfel.tif -slp demslp.tif -ang demang.tif" {
#cd sinmapsi
#mpiexec -n 4 dinfflowdir -fel demfel.tif -slp demslp.tif -ang demang.tif
#}
#@test "mpiexec -n 2 areadinf -ang demang.tif -sca demsca.tif" {
#cd sinmapsi
#mpiexec -n 2 areadinf -ang demang.tif -sca demsca.tif
#}
#@test "mpiexec -n 3 sinmapsi -slp demslp.tif -sca demsca.tif -cal demreg12.tif -calpar dempar12.csv -si demsi1.tif -sat demsat1.tif -par 0.0009 0.00135 9.81 1000" {
#cd sinmapsi
#mpiexec -n 3 sinmapsi -slp demslp.tif -sca demsca.tif -cal demreg12.tif -calpar dempar12.csv -si demsi1.tif -sat demsat1.tif -par 0.0009 0.00135 9.81 1000
#}
#@test "mpiexec -n 3 sinmapsi -slp demslp.tif -sca demsca.tif -cal demregsh.tif -calpar demparsh.dat -si demsi2.tif -sat demsat2.tif -par 0.0009 0.00135 9.81 1000" {
#cd sinmapsi
#mpiexec -n 3 sinmapsi -slp demslp.tif -sca demsca.tif -cal demregsh.tif -calpar demparsh.dat -si demsi2.tif -sat demsat2.tif -par 0.0009 0.00135 9.81 1000
#}

#Testing of OGR starts here 
@test "mpiexec -n 7 aread8 -p loganp.tif -o LoganOutlet.shp -ad8 loganad8_1.tif" {
cd AreaD8_data
mpiexec -n 7 aread8 -p loganp.tif -o LoganOutlet.shp -ad8 loganad8_1.tif
}
@test "mpiexec -n 3 aread8 -p loganp.tif -o LoganSample.sqlite -lyrname LoganOutlet -ad8 loganad8_3.tif" {
cd AreaD8_data
mpiexec -n 3 aread8 -p loganp.tif -o LoganSample.sqlite -lyrname LoganOutlet -ad8 loganad8_3.tif
}
@test "mpiexec -n 4 aread8 -p loganp.tif -o LoganOutlet.json -ad8 loganad8_4.tif" {
cd AreaD8_data
mpiexec -n 4 aread8 -p loganp.tif -o LoganOutlet.json -ad8 loganad8_4.tif
}
@test "mpiexec -n 6 aread8 -p loganp.tif -o LoganOutlet.json -lyrname OGRGeoJson -ad8 loganad8_5.tif" {
cd AreaD8_data
mpiexec -n 6 aread8 -p loganp.tif -o LoganOutlet.json -lyrname OGRGeoJson -ad8 loganad8_5.tif
}
@test "mpiexec -n 7 aread8 -p loganp.tif -o Logan.gdb -ad8 loganad8_6.tif" {
cd AreaD8_data
mpiexec -n 7 aread8 -p loganp.tif -o Logan.gdb -ad8 loganad8_6.tif
}
@test "mpiexec -n 5 aread8 -p loganp.tif -o Logan.gdb -lyrname Outlet -ad8 loganad8_7.tif" {
cd AreaD8_data
mpiexec -n 5 aread8 -p loganp.tif -o Logan.gdb -lyrname Outlet -ad8 loganad8_7.tif
}
@test "mpiexec -n 2 aread8 -p loganp.tif -o Logan.gdb -lyrno 0 -ad8 loganad8_8.tif" {
cd AreaD8_data
mpiexec -n 2 aread8 -p loganp.tif -o Logan.gdb -lyrno 0 -ad8 loganad8_8.tif
}

 
@test "mpiexec -n 7 areadinf -ang loganang.tif -o LoganOutlet.shp -sca logansca_1.tif" {
cd AreaDinf
mpiexec -n 7 areadinf -ang loganang.tif -o LoganOutlet.shp -sca logansca_1.tif
}
@test "mpiexec -n 1 areadinf -ang loganang.tif -o LoganSample.sqlite -lyrno 1 -sca logansca_2.tif" {
cd AreaDinf
mpiexec -n 1 areadinf -ang loganang.tif -o LoganSample.sqlite -lyrno 1 -sca logansca_2.tif
}
@test "mpiexec -n 3 areadinf -ang loganang.tif -o LoganSample.sqlite -lyrname LoganOutlet -sca logansca_3.tif" {
cd AreaDinf
mpiexec -n 3 areadinf -ang loganang.tif -o LoganSample.sqlite -lyrname LoganOutlet -sca logansca_3.tif
}
@test "mpiexec -n 5 areadinf -ang loganang.tif -o LoganSample.sqlite -lyrno 1 -sca logansca_4.tif" {
cd AreaDinf
piexec -n 5 areadinf -ang loganang.tif -o LoganSample.sqlite -lyrno 1 -sca logansca_4.tif
}
@test "mpiexec -n 3 areadinf -ang loganang.tif -o LoganOutlet.json -sca logansca_5.tif" {
cd AreaDinf
mpiexec -n 3 areadinf -ang loganang.tif -o LoganOutlet.json -sca logansca_5.tif
}
@test "mpiexec -n 5 areadinf -ang loganang.tif -o LoganOutlet.json -lyrname OGRGeoJson -sca logansca_6.tif" {
cd AreaDinf
mpiexec -n 5 areadinf -ang loganang.tif -o LoganOutlet.json -lyrname OGRGeoJson -sca logansca_6.tif
}
@test "mpiexec -n 5 areadinf -ang loganang.tif -o Logan.gdb -sca logansca_7.tif" {
cd AreaDinf
mpiexec -n 5 areadinf -ang loganang.tif -o Logan.gdb -sca logansca_7.tif
}
@test "mpiexec -n 3 areadinf -ang loganang.tif -o Logan.gdb -lyrname Outlet -sca logansca_8.tif" {
cd AreaDinf
mpiexec -n 3 areadinf -ang loganang.tif -o Logan.gdb -lyrname Outlet -sca logansca_8.tif
}
@test "mpiexec -n 6 areadinf -ang loganang.tif -o Logan.gdb -lyrno 0 -sca logansca_9.tif" {
cd AreaDinf
mpiexec -n 6 areadinf -ang loganang.tif -o Logan.gdb -lyrno 0 -sca logansca_9.tif
}
@test "mpiexec -n 7 gridnet -p loganp.tif -plen loganplen1.tif -tlen logantlen1.tif -gord logangord1.tif -o LoganOutlet.shp" {
cd Gridnet
mpiexec -n 7 gridnet -p loganp.tif -plen loganplen1.tif -tlen logantlen1.tif -gord logangord1.tif -o LoganOutlet.shp 
}
@test "mpiexec -n 6 gridnet -p loganp.tif -plen loganplen3.tif -tlen logantlen3.tif -gord logangord3.tif -o LoganSample.sqlite -lyrname LoganOutlet" {
cd Gridnet
mpiexec -n 6 gridnet -p loganp.tif -plen loganplen3.tif -tlen logantlen3.tif -gord logangord3.tif -o LoganSample.sqlite -lyrname LoganOutlet
}
@test "mpiexec -n 3 gridnet -p loganp.tif -plen loganplen4.tif -tlen logantlen4.tif -gord logangord4.tif -o LoganSample.sqlite -lyrno 1" {
cd Gridnet
mpiexec -n 3 gridnet -p loganp.tif -plen loganplen4.tif -tlen logantlen4.tif -gord logangord4.tif -o LoganSample.sqlite -lyrno 1
}
@test "mpiexec -n 3 gridnet -p loganp.tif -plen loganplen5.tif -tlen logantlen5.tif -gord logangord5.tif -o LoganOutlet.json" {
cd Gridnet
mpiexec -n 3 gridnet -p loganp.tif -plen loganplen5.tif -tlen logantlen5.tif -gord logangord5.tif -o LoganOutlet.json
}
@test "mpiexec -n 7 gridnet -p loganp.tif -plen loganplen6.tif -tlen logantlen6.tif -gord logangord6.tif -o LoganOutlet.json -lyrname OGRGeoJson" {
cd Gridnet
mpiexec -n 7 gridnet -p loganp.tif -plen loganplen6.tif -tlen logantlen6.tif -gord logangord6.tif -o LoganOutlet.json -lyrname OGRGeoJson 
}
@test "mpiexec -n 1 gridnet -p loganp.tif -plen loganplen7.tif -tlen logantlen7.tif -gord logangord7.tif -o Logan.gdb" {
cd Gridnet
mpiexec -n 1 gridnet -p loganp.tif -plen loganplen7.tif -tlen logantlen7.tif -gord logangord7.tif -o Logan.gdb
}
@test "mpiexec -n 3 gridnet -p loganp.tif -plen loganplen8.tif -tlen logantlen8.tif -gord logangord8.tif -o Logan.gdb -lyrname Outlet" {
cd Gridnet
mpiexec -n 3 gridnet -p loganp.tif -plen loganplen8.tif -tlen logantlen8.tif -gord logangord8.tif -o Logan.gdb -lyrname Outlet
}
@test "mpiexec -n 2 gridnet -p loganp.tif -plen loganplen9.tif -tlen logantlen9.tif -gord logangord9.tif -o Logan.gdb -lyrno 0" {
cd Gridnet
mpiexec -n 2 gridnet -p loganp.tif -plen loganplen9.tif -tlen logantlen9.tif -gord logangord9.tif -o Logan.gdb -lyrno 0
}

#stream network peuker douglas
@test "mpiexec -n 1 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp1.txt -o LoganOutlet.shp -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 1 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp1.txt -o LoganOutlet.shp -par 5 500 10 0 
}
@test "mpiexec -n 5 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp3.txt -o LoganSample.sqlite -lyrname LoganOutlet -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 5 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp3.txt -o LoganSample.sqlite -lyrname LoganOutlet -par 5 500 10 0 
}
@test "mpiexec -n 2 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp4.txt -o LoganSample.sqlite -lyrno 1 -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 2 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp4.txt -o LoganSample.sqlite -lyrno 1 -par 5 500 10 0 
}
@test "mpiexec -n 5 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp5.txt -o LoganOutlet.json -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 5 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp5.txt -o LoganOutlet.json -par 5 500 10 0 
}
@test "mpiexec -n 4 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp6.txt -o LoganOutlet.json -lyrname OGRGeoJson  -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 4 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp6.txt -o LoganOutlet.json -lyrname OGRGeoJson  -par 5 500 10 0 
}
@test "mpiexec -n 3 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp7.txt -o Logan.gdb -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 3 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp7.txt -o Logan.gdb -par 5 500 10 0 
}
@test "mpiexec -n 5 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp8.txt -o Logan.gdb -lyrname Outlet -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 5 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp8.txt -o Logan.gdb -lyrname Outlet -par 5 500 10 0 
}
@test "mpiexec -n 6 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp9.txt -o Logan.gdb -lyrno 0 -par 5 500 10 0" {
cd peukerDouglas
mpiexec -n 6 dropanalysis -p loganp.tif -fel loganfel.tif -ad8 loganad8.tif -ssa loganssa.tif -drp logandrp9.txt -o Logan.gdb -lyrno 0 -par 5 500 10 0 
}
@test "mpiexec -n 5 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet1.shp -w loganw.tif -o LoganOutlet.shp" {
cd streamnet_data
mpiexec -n 5 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet1.shp -w loganw.tif -o LoganOutlet.shp
}
@test "mpiexec -n 3 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net LoganSample.sqlite -netlyr Mynetwork.shp -w loganw.tif -o LoganSample.sqlite -lyrname LoganOutlet" {
cd streamnet_data
mpiexec -n 3 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net LoganSample.sqlite -netlyr Mynetwork.shp -w loganw.tif -o LoganSample.sqlite -lyrname LoganOutlet
}
@test "mpiexec -n 7 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet3.kml -netlyr logannet3 -w loganw.tif -o Logan.gdb -lyrname Outlet" {
cd streamnet_data
mpiexec -n 7 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet3.kml -netlyr logannet3 -w loganw.tif -o Logan.gdb -lyrname Outlet
}
@test "mpiexec -n 7 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet3.json -netlyr logannet3 -w loganw.tif -o Logan.gdb -lyrno 0" {
cd streamnet_data
mpiexec -n 7 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet3.json -netlyr logannet3 -w loganw.tif -o Logan.gdb -lyrno 0
}
@test "mpiexec -n 5 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet4.json -netlyr logannet4 -w loganw.tif -o LoganOutlet.json -lyrno 0" {
cd streamnet_data
mpiexec -n 5 streamnet -fel loganfel.tif -p loganp.tif -ad8 loganad8.tif -src logansrc.tif -ord loganord3.tif -tree logantree.dat -coord logancoord.dat -net logannet4.json -netlyr logannet4 -w loganw.tif -o LoganOutlet.json -lyrno 0
}

#stream network slope area
@test "mpiexec -n 3 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa1.tif -o LoganOutlet.shp" {
cd D8flowextreme
mpiexec -n 3 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa1.tif -o LoganOutlet.shp
}
@test "mpiexec -n 5 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa2.tif -o LoganSample.sqlite -lyrname LoganOutlet" {
cd D8flowextreme
mpiexec -n 5 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa2.tif -o LoganSample.sqlite -lyrname LoganOutlet
}
@test "mpiexec -n 7 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa3.tif -o LoganSample.sqlite -lyrno 1" {
cd D8flowextreme
mpiexec -n 7 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa3.tif -o LoganSample.sqlite -lyrno 1
}
@test "mpiexec -n 1 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa4.tif -o Logan.gdb" {
cd D8flowextreme
mpiexec -n 1 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa4.tif -o Logan.gdb 
}
@test "mpiexec -n 8 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa5.tif -o Logan.gdb -lyrno 0" {
cd D8flowextreme
mpiexec -n 8 d8flowpathextremeup -p loganp.tif -sa logansa.tif -ssa loganssa5.tif -o Logan.gdb -lyrno 0
}

#downslope influence
@test "mpiexec -n 1 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto1.img -q logansca.tif -o LoganOutlet.shp -csol 2.4" {
cd DinfConcLimAccum
mpiexec -n 1 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto1.img -q logansca.tif -o LoganOutlet.shp -csol 2.4
}
@test "mpiexec -n 5 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto2.tif -q logansca.tif -o LoganSample.sqlite -lyrname LoganOutlet -csol 2.4" {
cd DinfConcLimAccum
mpiexec -n 5 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto2.tif -q logansca.tif -o LoganSample.sqlite -lyrname LoganOutlet -csol 2.4
}
@test "mpiexec -n 7 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto4.tif -q logansca.tif -o Logan.gdb -csol 2.4" {
cd DinfConcLimAccum
mpiexec -n 7 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto4.tif -q logansca.tif -o Logan.gdb -csol 2.4
}
@test "mpiexec -n 8 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto5.tif -q logansca.tif -o Logan.gdb -lyrno 0 -csol 2.4" {
cd DinfConcLimAccum
mpiexec -n 8 dinfconclimaccum -ang loganang.tif -dm logandm08.tif -dg logandg.tif -ctpt loganctpto5.tif -q logansca.tif -o Logan.gdb -lyrno 0 -csol 2.4
}
#Trans lim accum
@test "mpiexec -n 2 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla1.img -tdep logantdep1.tif -o LoganOutlet.shp -cs logandg.tif -ctpt loganctpt1.tif" {
cd DinfTransLimAcc
mpiexec -n 2 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla1.img -tdep logantdep1.tif -o LoganOutlet.shp -cs logandg.tif -ctpt loganctpt1.tif 
}
@test "mpiexec -n 6 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla2.tif -tdep logantdep2.tif -o LoganSample.sqlite -lyrname LoganOutlet  -cs logandg.tif -ctpt loganctpt2.tif" {
cd DinfTransLimAcc
mpiexec -n 6 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla2.tif -tdep logantdep2.tif -o LoganSample.sqlite -lyrname LoganOutlet  -cs logandg.tif -ctpt loganctpt2.tif 
}
@test "mpiexec -n 5 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla4.tif -tdep logantdep4.tif -o Logan.gdb  -cs logandg.tif -ctpt loganctpt4.tif" {
cd DinfTransLimAcc
mpiexec -n 5 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla4.tif -tdep logantdep4.tif -o Logan.gdb  -cs logandg.tif -ctpt loganctpt4.tif 
}
##@test "mpiexec -n 7 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla5.tif -tdep logantdep5.tif -o LoganOutlet.json -cs logandg.tif -ctpt loganctpt5.tif" {
##cd DinfTransLimAcc
##mpiexec -n 7 dinftranslimaccum -ang loganang.tif -tsup logantsup.tif -tc logantc.tif -tla logantla5.tif -tdep logantdep5.tif -o Loganoutlet.json -cs logandg.tif -ctpt loganctpt5.tif 
##}

#MOVEOUTLETS
@test "mpiexec -np 1 moveoutletstostrm -p loganp.tif -src logansrc.tif -o OutletstoMove.shp -om Outletsmoved.shp -md 20" {
cd MovedOutletstoStream_data
mpiexec -np 1 moveoutletstostrm -p loganp.tif -src logansrc.tif -o OutletstoMove.shp -om Outletsmoved.shp -md 20 
}
@test "mpiexec -np 3 moveoutletstostrm -p loganp.tif -src logansrc.tif -o OutletstoMove.json -om Outletsmoved.kml -md 20" {
cd MovedOutletstoStream_data
mpiexec -np 3 moveoutletstostrm -p loganp.tif -src logansrc.tif -o OutletstoMove.json -om Outletsmoved.kml -md 20 
}
@test "mpiexec -np 4 moveoutletstostrm -p loganp.tif -src logansrc.tif -o LoganSample.sqlite -lyrno 2 -om Outletsmoved5.kml -md 20" {
cd MovedOutletstoStream_data
mpiexec -np 4 moveoutletstostrm -p loganp.tif -src logansrc.tif -o LoganSample.sqlite -lyrno 2 -om Outletsmoved5.kml -md 20 
}
@test "mpiexec -np 7 moveoutletstostrm -p loganp.tif -src logansrc.tif -o Logan.gdb -lyrno 0 -om Outletsmove.json -md 20" {
cd MovedOutletstoStream_data
mpiexec -np 7 moveoutletstostrm -p loganp.tif -src logansrc.tif -o Logan.gdb -lyrno 0 -om Outletsmove.json -md 20 
}

#gagewatershed test
@test "mpiexec -n 1 gagewatershed -p loganp.tif -o LoganOutlet.shp -gw logangw1.tif -id gwid1.txt" {
cd GageWatershed
mpiexec -n 1 gagewatershed -p loganp.tif -o LoganOutlet.shp -gw logangw1.tif -id gwid1.txt
}
@test "mpiexec -n 3 gagewatershed -p loganp.tif -o Logan.gdb -gw logangw3.tif -id gwid3.txt" {
cd GageWatershed
mpiexec -n 3 gagewatershed -p loganp.tif -o Logan.gdb -gw logangw3.tif -id gwid3.txt
}
@test "mpiexec -n 5 gagewatershed -p loganp.tif -o Logan.gdb -lyrno 0 -gw logangw3.tif -id gwid3.txt" {
cd GageWatershed
mpiexec -n 5 gagewatershed -p loganp.tif -o Logan.gdb -lyrno 0 -gw logangw3.tif -id gwid3.txt
}
@test "mpiexec -n 7 gagewatershed -p loganp.tif -o loganoutlet.json -gw logangw4.tif -id gwid4.txt" {
cd GageWatershed
mpiexec -n 7 gagewatershed -p loganp.tif -o LoganOutlet.json -gw logangw4.tif -id gwid4.txt
}


##Connect down
#@test "mpiexec -n 1 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets1.shp -od loganOutlets_Moved1.shp -d 1" {
#cd ConnectDown
#mpiexec -n 1 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets1.shp -od loganOutlets_Moved1.shp -d 1
#}
#@test "mpiexec -n 3 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets2.shp -olyr loganOutlets2  -od loganOutlets_Moved2.shp -odlyr loganOutlets2 -d 1" {
#cd ConnectDown
#mpiexec -n 3 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets2.shp -olyr loganOutlets2  -od loganOutlets_Moved2.shp -odlyr loganOutlets2 -d 1
#}
#@test "mpiexec -n 5 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganSample.sqlite -olyr myoutlet1  -od loganSample.sqlite -odlyr myoutlet2 -d 1" {
#cd ConnectDown
#mpiexec -n 5 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganSample.sqlite -olyr myoutlet1  -od loganSample.sqlite -odlyr myoutlet2 -d 1
#}
#@test "mpiexec -n 7 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets2.kml -od loganOutlets_Moved2.kml -d 1" {
#cd ConnectDown
#mpiexec -n 7 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets2.kml -od loganOutlets_Moved2.kml -d 1
#}
#@test "mpiexec -n 1 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets3.kml -olyr loganOutlets3 -od loganOutlets_Moved3.kml -odlyr loganOutlets_Moved3 -d 1" {
#cd ConnectDown
#mpiexec -n 1 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets3.kml -olyr loganOutlets3 -od loganOutlets_Moved3.kml -odlyr loganOutlets_Moved3 -d 1
#}
#@test "mpiexec -n 3 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets4.json -od loganOutlets_Moved2.json -d 1" {
#cd ConnectDown
#mpiexec -n 3 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets4.json -od loganOutlets_Moved2.json -d 1
#}
#@test "mpiexec -n 8 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets3.kml -olyr loganOutlets3 -od loganOutlets_Moved3.kml -odlyr loganOutlets_Moved3 -d 1" {
#cd ConnectDown
#mpiexec -n 8 connectdown -p loganp.tif -ad8 loganad8.tif -w logangw.tif -o loganOutlets3.kml -olyr loganOutlets3 -od loganOutlets_Moved3.kml -odlyr loganOutlets_Moved3 -d 1
#}

#Test EPSG functionality
@test "mpiexec -n 2 aread8 -p ma2_ep.tif -ad8 ma2_ead8.tif -o outlet.shp -nc" {
cd NoEPSG
mpiexec -n 2 aread8 -p ma2_ep.tif -ad8 ma2_ead8.tif -o outlet.shp -nc
}
@test "mpiexec  -np  8  moveoutletstostrm  -p  subwatershed_74p.tif  -src  subwatershed_74src1.tif  -o  mypoint.shp  -om  New_Outlet.shp  -md  10000.0" {
cd MoveOutlets2
mpiexec  -np  8  moveoutletstostrm  -p  subwatershed_74p.tif  -src  subwatershed_74src1.tif  -o  mypoint.shp  -om  New_Outlet.shp  -md  10000.0 
}
@test "mpiexec -np 1 moveoutletstostrm  -p  subwatershed_74p.tif  -src  subwatershed_74src1.tif  -o  testpoints.shp  -om  New_Outlet1.shp  -md  10000" {
cd MoveOutlets2
mpiexec -np 1 moveoutletstostrm  -p  subwatershed_74p.tif  -src  subwatershed_74src1.tif  -o  testpoints.shp  -om  New_Outlet1.shp  -md  10000 
}

@test "mpiexec -np 8 moveoutletstostrm  -p  subwatershed_74p.tif  -src  subwatershed_74src1.tif  -o  testpoints.shp  -om  New_Outlet2.shp  -md  100" {
cd MoveOutlets2
mpiexec -np 8 moveoutletstostrm  -p  subwatershed_74p.tif  -src  subwatershed_74src1.tif  -o  testpoints.shp  -om  New_Outlet2.shp  -md  100 
}
@test "mpiexec -n 4 gagewatershed -p fdr.tif -gw gw.tif -id id.txt -o CatchOutlets3.shp" {
cd gwunittest
mpiexec -n 4 gagewatershed -p fdr.tif -gw gw.tif -id id.txt -o CatchOutlets3.shp
}
# editraster doesn't appear to exist
#@test "mpiexec -n 2 editraster -in fdro.tif -out fdrmod.tif -changes changes.txt" {
#cd Editraster
#mpiexec -n 2 editraster -in fdro.tif -out fdrmod.tif -changes changes.txt
#}
# catchoutlets doesn't appear to exist
# Run catchoutlets single processor, no parallel version yet
#@test "mpiexec -n 1 catchoutlets -net net1.shp -p fdr.tif -o CatchOutlets.shp -mindist 20000 -minarea 50000000 -gwstartno 5" {
#cd CatchOutlets
#mpiexec -n 1 catchoutlets -net net1.shp -p fdr.tif -o CatchOutlets.shp -mindist 20000 -minarea 50000000 -gwstartno 5
#}

##flowdircond doesnt appear to exist
##Run flow direction conditioning
#@test "mpiexec -n 4 flowdircond -z wcdem.tif -p pm.tif -zfdc wcdemzfdc.tif" {
#cd FlowdirCond
#mpiexec -n 4 flowdircond -z wcdem.tif -p pm.tif -zfdc wcdemzfdc.tif
#}

##retlimflow doesnt appear to exist
##Run Retention Limited Flow Accumulation
#@test "mpiexec -n 6 retlimflow -ang spawnang.tif -wg spawnwg.tif -rc spawnrc.tif -qrl spawnqrl.tif" {
#cd RetLimFlow
#mpiexec -n 6 retlimflow -ang spawnang.tif -wg spawnwg.tif -rc spawnrc.tif -qrl spawnqrl.tif
#}

#Run CatchHydroGeo
@test "mpiexec -n 4 catchhydrogeo -hand onion3dd.tif -catch onion3w.tif -catchlist catchlist.txt -slp onion3slp.tif -h stage.txt -table hydropropotable.txt" {
cd CatchHydroGeoTest
mpiexec -n 4 catchhydrogeo -hand Onion3dd.tif -catch Onion3w.tif -catchlist catchlist.txt -slp Onion3slp.tif -h stage.txt -table hydropropotable.txt
}
