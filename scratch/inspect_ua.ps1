$html = Get-Content 'scratch/drive_ua.html' -Raw
Write-Host "Total Length: $($html.Length)"

if ($html -match '<title>(.*?)</title>') {
    Write-Host "Title: $($matches[1])"
}

# Look for Drive folder name / folder metadata in the HTML
if ($html -match '(?i)<meta\s+property="og:title"\s+content="([^"]+)"') {
    Write-Host "OG Title: $($matches[1])"
}
if ($html -match '(?i)<meta\s+name="description"\s+content="([^"]+)"') {
    Write-Host "Description: $($matches[1])"
}

# Search for any embedded JSON data or items
if ($html -match '(?s)_DRIVE_BOOTSTRAP_DATA\s*=\s*(\{.*?\})\s*;\s*</script>') {
    Write-Host "Found _DRIVE_BOOTSTRAP_DATA!"
}

# Search for any strings in the data
$matchesItems = [regex]::Matches($html, '\["([a-zA-Z0-9_-]{20,})","([^"]+)"')
Write-Host "Items regex matches count: $($matchesItems.Count)"
foreach ($m in ($matchesItems | Select-Object -First 30)) {
    Write-Host "Item: $($m.Groups[1].Value) -> $($m.Groups[2].Value)"
}

# Look for folder names like S1, S2, Semester, Department, etc.
$textMatches = [regex]::Matches($html, '(?i)"([^"]*(?:semester|s[1-8]|mace|notes|cse|ece|eee|mech|civil|module|physics|chemistry|math)[^"]*)"')
Write-Host "Academic keywords found in strings: $($textMatches.Count)"
$uniqueTexts = $textMatches | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique | Select-Object -First 40
foreach ($t in $uniqueTexts) {
    if ($t.Length -lt 100 -and $t -notmatch '^http') {
        Write-Host "Found String: $t"
    }
}
