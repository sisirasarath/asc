$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$out = "scratch/test_notes_render.html"
Start-Process -FilePath $chrome -ArgumentList "--headless=new", "--disable-gpu", "--dump-dom", "file:///c:/Users/HP/.gemini/antigravity/scratch/academic-support-portal/notes.html" -RedirectStandardOutput $out -Wait

$content = Get-Content $out -Raw
Write-Host "File length: $($content.Length)"
Write-Host "Contains 'drive-status-notice': $($content.Contains('drive-status-notice'))"
Write-Host "Contains 'MACE Google Drive Source': $($content.Contains('MACE Google Drive Source'))"
Write-Host "Contains 'Open Master Drive Folder': $($content.Contains('Open Master Drive Folder'))"
Write-Host "Contains 'panel-mace': $($content.Contains('id=""panel-mace""'))"
Write-Host "Contains 'mace-sem-filters': $($content.Contains('id=""mace-sem-filters""'))"
