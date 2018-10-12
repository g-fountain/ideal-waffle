#First 
Import-Module VMware.VimAutomation.Core
$xml_data_path = "D:\Projects\ideal-waffle\data.xml" 
$xml_data = [xml](Get-Content $xml_data_path)
$vm = 'Linux Mint'
$updateinfo = Get-Random
connect-viserver $xml_data.config.conn.vcenter_FQDN -user $xml_data.config.conn.vcenter_user -password $xml_data.config.conn.vcenter_password -WarningAction SilentlyContinue
Get-VM -Name 'Linux Mint' | set-vm -Description $vm -Confirm:$false -RunAsync
Disconnect-VIServer $xml_data.config.conn.vcenter_FQDN -Confirm:$false
