;*********************************************
;        Auto-Generated With py2Nsis
;*********************************************

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME %(name)s
!define PRODUCT_VERSION %(version)s
!define PRODUCT_PUBLISHER %(company_name)s
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\%(name)s.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
#!define MUI_ICON "Sistema Expedicion de Boletos\images\bus.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!define MUI_WELCOMEPAGE_TITLE_3LINES
!insertmacro MUI_PAGE_WELCOME
; License page
;!insertmacro MUI_PAGE_LICENSE "..\..\..\ruta\ala\licencia\TuLicenciaDeSoftware.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_TITLE_3LINES

!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Spanish"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "installer.exe"
InstallDir "$PROGRAMFILES\%(name)s"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails hide
ShowUnInstDetails hide

Section "Principal" SEC01
	
  SetOutPath "$INSTDIR"

  %(files)s
SectionEnd

Section -AdditionalIcons
;  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\%(main)s.lnk" "$INSTDIR\%(main)s.exe"
  CreateShortCut "$SMPROGRAMS\%(name)s\Desinstalar.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\%(name)s.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\%(name)s.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "La desinstalacion de $(^Name) finalizo satisfactoriamente."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Esta completamente seguro que desea desinstalar $(^Name) junto con todos sus componentes?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  %(delete_files)s

  Delete "$SMPROGRAMS\%(name)s\Desinstalar.lnk"
;  Delete "$SMPROGRAMS\Sistema de Expedicion de Boletos\Sitio Web MSA.lnk"
  Delete "$DESKTOP\%(main)s.lnk"
  Delete "$SMPROGRAMS\%(name)s.lnk"


  RMDir "$SMPROGRAMS\%(name)s"
  RMDir "$INSTDIR\docs\images"
  RMDir "$INSTDIR\docs"
  RMDir "$INSTDIR\images"
  RMDir "$INSTDIR\lib"
  RMDir "$INSTDIR\database"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd