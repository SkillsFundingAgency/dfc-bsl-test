    $bsl = Get-Process BrowserStackLocal -ErrorAction SilentlyContinue | Sort-Object Id | Select-Object -First 1
    if (-Not $bsl) {
	    Write-Host 'BrowserStackLocal not running'
        return
    }
    Write-Host "Stopping BrowserStackLocal: " -ForegroundColor Yellow -NoNewline
    Write-Host "$($bsl.ID):$($job.bsl)" -ForegroundColor Cyan -NoNewline
    Write-Host "..." -ForegroundColor Yellow
    Stop-Process $bsl
