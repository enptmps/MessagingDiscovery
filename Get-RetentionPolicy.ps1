Set-ADServersettings -ViewEntireForest:$true

$Policies = Get-RetentionPolicy

$Output =  ForEach($Policy In $Policies) { $Policy.RetentionPolicyTagLinks | Get-RetentionPolicyTag | Select @{Name = "Policy";e = {$Policy.Name }},
Name,`
#@{Name = "AgeLimit"; Expression = { $.AgeLimitForRetention.ToString() }}
@{Name = "AgeLimit"; Expression = {[Int]$.AgeLimitForRetention.ToString().Split(".")[0]}}
}

$Output | Export-Csv "C:\scripts\RetentionPolicyTagLinks.csv" -nti
