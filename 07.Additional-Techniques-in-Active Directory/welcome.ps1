$WelcomeFile = "$($env:USERPROFILE)\Desktop\Welcome.txt"

"Welcome $($env:USERNAME)! Don't forget to lock your computer when not using it." | Out-File $WelcomeFile 