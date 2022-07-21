Param ($InputFile, $MainFile)

Function Get-ServersFile {
    Param(
        [string]$file
    )
    Process {
        $read = New-Object System.IO.StreamReader($file)
        $serverarray = @()

        while (($line = $read.ReadLine()) -ne $null) {
            $serverarray += $line
        }

        $read.Dispose()
        return $serverarray
    }
}

$servers = Get-ServersFile -file "$InputFile"


foreach ($server in $servers) {
    Add-Content $MainFile "$server"
    Write-Host "$server added"
}


Write-Host "Done!"

Exit