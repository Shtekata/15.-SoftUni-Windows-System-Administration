do{
    $FirstName=(Read-Host -Prompt 'Please enter your first name')
    $LastName=(Read-Host -Prompt 'Please enter your last name')
    $Password=(Read-Host -Prompt 'Please enter your password')

    $SAN="$FirstName.$LastName".ToLower()

    New-ADUser -name $FirstName -AccountPassword(ConvertTo-SecureString -AsPlainText $Password -Force) -GivenName $FirstName -Surname $LastName -displayname "$FirstName $LastName" -Enabled $true -UserPrincipalName "$SAN@wsa.lab" -SamAccountName $SAN

    if(!(Test-Path -Path 'c:/shared')){md c:/Shared}
    if(!(Test-Path -Path "c:/shared/$SAN")){md C:/Shared/$SAN}

    $Answers='yes','no'
    $AnotherUser=''
        do{
            $AnotherUser=(Read-Host -Prompt 'Would you like to register another user?').ToLower() 
            if($AnotherUser -notin $Answers)
                {
                    Write-Host 'Please enter YES or NO'
                }
            }while($AnotherUser -notin $Answers)
   }while($AnotherUser -eq 'yes')