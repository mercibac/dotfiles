Add-Type @"
using System;
using System.Text;
using System.Runtime.InteropServices;
public class WinAPI {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int GetClassName(IntPtr hWnd, StringBuilder lpClassName, int nMaxCount);
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")]
    public static extern uint GetWindowThreadProcessId(IntPtr hWnd, out uint lpdwProcessId);
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpClassName, int nMaxCount);
}
"@

# Run this script like this: start-sleep -seconds 3;

# Get handle of the active window
$hWnd = [WinAPI]::GetForegroundWindow()

# Get class name of the window
$sb = New-Object System.Text.StringBuilder 256
[WinAPI]::GetClassName($hWnd, $sb, $sb.Capacity) | Out-Null
$windowClass = $sb.ToString()

$sb.clear() | out-null
[WinAPI]::GetWindowText($hWnd, $sb, $sb.Capacity) | Out-Null
$windowText = $sb.ToString()

# Get process ID of the window owner
$processId = 0
[WinAPI]::GetWindowThreadProcessId($hWnd, [ref]$processId) | Out-Null

# Get process name
$process = Get-Process -Id $processId -ErrorAction SilentlyContinue
$processName = if ($process) { $process.ProcessName } else { "Unknown" }

# Output results
[PSCustomObject]@{
    "WindowClass" = $windowClass
    "ProcessID"   = $processId
    "ProcessName" = $processName
    "Title"       = $windowText
}
