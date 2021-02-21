New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

Get-ChildItem -Path HKU: -ErrorAction Ignore
Get-ChildItem -Path HKCR: -ErrorAction Ignore
