# tasks.ps1 - PowerShell version of your Makefile

# Install the package
function Install {
    Write-Host "Running pip install..."
    pip install -e .
}

# Train the model
function Train {
    Write-Host "Training the model..."
    housing-train --config configs/train.yaml
}

# Serve the model via Uvicorn
function Serve {
    Write-Host "Starting the server..."
    uvicorn housing_model.service:app --host 0.0.0.0 --port 8000
}

# Run tests
function Test {
    Write-Host "Running tests..."
    pytest -q
}

# Build Docker image
function DockerBuild {
    Write-Host "Building Docker image..."
    docker build -t housing-model:latest .
}

# Run Docker container
function DockerRun {
    Write-Host "Running Docker container..."
    docker run --rm -p 8000:8000 housing-model:latest
}

Write-Host "PowerShell tasks loaded. Available commands: Install, Train, Serve, Test, DockerBuild, DockerRun"
