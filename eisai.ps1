write-host "starting the script" | out-file c:\out.txt -Append
Set-TimeZone -Id "Tokyo Standard Time" -PassThru -Verbose | out-file c:\out.txt -Append
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate" -Name "start" -Type "DWord" -Value 3 -Force -Verbose | out-file c:\out.txt -Append
Set-WinHomeLocation -GeoId 122 -Verbose | out-file c:\out.txt -Append


$NLAinfo = Get-CimInstance  -ClassName Win32_TSGeneralSetting -Namespace root\cimv2\terminalservices -Filter "TerminalName='RDP-tcp'"
$NLAinfo | Invoke-CimMethod -MethodName SetUserAuthenticationRequired -Arguments @{ UserAuthenticationRequired = $false } -Verbose | out-file c:\out.txt -Append





#Change CD drive letter
$drv = Get-WmiObject win32_volume -filter 'DriveLetter = "E:"'
$drv.DriveLetter = "w:"
$drv.Put() | out-null

Get-Disk -Number 2 | New-Partition -UseMaximumSize -DriveLetter E | Format-Volume -FileSystem NTFS -NewFileSystemLabel "Data1" -AllocationUnitSize 4096 -Full | out-null 
write-host " ===================completed" | out-file c:\out.txt -Append
