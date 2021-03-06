;=== Test Cases/Test Data ===
; UseCase 1:		Configure Tx message
; Critical (C):		Y
; TestCase No.:		TS_Tx_004
; Test Cases:		Tx messages
; Test Strategy:	Black Box
; Test Data:		-
; === Test Procedure ===

;~   _launchApp()																			;launching the app
 WinActivate($mWin)
Sleep(1000)

;~ _loadConfig("TestcaseTx7")
 sleep(500)


;To delete all message block
$timemsglisthWnd=ControlGetHandle ($mWin,"",$msglistInst)				;handler for tx wimdow
    $msg1=_GUICtrlListView_GetItemCount($timemsglisthWnd)										;To get the listview count
 	ConsoleWrite("$msg1 : " &$msg1 &@CRLF)

For  $i = 0 To $msg1
																						;~  TO delete all the message block
 ControlCommand($mWin,"",$delbutmsg,"IsEnabled")
		; click on delete button
		ControlClick($mWin,"",$delbutmsg)

		;click on confirmation button for deletion
		ControlClick($mWin,"",$yesbtndel)
	Next

if (ControlCommand($mWin,"",$timedelayBtwblckCtrlID,"IsChecked")=0) then						;to uncheck the time delay between message block
	ControlCommand($mWin,"",$timedelayBtwblckCtrlID,"Check")

EndIf

sleep(1000)

 ControlClick($mWin,"",$AddblckctrlID)									;Adding the Block
Sleep(500)

 ControlSetText($mWin,"",$msgnamesCtrlID,11)   							; Enter Non Db msg 11
  ControlClick($mWin, "",$addmsgCtrlID)									;~ ; Click on Add message button

ControlSetText($mWin,"",$msgnamesCtrlID,12)   							; Enter Non Db msg 12
ControlClick($mWin, "",$addmsgCtrlID)									;~ ; Click on Add message button

 ControlClick($mWin,"",$AddblckctrlID)									;Adding the Block
Sleep(500)

 ; Enabling Key Trigger
  If (ControlCommand($mWin,"",$keyctrlID,"IsChecked")=0) Then
	ControlCommand($mWin,"",$keyctrlID,"Check")
	sleep(500)
EndIf

ControlSend($mWin,"",$keyeditCtrlID,"b")

 ControlSetText($mWin,"",$msgnamesCtrlID,21)   							; Enter Non Db msg 21
  ControlClick($mWin, "",$addmsgCtrlID)									;~ ; Click on Add message button

ControlSetText($mWin,"",$msgnamesCtrlID,22)   							; Enter Non Db msg 22
ControlClick($mWin, "",$addmsgCtrlID)									;~ ; Click on Add message button


$cntToolhWd=ControlGetHandle($mWin,"",128)								; Get handle of tollbar
$conn=_GUICtrlToolbar_ClickIndex($cntToolhWd,4)							; Click on 'Connect' icon
sleep(500)

	WinMenuSelectItem($mWin,"",$fuctions,$transmit,$normalbock)						; Click on 'Transmit normal blocks' icon for transmiting
	sleep(3000)

    Send("{b}")

 $cntToolhWd=ControlGetHandle($mWin,"",128)												; Get handle of toolbar
	$conn=_GUICtrlToolbar_ClickIndex($cntToolhWd,4)										; Click on 'DisConnect' icon
	sleep(1000)

$timhWnd=ControlGetHandle ($mWin,"",$msgwin)			;handler for tx wimdow
$msgfrth1=_GUICtrlListView_GetItemTextString($timhWnd, 0)									;selecting 1st elment in message window
ConsoleWrite("$msgfrth1:" &$msgfrth1 & @CRLF)

$sTimefrth1=StringSplit($msgfrth1,"|")														;splitting 1st elements into column
ConsoleWrite("$sTimefrth1:" &$sTimefrth1[7] & @CRLF)														;Time of msg 1st sent

$timhWnd1=ControlGetHandle ($mWin,"",$msgwin)								;handler for tx wimdow o
$msgfrth2=_GUICtrlListView_GetItemTextString($timhWnd1, 1)									;selecting 2nd elment in message window
ConsoleWrite("$msgfrth2:" &$msgfrth2 & @CRLF)

$sTimefrth2=StringSplit($msgfrth2,"|")														;splitting 1st elements into column
ConsoleWrite("$sTimefrth2:" &$sTimefrth2[7] & @CRLF)									;Time of msg 1st sent

$timhWnd=ControlGetHandle ($mWin,"",$msgwin)								;handler for tx wimdow
$msgfrth3=_GUICtrlListView_GetItemTextString($timhWnd, 2)									;selecting 3rd elment in message window
ConsoleWrite("$msgfrth3:" &$msgfrth3 & @CRLF)

$sTimefrth3=StringSplit($msgfrth3,"|")														;splitting 1st elements into column
ConsoleWrite("$sTimefrth3:" &$sTimefrth3[7] & @CRLF)														;Time of msg 1st sent

$timhWnd1=ControlGetHandle ($mWin,"",$msgwin)								;handler for tx wimdow
$msgfrth4=_GUICtrlListView_GetItemTextString($timhWnd1, 3)									;selecting 4th elment in message window
ConsoleWrite("$msgfrth4:" &$msgfrth4 & @CRLF)

$sTimefrth4=StringSplit($msgfrth4,"|")														;splitting 1st elements into column
ConsoleWrite("$sTimefrth4:" &$sTimefrth4[7] & @CRLF)									;Time of msg 1st sent

If ($sTimefrth1[7]=11 And $sTimefrth2[7]=12 And $sTimefrth3[7]=21 And $sTimefrth4[7]=22 ) Then

	_ExcelWriteCell($oExcel,"pass",9,11)

    Else
	  _ExcelWriteCell($oExcel,"Fail",9,11)

EndIf