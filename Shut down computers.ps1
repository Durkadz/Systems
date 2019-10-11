# Declarate variables
$FicheroListaServerApagar = "F:\Scripts\TareasProgramadas\ApagadoDiarioPCs\Computers.csv"
$FicheroExclusiones = "F:\Scripts\TareasProgramadas\ApagadoDiarioPCs\Exclusiones.csv"

$logDate = Get-Date -f "yyyy-MM-dd"
$FicheroLogApagado = "F:\Scripts\TareasProgramadas\ApagadoDiarioPCs\Logs\ComputersApagadosLog_$logDate.csv"

# Import files
$ServersApagar = Import-Csv $FicheroListaServerApagar
$Exclusiones = Import-csv $FicheroExclusiones 

# Compare two files
$RESULT = Compare-Object $serversApagar $exclusiones -Property Server -IncludeEqual

#This loop compare the two files and it decides.


Foreach($R in $Result){
    
    If( $R.sideindicator -eq "<=" ){

        $Server = $R.Server

        #Write-host "$Server , turnoff"
            
        $ResponseServer = Test-Connection -ComputerName $Server -Quiet -Count 1

            If($ResponseServer){

                "$Server,$ResponseServer" | Out-File -FilePath $FicheroLogApagado -Append

                Stop-Computer -ComputerName $Server –Force
                Start-Sleep -Seconds 2

             } else {

                "$Server,NO RESPONDE" | Out-File -FilePath $FicheroLogApagado -Append}

        } else {

            $Server = $R.Server

            "$Server,Excluido" | Out-File -FilePath $FicheroLogApagado -Append}
      
}
