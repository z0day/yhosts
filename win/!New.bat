

:: gpedit.msc  C:\Windows\System32\GroupPolicy

TITLE ʹ�ã�Ĭ��ѡ�����&����

echo Fix CHM
regsvr32 /s hhctrl.ocx
regsvr32 /s itircl.dll
regsvr32 /s itss.dll

echo ����Notepad2
copy /y "Notepad2.exe" "%SystemRoot%" >nul 2>nul
echo ��Notepad�ٳ�ΪNotepad2
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /d "\"C:\Windows\Notepad2.exe\" /z" /f >nul 2>nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /f >nul 2>nul
echo ��ӣ��ļ����ü��±��򿪣�97��imageres.dll,289 (��Shift��ʾ)
reg add "HKCR\*\shell\Noteped" /ve /d "�ü��±���" /f
reg add "HKCR\*\shell\Noteped" /v "icon" /d "SHELL32.dll,70" /f
reg add "HKCR\*\shell\Noteped" /v "Extended" /d "" /f
reg add "HKCR\*\shell\Noteped\command" /ve /d "Notepad2.exe %%1" /f

echo �ڿ��������� �༭ע��� ��
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "�༭ע���" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "InfoTip" /d "��ע���༭��" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}" /v "System.ControlPanel.Category" /d "5" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\DefaultIcon" /ve /d "%%SystemRoot%%\regedit.exe" /f
reg add "HKCR\CLSID\{19260817-d95d-4dff-8b2b-a530db6ed982}\Shell\Open\command" /ve /d "regedit" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{19260817-d95d-4dff-8b2b-a530db6ed982}" /ve /d "���ע���༭��" /f

echo ���LRC��ʸ�ʽʶ��
reg add "HKCR\.lrc" /ve /d "lrcfile" /f
reg add "HKCR\.lrc" /v "PerceivedType" /d "text" /f
reg add "HKCR\lrcfile" /ve /d "lrc ���" /f
reg add "HKCR\lrcfile\DefaultIcon" /ve /d "imageres.dll,17" /f
reg add "HKCR\lrcfile\shell" /f
reg add "HKCR\lrcfile\shell\open" /f
reg add "HKCR\lrcfile\shell\open\command" /ve /d "NOTEPAD.EXE %%1" /f

echo Ĭ��ʹ��Chrome��MHT
reg add "HKCR\.mht" /ve /d "ChromeHTML" /f
echo Ĭ��ʹ��Chrome��PDF
reg add "HKCR\.pdf" /ve /d "ChromeHTML" /f



echo �ر�Smartscreenɸѡ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d "Off" /f


echo �رմ� ���� �ļ��ġ���ȫ���桱
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /d ".7z;.cab;.bat;.chm;.cmd;.exe;.js;.msi;.rar;.reg;.vbs;.zip;.txt" /f

::΢��ƴ�����뷨
echo ΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t REG_DWORD /d 1 /f
echo �رմ����л�ȡ��ѡ��
rem �ر�΢��ƴ���Ƽ���
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t REG_DWORD /d 0 /f
echo �رմ����л�ȡ��ֽ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableLiveSticker" /t REG_DWORD /d 0 /f
echo �ر�ģ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t REG_DWORD /d 0 /f
echo �ر���ʾ�´��ȴ���������ʾ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t REG_DWORD /d 0 /f

::���� Hyper-V (To enable: bcdedit /set hypervisorlaunchtype auto)
rem To disable: 
bcdedit /set hypervisorlaunchtype off

:: ϵͳ ���ر�Windows��־�ļ�
echo ���ô��󱨸�(Windows Error Reporting Service)
sc config WerSvc start= disabled
echo ����WfpDiag.ETL��־
netsh wfp set options netevents = off
echo ����Dirty shutdown event��־
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d 0 /f
echo ����ϵͳ��־
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
echo �����˺ŵ�¼��־����
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /d "0" /f

::���±�
echo ���±�ʼ����ʾ״̬��
reg add "HKCU\Software\Microsoft\NotePad" /v "StatusBar" /t REG_DWORD /d 1 /f
echo ���±������Զ�����
reg add "HKCU\Software\Microsoft\NotePad" /v "fwrap" /t REG_DWORD /d 1 /f

::WMPlayer
echo Windows Media Player ����ʾ�״�ʹ�öԻ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t REG_DWORD /d 1 /f > NUL 2>&1

::Windows PhotoViewer
echo ���� Windows ��Ƭ�鿴��
reg add "HKCU\Software\Classes\.bmp" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.gif" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.ico" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpe" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpeg" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.jpg" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.png" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tga" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tif" /ve /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\Software\Classes\.tiff" /ve /d "PhotoViewer.FileAssoc.Tiff" /f




echo ����ʱ�Զ�����
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 1 /f

echo ���� ׿Խ���ܵ�Դģʽ


::ezbsystems http://www.ezbsystems.com/ultraiso/download.htm
echo UltraISO ע��
reg add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "UserName" /d "����" /f
reg add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "Registration" /d "67693a0a733a6e6c111c4e06733c6b1f" /f

::Magix.com
echo Vegas Ĭ��ʹ��������������
reg add "HKLM\SOFTWARE\Sony Creative Software\Error Reporting Client\1.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\Sony Creative Software\Sony Vegas OFX GPU Video Plug-in Pack\1.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\Sony Creative Software\Sony Vegas Video Plug-In Pack\1.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\Sony Creative Software\VEGAS Pro\15.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\Sony Creative Software\VEGAS Pro\16.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\WOW6432Node\Sony Creative Software\SfTrans1\1.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\WOW6432Node\Sony Creative Software\Sony Vegas Video Plug-In Pack\1.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
reg add "HKLM\SOFTWARE\WOW6432Node\Sony Creative Software\Video Capture\6.0\Lang" /v "ULangID" /t REG_DWORD /d 2052 /f
echo R2R������Ϣ����
reg add "HKCU\SOFTWARE\TEAM R2R\Protein Emulator" /v "Name" /d "MAGIX Software GmbH" /f
reg add "HKCU\SOFTWARE\TEAM R2R\Protein Emulator" /v "SerialNumber" /d "P-1-305-722-5810" /f

::WinRAR
echo WinRAR ȥ���Ҽ��˵�����ӵġ�ѹ��...�� E-Mail��
reg add "HKCU\SOFTWARE\WinRAR\Setup\MenuItems" /v "EmailArc" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\WinRAR\Setup\MenuItems" /v "EmailOpt" /t REG_DWORD /d 0 /f
echo WinRAR ����������
reg add "HKCU\Software\WinRAR\General\Toolbar" /v "Lock" /t REG_DWORD /d 1 /f
echo WinRAR Ĭ��ѹ����ʽ
reg add "HKCU\Software\WinRAR\Profiles\0" /v "RAR5" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\WinRAR\Profiles\0" /v "Default" /t REG_DWORD /d 1 /f

::�ٳ�һЩ�޸���ҳ�ͺ�̨�����ƹ���ļ�
rem 2345
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345MiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\2345PicMiniPage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Downloader_2345Explorer.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HaoZipHomePage.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wzdh2345.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Pic_2345Svc.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Helper_2345Pic.exe" /v Debugger /t REG_SZ /d "p" /f
rem 360
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\360wallpaper_360safe.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\360zipInst.exe" /v Debugger /t REG_SZ /d "p" /f
rem Baofeng
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BFBrowser.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BFDesktopTips.exe" /v Debugger /t REG_SZ /d "p" /f
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BFpop.exe" /v Debugger /t REG_SZ /d "p" /f
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\InfoTips.exe" /v Debugger /t REG_SZ /d "p" /f
rem Chrome
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe" /v Debugger /t REG_SZ /d "p" /f
rem Flash
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FlashHelperService.exe" /v Debugger /t REG_SZ /d "p" /f
rem iQIYI
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QyFragment.exe" /v Debugger /t REG_SZ /d "p" /f
rem KingSoft
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_duba.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install_ksafe.exe" /v Debugger /t REG_SZ /d "p" /f
rem wps
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\desktoptip.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wpsnotify.exe" /v Debugger /t REG_SZ /d "p" /f
rem DriverGenius
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kbasesrv_setup.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kdsminisite.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kinstallsoftware.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kminisite.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kminisitebox.exe" /v Debugger /t REG_SZ /d "p" /f
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\kybox.exe /v Debugger /t REG_SZ /d "p" /f
rem KingSoft-iciba
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ksddownloader.exe" /v Debugger /t REG_SZ /d "p" /f
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ktpcntr.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\minisite.exe" /v Debugger /t REG_SZ /d "p" /f
rem Sogou
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SohuNews.exe" /v Debugger /t REG_SZ /d "p" /f
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SogouCloud.exe" /v Debugger /t REG_SZ /d "p" /f
rem QQ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\QQPcmgrDownload.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\pcmgr_down.exe" /v Debugger /t REG_SZ /d "p" /f
rem TaoBao
::reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Dandelion.exe" /v Debugger /t REG_SZ /d "p" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DandelionSetup.exe" /v Debugger /t REG_SZ /d "p" /f
rem Pops
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\KuaizipUpdate.exe" /v Debugger /t REG_SZ /d "p" /f
rem Glarysoft
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GUDownloader.exe" /v Debugger /t REG_SZ /d "p" /f

echo ������������
netsh advfirewall reset
netsh int ip reset
netsh winhttp reset proxy
netsh winsock reset
ipconfig /flushdns
echo ��������Ż�
echo ���� Receive Window Auto-Tuning Level�����մ����Զ����ڼ���
rem ��    ԭ netsh int tcp set global autotuninglevel=normal
rem �鿴״̬ netsh interface tcp show global
netsh int tcp set global autotuninglevel=disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d 65535 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxFreeTcbs" /t REG_DWORD /d 65536 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxHashTableSize" /t REG_DWORD /d 8192 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPWindowSize" /t REG_DWORD /d 62420 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f



:: ����������֣�WinĬ�Ͻ��õķ���AppVClient NetTcpPortSharing ssh-agent RemoteRegistry RemoteAccess shpamsvc tzautoupdate UevAgentService
::����ʹ�������Ϣ���ռ��ʹ���
::Connected User Experiences and Telemetry
net stop DiagTrack
sc config DiagTrack start=disabled
echo Data Sharing Service
sc config DsSvc start=disabled
echo Diagnostic Execution Service
sc config diagsvc start=disabled
echo ������Ϸ��� Diagnostic Policy Service
net stop DPS
sc config DPS start=disabled
echo ����Զ���޸�ע���
sc config RemoteRegistry start=disabled
echo ���ó������������ Program Compatibility Assistant Service
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f >nul 2>nul
sc config PcaSvc start=disabled
::Diagnostic Service Host
sc config WdiServiceHost start=disabled
::Diagnostic System Host
sc config WdiSystemHost start=disabled
::dmwappushsvc
sc config dmwappushservice start=disabled
::Microsoft (R) ������ı�׼�ռ�������
sc config diagnosticshub.standardcollector.service start=disabled
::Performance Logs & Alerts
sc config pla start=disabled
::Problem Reports and Solutions Control Panel Support
sc config wercplsupport start=disabled

::Hyper-V
sc config HvHost start=disabled
sc config vmickvpexchange start=disabled
sc config vmicguestinterface start=disabled
sc config vmicshutdown start=disabled
sc config vmicheartbeat start=disabled
sc config vmicvmsession start=disabled
sc config vmictimesync start=disabled
sc config vmicvss start=disabled
sc config vmicrdv start=disabled

::Xbox
rem Xbox Accessory Management Service
sc config XboxGipSvc start=disabled
rem Xbox Game Monitoring
rem sc config xbgm start= demand
rem Xbox Live �����֤������
sc config XblAuthManager start=disabled
rem Xbox Live �������
sc config XboxNetApiSvc start=disabled
rem Xbox Live ��Ϸ����
sc config XblGameSave start=disabled
rem ���� XBOX GameDVR
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 0 /f > NUL 2>&1

::Fax
sc config Fax start=disabled
::Distributed Link Tracking Client
sc config TrkWks start=disabled
::Downloaded Maps Manager
sc config MapsBroker start=disabled
::Geolocation Service
sc config lfsvc start=disabled
::Phone Service
sc config PhoneSvc start=disabled


::Shell Hardware Detection
sc config ShellHWDetection start=disabled
::Remote Registry(Զ���޸�ע���)
sc config RemoteRegistry start=disabled
::Superfetch
net stop SysMain
sc config SysMain start=disabled
::Windows Media Player Network Sharing Service
sc config WMPNetworkSvc start=disabled
::Windows Search
net stop WSearch
taskkill /f /im SearchUI.exe > NUL 2>&1
sc config WSearch start=disabled
::������ʾ����
sc config RetailDemo start=disabled

::���ڷ���
sc config QQMusicService start=disabled > NUL 2>&1
sc config QiyiService start=disabled > NUL 2>&1
sc config wpscloudsvr start=disabled > NUL 2>&1

:: ����ƻ�������� %windir%\system32\taskschd.msc /s
::Microsoft �ͻ�������Ƽƻ�
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Autochk\Proxy"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClient"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\Notifications"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Location\WindowsActionDialog"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maintenance\WinSAT"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsToastTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Maps\MapsUpdateTask"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\RetailDemo\CleanupOfflineContent"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\WDI\ResolutionHost"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
::Windows Defender
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
::�������Ż�����Ƭ����
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
::�Զ���������
SCHTASKS /Change /Disable /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup"
::XblGameSaveTask
SCHTASKS /Change /Disable /TN "\Microsoft\XblGameSave\XblGameSaveTask"
::Adobe
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%" > NUL 2>&1
::Officeң�����ĺ�̨����
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" > NUL 2>&1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" > NUL 2>&1

echo Windows��������
rem net stop wuauserv
del /s /q /f %windir%\SoftwareDistribution\Download\*.*
del /s /q /f %windir%\SoftwareDistribution\DataStore\*.*
rem net start wuauserv
start ms-settings:windowsupdate

cls
echo ���²���
gpupdate /force 
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
ping -n 3 127.0.0.1>nul
echo �ر�explorer.exe
taskkill /f /im explorer.exe > NUL 2>&1
echo ���� ϵͳ���̼����ͼ��
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams > NUL 2>&1
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream > NUL 2>&1
echo ����ϵͳͼ�껺�����ݿ�
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db" > NUL 2>&1
del /f "%userprofile%\AppData\Local\IconCache.db" > NUL 2>&1
attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*" > NUL 2>&1
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db" > NUL 2>&1
echo ��explorer
start explorer
