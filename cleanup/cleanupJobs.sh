#!/usr/bin/bash
rm -rf out
kubectl get jobs >>out
while read line
do
   echo $line
   vars=(${line})
   if [ ${vars[2]} -eq ${vars[1]} ]
    then
     kubectl delete job ${vars[0]}
     pwd
   fi
done < out
