# Path to the local file_roots (a local folder where Salt is going to read the test files).
$statesPath = "c:\salt\srv\states"
if (-not (Test-Path $statesPath)) {
    New-Item -Path $statesPath -ItemType Directory
}

# Create a 'my_state.sls' file in the 'states' directory.
$myStateSlsContent = @"
test_print:
  cmd.run:
    - name: "echo hello world"
"@

$myStateSlsPath = Join-Path -Path $statesPath -ChildPath "my_state.sls"
Set-Content -Path $myStateSlsPath -Value $myStateSlsContent -Force

Restart-Service salt-minion
