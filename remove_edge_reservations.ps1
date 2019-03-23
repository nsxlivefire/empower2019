Connect-VIServer vcsa-01a.corp.local -User Administrator@vsphere.local -Password VMware1! | out-null
$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.memoryReservationLockedToMax = $false

(Get-VM -name Edge* ).ExtensionData.ReconfigVM_Task($spec)
get-vm -Name Edge* | Get-VMResourceConfiguration | Set-VMResourceConfiguration -MemReservationGB 0

