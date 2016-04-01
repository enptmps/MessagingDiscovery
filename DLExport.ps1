#Constant Variables
$GroupsOutputFile   = "DistributionGroups.csv" #This CSV contains a list of group objects
$GroupMembersOutputFile = "DistributionGroupMembers.csv"   #This CSV contains members for each group
$arrDLMembers = @{}  
 
#Prepare Output file with headers  
Out-File -FilePath $GroupMembersOutputFile -InputObject "DGDisplayName,DGPrimarySMTP,MemberDisplayName,MemberPrimarySMTP,MemberType" -Encoding UTF8
Out-File -FilePath $GroupsOutputFile -InputObject "DGDisplayName, DGPrimarySMTP" -Encoding UTF8
 
#Get all Distribution Groups from Office 365  
$objDistributionGroups = Get-DistributionGroup -ResultSize Unlimited
ForEach ($objDistributionGroup in $objDistributionGroups)
{
    Out-File -FilePath $GroupsOutputFile -InputObject "$($objDistributionGroup.DisplayName),$($objDistributionGroup.PrimarySMTPAddress)" -Encoding UTF8 -Append
    Write-Host "`t$($objDistributionGroup.DisplayName),$($objDistributionGroup.PrimarySMTPAddress)"
}
  
#Iterate through all groups, one at a time      
Foreach ($objDistributionGroup in $objDistributionGroups)  
{      
     
    write-host "Processing $($objDistributionGroup.DisplayName)..."  
  
    #Get members of this group  
    $objDGMembers = Get-DistributionGroupMember -Identity $($objDistributionGroup.Displayname)  
      
    write-host "Found $($objDGMembers.Count) members..."  
      
    #Iterate through each member  
    Foreach ($objMember in $objDGMembers)  
    {  
        Out-File -FilePath $GroupMembersOutputFile -InputObject "$($objDistributionGroup.DisplayName),$($objDistributionGroup.PrimarySMTPAddress),$($objMember.DisplayName),$($objMember.PrimarySMTPAddress),$($objMember.RecipientType)" -Encoding UTF8 -append  
        write-host "`t$($objDistributionGroup.DisplayName),$($objDistributionGroup.PrimarySMTPAddress),$($objMember.DisplayName),$($objMember.PrimarySMTPAddress),$($objMember.RecipientType)" 
    }  
}   
