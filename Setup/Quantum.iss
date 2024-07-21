; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Quantum"
#define MyAppVersion "1.0.0.0"
#define MyAppExeName "Quantum.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
SignTool=MsSign $f
AppId={{2275862F-4ADC-4BC3-B43F-40A730EDC980}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
DefaultDirName={autopf}\{#MyAppName}
; "ArchitecturesAllowed=x64compatible" specifies that Setup cannot run
; on anything but x64 and Windows 11 on Arm.
ArchitecturesAllowed=x64compatible
; "ArchitecturesInstallIn64BitMode=x64compatible" requests that the
; install be done in "64-bit mode" on x64 or Windows 11 on Arm,
; meaning it should use the native 64-bit Program Files directory and
; the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64compatible
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=Quantum_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupIconFile=images\Q_32.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
UninstallDisplayName={#MyAppName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

[Files]
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\Quantum.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\Quantum.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\Quantum.dll.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\Quantum.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\Quantum.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\QBittorrent.Client.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\QBittorrent.Client.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\scr\Quantum\bin\Release\net8.0-windows7.0\QBittorrent.Client.xml"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

