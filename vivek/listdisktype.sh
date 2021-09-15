#!/bin/bash

printf '%s\n' vm_name disk_name disk_type | paste -sd ',' > file.csv
read_vm(){
 #az disk show --ids "" --query '[].[sku]
 for a in ${1}
 do

#vm_name
vm_name=$(az disk show --ids "${a}" --query 'managedBy')
#disk type
disk_type=$(az disk show --ids "${a}" --query 'sku.name')
printf '%s\n' ${vm_name##*/} ${a##*/} ${disk_type} | paste -sd ',' >> file.csv
 done
 #return 1
}

for a in $(az account list -o tsv --query '[].[id]')
do
   az account set --subscription ${a}
   for line in $(az vm list --query "[].[id]" -o tsv)
    do
       #rasx=$(az vm show --ids ${line} --query "storageProfile.dataDisks[].managedDisk.id")
       echo "====================="
       read_vm "$(az vm show --ids ${line} --query "storageProfile.dataDisks[].managedDisk.id" -o tsv)"
    done

done
