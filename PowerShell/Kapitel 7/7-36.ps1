$desktop = [Environment]::GetFolderPath('Desktop')
New-PSDrive -Name Desktop -PSProvider FileSystem -Root $desktop
Get-ChildItem -Path Desktop:
