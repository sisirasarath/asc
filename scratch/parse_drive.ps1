$html = Get-Content 'scratch/drive_folder.html' -Raw
Write-Host "Total Length: $($html.Length)"

if ($html -match '<title>(.*?)</title>') {
    Write-Host "Title: $($matches[1])"
}

# Look for Drive folder metadata, names, subfolders, files
$pattern = '(?s)data-target="(?<target>[^"]+)".*?data-id="(?<id>[^"]+)"'
# Google Drive embedded JSON usually has _DRIVE_BOOTSTRAP_DATA or WIZ_global_data
if ($html -match '(?s)(window\._DRIVE_BOOTSTRAP_DATA\s*=\s*\{.*?\}\;)') {
    Write-Host "Found _DRIVE_BOOTSTRAP_DATA"
}

# Search for typical semester strings or folder names like S1, S2, S3, S4, S5, S6, S7, S8, CSE, etc.
$foundSem = [regex]::Matches($html, '(?i)\b(S[1-8]|Semester\s*[1-8]|CSE|ECE|EEE|MECH|CIVIL|Data\s*Science)\b')
Write-Host "Semester/Branch keyword occurrences: $($foundSem.Count)"

# Let's search for filenames ending in .pdf, .docx, .ppt, .zip or folder items
$files = [regex]::Matches($html, '"([^"]+\.(?:pdf|docx|pptx|ppt|zip|png|jpg))"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
Write-Host "Direct filenames found: $($files.Count)"
foreach ($f in ($files | Select-Object -First 20)) {
    Write-Host "File: $($f.Groups[1].Value)"
}
