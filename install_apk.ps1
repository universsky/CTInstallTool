$var=adb devices| Out-String
$head = "List of devices attached"
#$var.Contains($head)
# 去掉`n`r`t
$startIndex = $var.IndexOf($head)+$head.length + 3 
$endIndex = $var.length -1
###################
#$startIndex
#$endIndex
$L = $endIndex - $startIndex
###################
$deviceList=$var.Substring($startIndex ,$L )
#$deviceList
$deviceList = $deviceList -replace 'device'
#$deviceList
$deviceList > deviceList.txt
#读每一行deviceIds
$lines = Get-Content deviceList.txt 
foreach ($line in $lines){
   # 去掉每行中的deviceId前后的空格字符
   $line = $line -replace "\s{1,}",""
   Write "Installing Device $line ......"
   adb -s $line install -r *.apk
}


