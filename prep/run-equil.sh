#!/bin/bash

export GMX_MAXBACKUP=-1

low=298
second=308
nreplicas=4

i=0
for temp in $(~/scripts/make-exponential-temperatures.pl -b $low -s $second -n $nreplicas)
do
    cd equil$i
    sed -i -e "s/^\(ref-t\|gen-temp\).*/\\1 = $temp/" equil.mdp
    grompp -f equil -c confout
    cd ..
    ((i++))
done

mpirun -np 4 mdrun_mpi -multidir equil[0123]
