function Get-HostStatus {
    <#
.synopsis
Simple host pinging utility
.description
This function accepts three parameters $subnet, $start, $end
.example
Get-HostStatus -subnet '192.168.50.' -start 1 -end 250
.notes
First source the HostStarus.ps1 file. Keep in mind that if the function is executed without parameters there are some default values.
.link
https://google.com
#>
    [cmdletbinding()]
    param([string]$subnet = '192.168.50.', [int]$start = $null, [int]$end = $null)
    write-verbose "Pinging $subnet from $start to $end"
    $range = '1,Server LAN', '2,Bridge LAN',
    '10,Shtekata Pers PC', '11,Shtekata Work PC', '12,Bobi Pers PC', '13,Zvezd Pers PC', '15,Access Point',
    '50,Shtekata Phone', '51,Bobi Phone', '52,Zvezd Phone', '53,Shtekata Phone 5G', '54,Bobi Phone 5G', '55,Zvezd Phone 5G',
    '105,ShtekataNAS LAN 1', '106,ShtekataNAS LAN 2', '110,AlpineNasVM', '111,UbuntuNasVM', 
    '120,AlpineServerVM', '121,UbuntuServerVM', '122,CentosServerVM',
    '130,CentosServerLxd', '131,UbuntuServerLxd', '132,FedoraServerLxd',
    '150,Brother Printer', '151,Dreame Bot D9 Pro Vacuum Cleaner', '152,Nokia Streaming Box 8000', '153,Camera V-IPC-200W-TKWS', '154,Philips TV'
    if ($start -and $end) {
        $range = $start..$end
        $range | ForEach-Object { if (test-connection $subnet$_ -count 1 -quiet) { Write-Host $subnet$_ }else { Write-Host 'Not responding!' } }
    }
    else {
        $range | ForEach-Object {
            $o = $_.ToString().Split(',')
            $t = $subnet + $o[0]
            if (test-connection $t -count 1 -quiet) { Write-Host "$t => "$o[1]"" }
            else { Write-Host "$t => "$o[1]" - Not responding!" }
        }
    }
}