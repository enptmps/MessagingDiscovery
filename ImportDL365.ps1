Import-CSV "C:\temp\DistributionGroups.csv" | ForEach-Object {New-DistributionGroup -Name $_.DGDisplayName -PrimarySmtpAddress $_.DgPrimarysmtp -ManagedBy $_.Manager} 