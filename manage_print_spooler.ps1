if((Get-ChildItem C:\WINDOWS\system32\spool\PRINTERS\ | Measure-Object).Count -gt 0) {
    $oldest_file = Get-ChildItem C:\WINDOWS\system32\spool\PRINTERS\ | Sort CreationTime | select -First 1
    $current_time = Get-Date
    $delta = New-TimeSpan -End $current_time -Start $oldest_file.CreationTime
    Write-Host "Oldest file is $($oldest_file.LastWriteTime)"
    Write-Host "Delta: $delta"

    if($delta.Minutes -ge 10) {
        Write-Host "Max time Reached"
        Stop-Service Spooler
        Remove-Item –path C:\WINDOWS\system32\spool\PRINTERS\*
        Start-Service Spooler
    } else {
        Write-Host "Max time Not Reached"
    }
} else {
    Write-Host "No Files"
}
