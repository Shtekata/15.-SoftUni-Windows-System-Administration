function Project-Phase {
    
    <#
        .synopsys
        Simple tool for creating 1 leve nested folders
        .description
        This function accepts four parameters: ProjectStart, ProjectEnd, PhaseStart, PhaseEnd
        .example
        Project-Phase -ProjectStart 5 -ProjectEnd 10 -PhaseStart 35 -PhaseEnd 75
        .notes
        First source the ProjectPhase.ps1 file.
        .link
        https://softuni.bg
    #>

    [cmdletbinding()]

    param([int]$ProjectStart=0,[int]$ProjectEnd=0,[int]$PhaseStart=0,[int]$PhaseEnd=0)
    
    Write-Verbose 'Create folder structure from Projects and Phases'
    
    if(!(Test-Path -Path 'c:/projects')){md c:/Projects}
    
    for($counter=$ProjectStart;$counter -le $ProjectEnd;$counter++){
    
        md "c:/projects/Project$counter"
    
        for($counter2=$PhaseStart;$counter2 -le $PhaseEnd;$counter2++){
    
            md "c:/projects/project$counter/Phase$counter2"
    
        }
    
    }

}