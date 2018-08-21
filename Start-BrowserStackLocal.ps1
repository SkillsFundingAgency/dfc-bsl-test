    $browserStackSecret = "__browserStackSecret__"
	$browserStackIdentifier = "__browserStackIdentifier__"
	$browserStackCommand = Join-Path $PSScriptRoot "BrowserStackLocal.exe"
	
    $bsl = Get-Process BrowserStackLocal -ErrorAction SilentlyContinue
    if ($bsl) {
        Write-Host "BrowserStackLocal already started: " -ForegroundColor Yellow -NoNewline
        Write-Host "$($bsl.ID):$($bsl.Name)" -ForegroundColor Cyan
        return
    }
    
	$bslc = Get-Command $browserStackCommand
    if (-Not $bslc) { throw "Cannot find BrowserStackLocal" }
 
    Write-Host "Starting BrowserStackLocal..." -ForegroundColor Yellow
	$params = @{
	    'FilePath'= $browserStackCommand;
		'WorkingDirectory' = $PSScriptRoot;
		'ArgumentList'= "--key $browserStackSecret --local-identifier $browserStackIdentifier"
	}
	$bsl = Start-Process @params

    Start-Sleep 5
 
    if ($bsl)
    {
        Write-Host "Started " -NoNewline -ForegroundColor Yellow
        Write-Host "$($bsl.ID):$($bsl.Name)" -ForegroundColor Cyan
    }
