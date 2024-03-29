*. 2019_10_18   New: Convert-HotstringsToMappedFunctions.ahk
*. 2019_10_18   Ren: Set-ExplorerFileSettings.ahk -> Set-ExplorerPreferences.ahk
*. 2019_10_22   Mod: Toggle-NppPreferences.ahk
*. 2019_10_22   New: Disable-MsWordProofing.ahk
*. 2019_10_23   New: Compare-Directories.ps1
*. 2019_10_23   New: Guard-Session.ps1
*. 2019_10_23   Mod: Hotstrings\Convert-HotstringsToMappedFunctions.ahk
*. 2019_10_24   Mod: Convert-HotstringsToMappedFunctions.ahk
*. 2019_10_30   Ren: Compare-Directories.ps1 -> Compare-ChildItem.ps1
*. 2019_10_30   Mod: Hotstrings\Math.ahk
*. 2019_10_30   Bug: Hotstrings\Math_Map.ahk

    Des: Does not produce any of the unicode symbols in the replacer hotstrings
    
*. 2019_11_06   Mod: Disable-MsWordProofing.ahk

    Bug/typo fix:
    
        `__SUBWINDOW_TIMOUT` -> `__SUBWINDOW_TIMEOUT`
        
*. 2019_11_06   Mod: Set-NppPreferences.ahk

    Bug/typo fix:
    
        `__SUBWINDOW_TIMOUT` -> `__SUBWINDOW_TIMEOUT`
        
*. 2019_11_06   Bug: Run-TopDriveInExplorer.ahk

    Des: Fails to identify flash drive
    Fix:
    
        Default set to FIXED drives
        Flash drive is REMOVABLE type
        
*. 2019_11_06   Mod: Run-TopDriveInExplorer.ahk

    '--type' parameter is now multivalued:
    
        '--type=fixed,removable'
        
    `__HELP_MSG`: Replaced multiline concatentation with multiline string
    
*. 2019_11_06   Mod: Convert-HotstringsToMappedFunctions.ahk

    Description:
    
        Replaced all instances of
        
            ``
            Loop %0%
            {
            ``
            
        with
        
            `` for index, param in A_Args {
            
    Note: Untested
    
*. 2019_11_06   Mod: Compare-ChildItem.ps1

    Bug fix on Line 23:
    
        `` if ($output.Count -gt 0) {
        ->
        `` if ($output.Count -eq 0) {
        
    Added '-Full' switch to differentiate terse and verbose output
    
*. 2019_11_13   New: README.md
*. 2019_11_14   Mod: Set-ExplorerPreferences.ahk

    Bug fix on Line 26:
    
        ``return`` -> ``break``
        
*. 2019_11_14   New: package.json
*. 2019_11_14   Mod: Convert-HotstringsToMappedFunctions.ahk

    Bug fix on Line 78:
    
        ``
        for index, script_param in A_Args {
            if (StrLen(param) > 0) {
        ``
        ->
        ``
        for index, param in A_Args {
            if (StrLen(param) > 0) {
        ``
        
*. 2019_11_19   Mod: Hotstrings\Hotstrings.ahk

    Added ';rem;' hotstring:
    
        Line 621:
        
            ``
            ; Replace with the device ID of the first removable disk drive
            :*:;rem;::
                Monitor.Run("GetLogicalDiskId", 2, 1)
                return
            ``
            
*. 2019_11_20   Mod: Hotstrings\Hotstrings.ahk

    Bug fix on Line 88:
    
        Added ``global`` so `%__date_format%` expansion resolves correctly
        
*. 2019_11_20   New: .gitignore
*. 2019_11_23   Mod: Hotstrings\Hotstrings.ahk

    Added new documentation to hotstrings
    Added "Hotstring:" and "Hotkey:" key phrases to help identify help info
    Changed ";last;" hotstring to use the clipboard instead of sending keystrokes
    
*. 2019_11_23   Mod: Convert-HotstringsToMappedFunctions.ahk

    Redesigned FileIterator class to use File objects instead of `FileReadLine` subroutine
    
*. 2019_11_24   Mod: Hotstrings\Monitor.ahk

    Bug fix on Line 113:
    
        ``Monitor.SendToClipboard(output)`` -> ``Monitor.SendToClipboard(str)``
        
    Added `Monitor.SendUnicode` method
    
*. 2019_11_24   Mod: Hotstrings\Math.ahk

    Added "Hotstring:" key phrases to help identify help info
    Bug fix:
    
        Replaced all instances of `Monitor.Send` with `Monitor.SendUnicode`
        