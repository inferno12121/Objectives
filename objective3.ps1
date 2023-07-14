$aValue = Read-Host -Prompt "Enter the value for 'a'"
$bValue = Read-Host -Prompt "Enter the value for 'b'"
$cValue = Read-Host -Prompt "Enter the value for 'c'"
$dValue = Read-Host -Prompt "Enter the value for 'd'"

$object1 = @{ "a" = @{ "b" = @{ "c" = $cValue } } }
$object1["a"]["b"]["c"] = $dValue

$key1 = Read-Host -Prompt "Enter the key"

$value = $object1
$props = $key1 -split '/'
foreach ($prop in $props) {
    $value = $value.$prop
    if ($value -eq $null) {
        $value = $null
        break
    }
}

Write-Host "Value 1: $value"
