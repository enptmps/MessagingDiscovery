Get-RetentionPolicy | Foreach-Object{
$Policy = $_
(Get-RetentionPolicy $Policy).RetentionPolicyTagLinks | `
select @{n="Policy";e ={$Policy }},name
} | export-Csv  C:\scripts\RetentionPolicyTagLinks.csv -nti 
