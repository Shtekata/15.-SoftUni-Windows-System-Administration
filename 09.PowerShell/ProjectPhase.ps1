param([int]$ProjectStart=2,[int]$ProjectEnd=2,[int]$PhaseStart=2,[int]$PhaseEnd=2)
if(!(Test-Path -Path 'cprojects')){md cProjects}
for($counter=$ProjectStart;$counter -le $ProjectEnd;$counter++){
    md cprojectsProject$counter
    for($counter2=$PhaseStart;$counter2 -le $PhaseEnd;$counter2++){
        md cprojectsproject$counterPhase$counter2
    }
}