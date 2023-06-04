#
# Guess Game
#

# Initialize variables
$MinNo=1
$MaxNo=10
$GuessNum=(get-random -minimum $MinNo -maximum $MaxNo)

write-host "I have a number between $MinNo and $MaxNo on my mind. Could you guess it?"
write-host ''

# Ask the opponent
$MaxTries=(read-host -prompt 'How many attempts would you like to have')
write-host ''

# Initialize the guess attempt counter
$GuessCnt=1

# Start the guess loop
do{
    $Guess=(read-host -prompt "Your guess attempt no.$GuessCnt is")
    write-host "You think that my number is $($Guess)? Let me see ..."
    if($Guess -eq $GuessNum){
        write-host 'Congratulations! You gusssed it!'
        write-host "My number is $GuessNum"
        break
    }
    if($Guess -lt $GuessNum){
        write-host 'No. Try a bigger number.'
    }
    if($Guess -gt $GuessNum){
        write-host 'No. Try a smaller number.'
    }
    write-host ''
    $GuessCnt++
}while($GuessCnt -le $MaxTries)

if($GuessCnt -gt $MaxTries){
    write-host 'My friend, you ran out of attempts ...'
    write-host "GAME OVER. My number was: $GuessNum"
}
