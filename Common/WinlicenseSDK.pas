unit WinlicenseSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

type
  sLicenseFeatures = record
    cb: Integer;
    NumDays: Integer;
    NumExec: Integer;
    ExpDate: SYSTEMTIME;
    CountryId: Integer;
    Runtime: Integer;
    GlobalMinutes: Integer;
    InstallDate: SYSTEMTIME;
    NetInstances: Integer;
    EmbedLicenseInfoInKey: Integer;
    EmbedCreationDate: Integer
  end;

const

  wlNoTrialExt = 0;
  wlAppExtended = 1;
  wlInvalidTrialExt = 2;
  wlNoMoreExt = 3;
  wlTrialOk = 0;
  wlTrialDaysExpired = 1;
  wlTrialExecExpired = 2;
  wlTrialDateExpired = 3;
  wlTrialRuntimExpired = 4;
  wlTrialGlobalExpired = 5;
  wlTrialInvalidCountry = 6;
  wlTrialManipulated = 7;
  wlMarkStolenKey = 0;
  wlMarkInvalidKey = 1;
  wlLicenseDaysExpired = 1;
  wlLicenseExecExpired = 2;
  wlLicenseDateExpired = 3;
  wlLicenseGlobalExpired = 4;
  wlLicenseRuntimeExpired = 5;
  wlLicenseActivationExpired = 6;
  wlIsTrial = 0;
  wlIsRegistered = 1;
  wlInvalidLicense = 2;
  wlInvalidHardwareLicense = 3;
  wlNoMoreHwdChanges = 4;
  wlLicenseExpired = 5;
  wlInvalidCountryLicense = 6;
  wlLicenseStolen = 7;
  wlWrongLicenseExp = 8;
  wlWrongLicenseHardware = 9;
  wlIsRegisteredAndActivated = wlIsRegistered;
  wlIsRegisteredNotActivated = 10;
  wlNoMoreInstancesAllowed = 12;
  wlNetworkNoServerRunning = 13;
  wlInstallLicenseDateExpired = 14;
  wlLicenseDisabledInInstance = 15;

  wlPermKey = -1;
  wlNoKey = -2;
  wlNoTrialDate = -1;
  wlInvalidCounter = -1;

  // License restrictions

  wlRegRestrictionDays = 1 shl 0;
  wlRegRestrictionExec = 1 shl 1;
  wlRegRestrictionDate = 1 shl 2;
  wlRegRestrictionRuntime = 1 shl 3;
  wlRegRestrictionGlobalTime = 1 shl 4;
  wlRegRestrictionCountry = 1 shl 5;
  wlRegRestrictionHardwareId = 1 shl 6;
  wlRegRestrictionNetwork = 1 shl 7;
  wlRegRestrictionInstallDate = 1 shl 8;
  wlRegRestrictionCreationDate = 1 shl 9;
  wlRegRestrictionEmbedUserInfo = 1 shl 10;

function WLGenTrialExtensionFileKey(TrialHash: PAnsiChar; Level: Integer; NumDays: Integer; NumExec: Integer; NewDate: Pointer; NumMinutes: Integer; TimeRuntime: Integer; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenTrialExtensionRegistryKey(TrialHash: PAnsiChar; Level: Integer; NumDays: Integer; NumExec: Integer; NewDate: Pointer; NumMinutes: Integer; TimeRuntime: Integer; pKeyName: PAnsiChar; pKeyValueName: PAnsiChar; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenPassword(PasswordHash: PAnsiChar; Name: PAnsiChar; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseFileKey(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; CountryId: Integer; Runtime: Integer; GlobalMinutes: Integer; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseFileKeyW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; CountryId: Integer; Runtime: Integer; GlobalMinutes: Integer; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseFileKeyEx(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; var LicenseFeatures: sLicenseFeatures; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseFileKeyExW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; var LicenseFeatures: sLicenseFeatures; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseRegistryKey(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; CountryId: Integer; Runtime: Integer; GlobalMinutes: Integer; KeyName: PAnsiChar; KeyValueName: PAnsiChar; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseRegistryKeyW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; CountryId: Integer; Runtime: Integer; GlobalMinutes: Integer; KeyName: PWideChar; KeyValueName: PWideChar; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseRegistryKeyEx(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; var LicenseFeatures: sLicenseFeatures; KeyName: PAnsiChar; KeyValueName: PAnsiChar; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseRegistryKeyExW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; var LicenseFeatures: sLicenseFeatures; KeyName: PWideChar; KeyValueName: PWideChar; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseTextKeyW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; CountryId: Integer; Runtime: Integer; GlobalMinutes: Integer; BufferOut: PWideChar): Integer; stdcall;
function WLGenLicenseTextKey(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; CountryId: Integer; Runtime: Integer; GlobalMinutes: Integer; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseTextKeyEx(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; var LicenseFeatures: sLicenseFeatures; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseTextKeyExW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; var LicenseFeatures: sLicenseFeatures; BufferOut: PWideChar): Integer; stdcall;
function WLGenLicenseSmartKey(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseSmartKeyW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; NumDays: Integer; NumExec: Integer; NewDate: Pointer; BufferOut: PWideChar): Integer; stdcall;
function WLGenLicenseDynSmartKey(LicenseHash: PAnsiChar; UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; MachineID: PAnsiChar; var LicenseFeatures: sLicenseFeatures; BufferOut: PAnsiChar): Integer; stdcall;
function WLGenLicenseDynSmartKeyW(LicenseHash: PWideChar; UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; MachineID: PWideChar; var LicenseFeatures: sLicenseFeatures; BufferOut: PWideChar): Integer; stdcall;
function WLRegGetStatus(var ExtendedInfo: Integer): Integer; stdcall;
function WLTrialGetStatus(var ExtendedInfo: Integer): Integer; stdcall;
function WLTrialExtGetStatus(): Integer; stdcall;
function WLRegGetLicenseInfo(UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar): Boolean; stdcall;
function WLRegGetLicenseInfoW(UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar): Boolean; stdcall;
function WLTrialTotalDays(): Integer; stdcall;
function WLTrialTotalExecutions(): Integer; stdcall;
function WLTrialDaysLeft(): Integer; stdcall;
function WLTrialExecutionsLeft(): Integer; stdcall;
function WLTrialExpirationDate(pExpDate: Pointer): Integer; stdcall;
function WLTrialGlobalTimeLeft(): Integer; stdcall;
function WLTrialRuntimeLeft(): Integer; stdcall;
function WLTrialLockedCountry(): Integer; stdcall;
function WLRegDaysLeft(): Integer; stdcall;
function WLRegExecutionsLeft(): Integer; stdcall;
function WLRegExpirationDate(pExpDate: Pointer): Integer; stdcall;
function WLRegLicenseCreationDate(pCreationDate: Pointer): Boolean; stdcall;
function WLRegTotalExecutions(): Integer; stdcall;
function WLRegTotalDays(): Integer; stdcall;
function WLHardwareGetID(pHardId: PAnsiChar): Boolean; stdcall;
function WLHardwareCheckID(pHardId: PAnsiChar): Boolean; stdcall;
function WLRegSmartKeyCheck(UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegSmartKeyCheckW(UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; SmartKey: PWideChar): Boolean; stdcall;
function WLRegNormalKeyCheck(AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegNormalKeyCheckW(UnicodeKey: PWideChar): Boolean; stdcall;
function WLRegNormalKeyInstallToFile(AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegNormalKeyInstallToFileW(UnicodeKey: PWideChar): Boolean; stdcall;
function WLRegNormalKeyInstallToRegistry(AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegNormalKeyInstallToRegistryW(UnicodeKey: PWideChar): Boolean; stdcall;
function WLRegSmartKeyInstallToFile(UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegSmartKeyInstallToFileW(UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegSmartKeyInstallToRegistry(UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; AsciiKey: PAnsiChar): Boolean; stdcall;
function WLRegSmartKeyInstallToRegistryW(UserName: PWideChar; Organization: PWideChar; CustomData: PWideChar; AsciiKey: PAnsiChar): Boolean; stdcall;
function WLTrialCustomCounterInc(Value: Integer; CounterID: Integer): Integer; stdcall;
function WLTrialCustomCounterDec(Value: Integer; CounterID: Integer): Integer; stdcall;
function WLTrialCustomCounterSet(Value: Integer; CounterID: Integer): Integer; stdcall;
function WLTrialCustomCounter(CounterID: Integer): Integer; stdcall;
function WLRestartApplication(): Boolean; stdcall;
function WLRegLockedCountry(): Integer; stdcall;
function WLRegRuntimeLeft(): Integer; stdcall;
function WLRegGlobalTimeLeft(): Integer; stdcall;
function WLRegRemoveCurrentKey(): Boolean; stdcall;
function WLHardwareGetFormattedID(CharBlockSize: Integer; Uppercase: Integer; Buffer: PAnsiChar): Boolean; stdcall;
function WLPasswordCheck(UserName: PAnsiChar; Password: PAnsiChar): Boolean; stdcall;
function WLTrialExpireTrial(): Boolean; stdcall;
function WLStringDecrypt(pString: PAnsiChar): PAnsiChar; stdcall;
function WLStringDecryptW(pString: PWideChar): PAnsiChar; stdcall;
function GenUniqueLicenseHash(p1: PAnsiChar; p2: PAnsiChar; p3: PAnsiChar; p4: PAnsiChar; p5: PAnsiChar): Boolean; stdcall;
function ECCGenerateKeys(p1: PAnsiChar; p2: PAnsiChar; p3: PAnsiChar; p4: PAnsiChar): Boolean; stdcall;
procedure WLRegLicenseName(p1: PAnsiChar; p2: PAnsiChar; p3: PAnsiChar); stdcall;
function WLRestartApplicationArgs(pArgs: PAnsiChar): Boolean; stdcall;
function WLActGetInfo(var Custom1: Integer; var Custom2: Integer; var Custom3: Integer): Boolean; stdcall;
function WLActCheck(ActivationCode: PAnsiChar): Boolean; stdcall;
function WLActInstall(ActivationCode: PAnsiChar): Boolean; stdcall;
function WLActExpirationDate(pExpDate: Pointer): Boolean; stdcall;
function WLActDaysToActivate(): Integer; stdcall;
function WLActUninstall(): Boolean; stdcall;
function WLGetCurrentCountry(): Integer; stdcall;
// (CURRENTLY DISABLED) function WLRegGetLicenseHardwareID(pHardId:PAnsiChar):Boolean; stdcall;
function WLTrialExtGetLevel(): Integer; stdcall;
function WLProtectCheckDebugger(): Boolean; stdcall;
function WLTrialExtendExpiration(NumDays: Integer; NumExec: Integer; NewDate: Pointer; NumMinutes: Integer; TimeRuntime: Integer): Boolean; stdcall;
function WLTrialFirstRun(): Boolean; stdcall;
function WLRegFirstRun(): Boolean; stdcall;
function WLRegCheckMachineLocked(): Boolean; stdcall;
function WLRegDisableCurrentKey(DisableFlags: Integer): Boolean; stdcall;
procedure WLSplashHide(); stdcall;
procedure WLBufferCrypt(StartBuffer: Pointer; LengthBuffer: Integer; Password: PAnsiChar); stdcall;
procedure WLBufferDecrypt(StartBuffer: Pointer; LengthBuffer: Integer; Password: PAnsiChar); stdcall;
function WLRegSmartKeyInstallToFileInFolder(UserName: PAnsiChar; Organization: PAnsiChar; CustomData: PAnsiChar; AsciiKey: PAnsiChar; FilePath: PAnsiChar): Boolean; stdcall;
function WLTrialDateDaysLeft(): Integer; stdcall;
function WLRegDateDaysLeft(): Integer; stdcall;
function WLRegGetDynSmartKey(SmartKey: PAnsiChar): Boolean; stdcall;
function WLRegDisableKeyCurrentInstance(): Boolean; stdcall;
function WLHardwareRuntimeCheckU3(): Boolean; stdcall;
procedure WLGetVersion(Buffer: PAnsiChar); stdcall;
function WLRegNetInstancesGet(): Integer; stdcall;
function WLRegNetInstancesMax(): Integer; stdcall;
procedure WLGetProtectionDate(var pProtectionDate: SYSTEMTIME); stdcall;
function WLProtectCheckCodeIntegrity(): Boolean; stdcall;
function WLHardwareGetIdType(): Integer; stdcall;
function WLTrialStringRead(StringName: PAnsiChar; StringValue: PAnsiChar): Boolean; stdcall;
function WLTrialStringWrite(StringName: PAnsiChar; StringValue: PAnsiChar): Boolean; stdcall;
function WLTrialStringReadW(StringName: PWideChar; StringValue: PWideChar): Boolean; stdcall;
function WLTrialStringWriteW(StringName: PWideChar; StringValue: PWideChar): Boolean; stdcall;
function WLTrialDebugCheck(): Boolean; stdcall;
function WLRegExpirationTimestamp(var lpFileTime: FILETIME): Boolean; stdcall;
function WLTrialExpirationTimestamp(var lpFileTime: FILETIME): Boolean; stdcall;
function WLRegGetLicenseRestrictions(): Integer; stdcall;

implementation

const
  WinlicenseDLL = 'WinlicenseSDK.DLL';

function WLStringDecrypt; external WinlicenseDLL Name 'WLStringDecrypt';
function WLStringDecryptW; external WinlicenseDLL Name 'WLStringDecryptW';
function WLGenTrialExtensionFileKey; external WinlicenseDLL Name 'WLGenTrialExtensionFileKey';
function WLGenTrialExtensionRegistryKey; external WinlicenseDLL Name 'WLGenTrialExtensionRegistryKey';
function WLGenPassword; external WinlicenseDLL Name 'WLGenPassword';
function WLGenLicenseFileKey; external WinlicenseDLL Name 'WLGenLicenseFileKey';
function WLGenLicenseFileKeyW; external WinlicenseDLL Name 'WLGenLicenseFileKeyW';
function WLGenLicenseFileKeyEx; external WinlicenseDLL Name 'WLGenLicenseFileKeyEx';
function WLGenLicenseRegistryKeyEx; external WinlicenseDLL Name 'WLGenLicenseRegistryKeyEx';
function WLGenLicenseTextKeyEx; external WinlicenseDLL Name 'WLGenLicenseTextKeyEx';
function WLGenLicenseRegistryKey; external WinlicenseDLL Name 'WLGenLicenseRegistryKey';
function WLGenLicenseRegistryKeyW; external WinlicenseDLL Name 'WLGenLicenseRegistryKeyW';
function WLGenLicenseTextKey; external WinlicenseDLL Name 'WLGenLicenseTextKey';
function WLGenLicenseTextKeyW; external WinlicenseDLL Name 'WLGenLicenseTextKey';
function WLGenLicenseSmartKey; external WinlicenseDLL Name 'WLGenLicenseSmartKey';
function WLGenLicenseSmartKeyW; external WinlicenseDLL Name 'WLGenLicenseSmartKeyW';
function WLRegGetStatus; external WinlicenseDLL Name 'WLRegGetStatus';
function WLTrialGetStatus; external WinlicenseDLL Name 'WLTrialGetStatus';
function WLTrialExtGetStatus; external WinlicenseDLL Name 'WLTrialExtGetStatus';
function WLRegGetLicenseInfo; external WinlicenseDLL Name 'WLRegGetLicenseInfo';
function WLRegGetLicenseInfoW; external WinlicenseDLL Name 'WLRegGetLicenseInfoW';
function WLTrialTotalDays; external WinlicenseDLL Name 'WLTrialTotalDays';
function WLTrialTotalExecutions; external WinlicenseDLL Name 'WLTrialTotalExecutions';
function WLTrialDaysLeft; external WinlicenseDLL Name 'WLTrialDaysLeft';
function WLTrialExecutionsLeft; external WinlicenseDLL Name 'WLTrialExecutionsLeft';
function WLTrialExpirationDate; external WinlicenseDLL Name 'WLTrialExpirationDate';
function WLTrialGlobalTimeLeft; external WinlicenseDLL Name 'WLTrialGlobalTimeLeft';
function WLTrialRuntimeLeft; external WinlicenseDLL Name 'WLTrialRuntimeLeft';
function WLTrialLockedCountry; external WinlicenseDLL Name 'WLTrialLockedCountry';
function WLRegDaysLeft; external WinlicenseDLL Name 'WLRegDaysLeft';
function WLRegExecutionsLeft; external WinlicenseDLL Name 'WLRegExecutionsLeft';
function WLRegExpirationDate; external WinlicenseDLL Name 'WLRegExpirationDate';
function WLRegLicenseCreationDate; external WinlicenseDLL Name 'WLRegLicenseCreationDate';
function WLRegTotalExecutions; external WinlicenseDLL Name 'WLRegTotalExecutions';
function WLRegTotalDays; external WinlicenseDLL Name 'WLRegTotalDays';
function WLHardwareGetID; external WinlicenseDLL Name 'WLHardwareGetID';
function WLHardwareCheckID; external WinlicenseDLL Name 'WLHardwareCheckID';
function WLRegSmartKeyCheck; external WinlicenseDLL Name 'WLRegSmartKeyCheck';
function WLRegSmartKeyCheckW; external WinlicenseDLL Name 'WLRegSmartKeyCheckW';
function WLRegNormalKeyCheck; external WinlicenseDLL Name 'WLRegNormalKeyCheck';
function WLRegNormalKeyCheckW; external WinlicenseDLL Name 'WLRegNormalKeyCheckW';
function WLRegNormalKeyInstallToFile; external WinlicenseDLL Name 'WLRegNormalKeyInstallToFile';
function WLRegNormalKeyInstallToFileW; external WinlicenseDLL Name 'WLRegNormalKeyInstallToFileW';
function WLRegNormalKeyInstallToRegistry; external WinlicenseDLL Name 'WLRegNormalKeyInstallToRegistry';
function WLRegNormalKeyInstallToRegistryW; external WinlicenseDLL Name 'WLRegNormalKeyInstallToRegistryW';
function WLRegSmartKeyInstallToFile; external WinlicenseDLL Name 'WLRegSmartKeyInstallToFile';
function WLRegSmartKeyInstallToFileInFolder; external WinlicenseDLL Name 'WLRegSmartKeyInstallToFileInFolder';
function WLRegSmartKeyInstallToFileW; external WinlicenseDLL Name 'WLRegSmartKeyInstallToFileW';
function WLRegSmartKeyInstallToRegistry; external WinlicenseDLL Name 'WLRegSmartKeyInstallToRegistry';
function WLRegSmartKeyInstallToRegistryW; external WinlicenseDLL Name 'WLRegSmartKeyInstallToRegistryW';
function WLTrialCustomCounterInc; external WinlicenseDLL Name 'WLTrialCustomCounterInc';
function WLTrialCustomCounterDec; external WinlicenseDLL Name 'WLTrialCustomCounterDec';
function WLTrialCustomCounterSet; external WinlicenseDLL Name 'WLTrialCustomCounterSet';
function WLTrialCustomCounter; external WinlicenseDLL Name 'WLTrialCustomCounter';
function WLRestartApplication; external WinlicenseDLL Name 'WLRestartApplication';
function WLRegLockedCountry; external WinlicenseDLL Name 'WLRegLockedCountry';
function WLRegRuntimeLeft; external WinlicenseDLL Name 'WLRegRuntimeLeft';
function WLRegGlobalTimeLeft; external WinlicenseDLL Name 'WLRegGlobalTimeLeft';
function WLRegRemoveCurrentKey; external WinlicenseDLL Name 'WLRegRemoveCurrentKey';
function WLHardwareGetFormattedID; external WinlicenseDLL Name 'WLHardwareGetFormattedID';
function WLPasswordCheck; external WinlicenseDLL Name 'WLPasswordCheck';
function WLTrialExpireTrial; external WinlicenseDLL Name 'WLTrialExpireTrial';
function GenUniqueLicenseHash; external WinlicenseDLL Name 'GenUniqueLicenseHash';
function ECCGenerateKeys; external WinlicenseDLL Name 'ECCGenerateKeys';
procedure WLRegLicenseName; external WinlicenseDLL Name 'WLRegLicenseName';
function WLRestartApplicationArgs; external WinlicenseDLL Name 'WLRestartApplicationArgs';
function WLActGetInfo; external WinlicenseDLL Name 'WLActGetInfo';
function WLActCheck; external WinlicenseDLL Name 'WLActCheck';
function WLActInstall; external WinlicenseDLL Name 'WLActInstall';
function WLActExpirationDate; external WinlicenseDLL Name 'WLActExpirationDate';
function WLActDaysToActivate; external WinlicenseDLL Name 'WLActDaysToActivate';
function WLActUninstall; external WinlicenseDLL Name 'WLActUninstall';
function WLGetCurrentCountry; external WinlicenseDLL Name 'WLGetCurrentCountry';
// (CURRENTLY DISABLED) function WLRegGetLicenseHardwareID; external WinlicenseDLL name 'WLRegGetLicenseHardwareID';
function WLTrialExtGetLevel; external WinlicenseDLL Name 'WLTrialExtGetLevel';
function WLProtectCheckDebugger; external WinlicenseDLL Name 'WLProtectCheckDebugger';
function WLTrialExtendExpiration; external WinlicenseDLL Name 'WLTrialExtendExpiration';
function WLTrialFirstRun; external WinlicenseDLL Name 'WLTrialFirstRun';
function WLRegFirstRun; external WinlicenseDLL Name 'WLRegFirstRun';
function WLRegCheckMachineLocked; external WinlicenseDLL Name 'WLRegCheckMachineLocked';
function WLRegDisableCurrentKey; external WinlicenseDLL Name 'WLRegDisableCurrentKey';
procedure WLSplashHide; external WinlicenseDLL Name 'WLSplashHide';
procedure WLBufferCrypt; external WinlicenseDLL Name 'WLBufferCrypt';
procedure WLBufferDecrypt; external WinlicenseDLL Name 'WLBufferDecrypt';
function WLTrialDateDaysLeft; external WinlicenseDLL Name 'WLTrialDateDaysLeft';
function WLRegDateDaysLeft; external WinlicenseDLL Name 'WLRegDateDaysLeft';
function WLGenLicenseFileKeyExW; external WinlicenseDLL Name 'WLGenLicenseFileKeyExW';
function WLGenLicenseRegistryKeyExW; external WinlicenseDLL Name 'WLGenLicenseRegistryKeyExW';
function WLGenLicenseTextKeyExW; external WinlicenseDLL Name 'WLGenLicenseTextKeyExW';
function WLGenLicenseDynSmartKey; external WinlicenseDLL Name 'WLGenLicenseDynSmartKey';
function WLGenLicenseDynSmartKeyW; external WinlicenseDLL Name 'WLGenLicenseDynSmartKeyW';
function WLRegGetDynSmartKey; external WinlicenseDLL Name 'WLRegGetDynSmartKey';
function WLRegDisableKeyCurrentInstance; external WinlicenseDLL Name 'WLRegDisableKeyCurrentInstance';
function WLHardwareRuntimeCheckU3; external WinlicenseDLL Name 'WLHardwareRuntimeCheckU3';
procedure WLGetVersion; external WinlicenseDLL Name 'WLGetVersion';
function WLRegNetInstancesGet; external WinlicenseDLL Name 'WLRegNetInstancesGet';
function WLRegNetInstancesMax; external WinlicenseDLL Name 'WLRegNetInstancesMax';
procedure WLGetProtectionDate; external WinlicenseDLL Name 'WLGetProtectionDate';
function WLProtectCheckCodeIntegrity; external WinlicenseDLL Name 'WLProtectCheckCodeIntegrity';
function WLHardwareGetIdType; external WinlicenseDLL Name 'WLHardwareGetIdType';
function WLTrialStringRead; external WinlicenseDLL Name 'WLTrialStringRead';
function WLTrialStringReadW; external WinlicenseDLL Name 'WLTrialStringReadW';
function WLTrialStringWrite; external WinlicenseDLL Name 'WLTrialStringWrite';
function WLTrialStringWriteW; external WinlicenseDLL Name 'WLTrialStringWriteW';
function WLTrialDebugCheck; external WinlicenseDLL Name 'WLTrialDebugCheck';
function WLRegExpirationTimestamp; external WinlicenseDLL Name 'WLRegExpirationTimestamp';
function WLTrialExpirationTimestamp; external WinlicenseDLL Name 'WLTrialExpirationTimestamp';
function WLRegGetLicenseRestrictions; external WinlicenseDLL Name 'WLRegGetLicenseRestrictions';

end.
