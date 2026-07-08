# Load environment variables from .env file
if (Test-Path ".env") {
    Write-Host "Loading environment variables from .env..." -ForegroundColor Green
    Get-Content .env | ForEach-Object {
        $line = $_.Trim()
        if ($line -and -not $line.StartsWith("#") -and $line.Contains("=")) {
            $index = $line.IndexOf("=")
            $name = $line.Substring(0, $index).Trim()
            $value = $line.Substring($index + 1).Trim()
            
            # Strip outer single or double quotes
            if (($value.StartsWith('"') -and $value.EndsWith('"')) -or ($value.StartsWith("'") -and $value.EndsWith("'"))) {
                $value = $value.Substring(1, $value.Length - 2)
            }
            
            [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
        }
    }
} else {
    Write-Warning ".env file not found! Using default environment variables."
}

Write-Host "Starting Spring Boot application with 'dev' profile..." -ForegroundColor Green
mvn spring-boot:run "-Dspring-boot.run.profiles=dev"
