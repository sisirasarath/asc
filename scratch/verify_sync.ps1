$c1 = Get-Content 'notes.html' -Raw
$c2 = Get-Content 'asc/notes.html' -Raw
$d1 = Get-Content 'js/mace-notes-data.js' -Raw
$d2 = Get-Content 'asc/js/mace-notes-data.js' -Raw

Write-Host "notes.html sync: $($c1 -eq $c2)"
Write-Host "notes-data sync: $($d1 -eq $d2)"
Write-Host "notes.html length: $($c1.Length)"
Write-Host "notes-data length: $($d1.Length)"
