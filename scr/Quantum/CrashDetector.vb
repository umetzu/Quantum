Imports System.Runtime.InteropServices
Imports System.Text

Public Class CrashDetector

    Public Shared Sub ExitIfCrashed()
        If ExistsCrashWindow() Then
            ForceKillProcess()
            StartProcess()
        End If
    End Sub

    Private Shared Function ExistsCrashWindow() As Boolean
        For Each window As KeyValuePair(Of IntPtr, String) In GetOpenWindows()
            Dim title As String = window.Value

            If title = "Crash info" Then
                Return True
            End If
        Next

        Return False
    End Function

    Private Shared Sub StartProcess()
        Dim p As New Process()
        p.StartInfo.FileName = "C:\Program Files\qBittorrent\qbittorrent.exe"
        p.Start()

    End Sub

    Private Shared Sub ForceKillProcess()
        Dim processes As Process() = Process.GetProcessesByName("qbittorrent")
        For Each process In processes
            process.Kill()
            process.WaitForExit()
        Next
    End Sub


    ''' <summary>Returns a dictionary that contains the handle and title of all the open windows.</summary>
    ''' <returns>A dictionary that contains the handle and title of all the open windows.</returns>
    Public Shared Function GetOpenWindows() As IDictionary(Of IntPtr, String)
        Dim shellWindow As IntPtr = GetShellWindow()
        Dim windows As New Dictionary(Of IntPtr, String)()

        EnumWindows(Function(hWnd, lParam)
                        If hWnd = shellWindow Then Return True
                        If Not IsWindowVisible(hWnd) Then Return True

                        Dim length As Integer = GetWindowTextLength(hWnd)
                        If length = 0 Then Return True

                        Dim builder As New StringBuilder(length)
                        Dim unused = GetWindowText(hWnd, builder, length + 1)

                        windows(hWnd) = builder.ToString()
                        Return True
                    End Function, 0)

        Return windows
    End Function

    Private Delegate Function EnumWindowsProc(hWnd As IntPtr, lParam As Integer) As Boolean

    <DllImport("USER32.DLL")>
    Private Shared Function EnumWindows(enumFunc As EnumWindowsProc, lParam As Integer) As Boolean
    End Function

    <DllImport("USER32.DLL", BestFitMapping:=False)>
    Private Shared Function GetWindowText(hWnd As IntPtr, lpString As StringBuilder, nMaxCount As Integer) As Integer
    End Function

    <DllImport("USER32.DLL")>
    Private Shared Function GetWindowTextLength(hWnd As IntPtr) As Integer
    End Function

    <DllImport("USER32.DLL")>
    Private Shared Function IsWindowVisible(hWnd As IntPtr) As Boolean
    End Function

    <DllImport("USER32.DLL")>
    Private Shared Function GetShellWindow() As IntPtr
    End Function

End Class
