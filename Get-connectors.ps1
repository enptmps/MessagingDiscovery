#Send Connectors
Get-SendConnector | select-object name,enabled,smarthostsstring | export-csv Get-SendConn-Summary.csv -NoTypeInfo
$SendConn = Get-SendConnector
Foreach ($SConn in $SendConn)
{
Get-SendConnector "$SConn" | Format-List | out-file $("Get-SendConn-"+$SConn+".txt")
}


#Receive Connectors
Get-ReceiveConnector | select-object server,name,enabled | export-csv Get-RecConn-Summary.csv -NoTypeInfo
$ReceiveConn = Get-ReceiveConnector
Foreach ($RConn in $ReceiveConn)
{
Get-ReceiveConnector "$RConn" | Format-List | out-file $("Get-ReceiveConn-"+$RConn.Server+"-"+$RConn.Name+".txt")
}