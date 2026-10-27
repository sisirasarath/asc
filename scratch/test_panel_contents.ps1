$lines = Get-Content 'scratch/rendered_notes.html'
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -like '*id="ktu2024-content"*' -or $lines[$i] -like '*id="mace-content"*') {
        Write-Host "Found at line $i : $($lines[$i])"
        for ($j = 1; $j -le 10; $j++) {
            if ($i + $j -lt $lines.Count) {
                $lineContent = $lines[$i+$j]
                Write-Host "  +$j - $lineContent"
            }
        }
    }
}
