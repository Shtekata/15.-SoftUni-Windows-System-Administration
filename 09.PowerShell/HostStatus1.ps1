function Get-HostStatus{
<#
.synopsis
Simple host pinging utility
.description
This function accepts three parameters $subnet, $start, $end
.example
Get-HostStatus -subnet '192.168.99.' -start 1 -end 100
.notes
First source the HostStarus.ps1 file. Keep in mind that if the function is executed without parameters there are some default values.
.link
https://google.com
#>
[cmdletbinding()]
param([string]$subnet='192.168.99.',[int]$start=1,[int]$end=5)
write-verbose "Pinging $subnet from $start to $end"
$start..$end|where{test-connection $subnet$_ -count 1 -quiet}|foreach{"$subnet$_"}
}