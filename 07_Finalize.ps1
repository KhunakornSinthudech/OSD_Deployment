Start-Transcript x:\logs\A06_Finalization.log


If(Test-Path -Path "W:\OS\")
    {
        Write-Host "Clear local OSCache" -ForegroundColor Yellow
        Remove-Item 'W:\OS\' -Recurse -Force
    }

If(Test-Path -Path "W:\Dell")
    {
        Write-Host "Clear local Driver CAB" -ForegroundColor Yellow
        Remove-Item 'W:\Dell\' -Recurse -Force
    }

If(Test-Path -Path "W:\Drivers")
    {
        Write-Host "Clear local Driver Cache" -ForegroundColor Yellow
        Remove-Item 'W:\Drivers\' -Recurse -Force
    }

Stop-Transcript
#Coping Log Files

try {
    write-host "Copying logs to C:\_SMSTaskSequence\Logs" -ForegroundColor Yellow
    if (!(Test-Path "W:\_SMSTaskSequence\Logs")) {
    mkdir "W:\_SMSTaskSequence\Logs"
}
    copy-item "x:\logs\*.log" "W:\_SMSTaskSequence\Logs"-Force -Recurse -ErrorAction Stop
}
catch {
    write-host "Ran into an issue: $PSItem" -ForegroundColor Red
    exit
}


#wpeutil reboot
