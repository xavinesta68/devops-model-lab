#!/bin/bash

# Set environment variables if needed (like API keys, secrets, etc.)
export NODE_ENV=staging

echo "Deploying to Staging..."

# Navigate to the project directory (optional)
cd /home/snucse/devops-model-lab || exit

# Pull the latest code from the 'staging' branch
git checkout staging || exit
git pull origin staging || exit

# Install any new dependencies (optional)
npm install || exit

# Run any tests (optional but recommended)
npm run test || exit

# Compile the project (e.g., with Babel if needed)
npm run compile || exit

# Start the application (you can adjust this if you use PM2, Docker, etc.)
npm run start || exit

# Success message
echo "Deployment to Staging completed successfully!"

# Optional: Log the timestamp of deployment
echo "Deployment timestamp: $(date)" >> deployment.log

