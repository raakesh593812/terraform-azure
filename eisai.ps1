Set-TimeZone -Id "Tokyo Standard Time" -PassThru
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate" -Name "start" -Type "DWord" -Value 3 -Force
Set-WinHomeLocation -GeoId 122 
