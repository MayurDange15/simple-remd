#!/bin/bash

export GMX_MAXBACKUP=-1

low=298
second=308
nreplicas=4

i=0
for temp in $(~/scripts/make-exponential-temperatures.pl -b $low -s $second -n $nreplicas)
do
    cd sim$i
    sed -i -e "s/^\(ref-t\|gen-temp\).*/\\1 = $temp/" sim.mdp
    grompp -f sim -c ../equil$i/confout -t ../equil$i/state.cpt
    cd ..
    ((i++))
done

mpirun -np 4 mdrun_mpi -multidir sim[0123] -replex 500 -nsteps 1000 -v

for i in 0 1 2 3
do
    cd sim$i
    echo Pot | g_energy -f ener -xvg none
    cd ..
done

cp sim0/energy.xvg combined-pot.xvg

for i in 1 2 3
do
    cut -c 14-60 sim$i/energy.xvg > sim$i/pot.xvg
    paste combined-pot.xvg sim$i/pot.xvg > new.xvg
    mv new.xvg combined-pot.xvg
done

g_analyze -f combined-pot -dist -w -bw 30

