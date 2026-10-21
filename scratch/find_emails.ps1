$allFiles = Get-ChildItem -File -Recurse
Write-Host "Total files: $($allFiles.Count)"
$matched = @()
foreach ($f in $allFiles) {
    if ($f.FullName -like '*\.git\*' -or $f.FullName -like '*academic-support-portal\scratch\*') { continue }
    $text = [System.IO.File]::ReadAllText($f.FullName)
    $ems = [regex]::Matches($text, '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
    foreach ($e in $ems) {
        $val = $e.Value
        if ($val -notmatch 'example\.com|w3\.org|schema\.org|cloudflare\.com') {
            $matched += [PSCustomObject]@{
                File = $f.FullName.Replace('C:\Users\HP\.gemini\antigravity\scratch\academic-support-portal\', '')
                Email = $val
            }
        }
    }
}
Write-Host "Matched email occurrences: $($matched.Count)"
$matched | Format-Table -AutoSize
