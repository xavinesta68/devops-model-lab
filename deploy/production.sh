#!/bin/bash

# Set environment variables for production (e.g., production DB, API keys)
export NODE_ENV=production

echo "Deploying to Production..."

# Navigate to the project directory (optional)
cd /home/snucse/devops-model-lab || exit

# Checkout the 'main' branch (or 'master' if that's your production branch name)
git checkout main || exit
git pull origin main || exit

# Install any new dependencies (optional)
npm install || exit

# Run tests to ensure everything works correctly before deployment (optional)
npm run test || exit

# Compile the project if necessary
npm run compile || exit

# Deploy the app to production
# This may involve a process manager like PM2, Docker, Kubernetes, etc.
# If using PM2:
pm2 restart app || exit

# If using Docker, you could do something like:
# docker-compose down && docker-compose up -d || exit

# If using Kubernetes, you might do:
# kubectl apply -f k8s/deployment.yaml || exit

# Success message
echo "Deployment to Production completed successfully!"

# Optional: Log the timestamp of deployment
echo "Deployment timestamp: $(date)" >> deployment.log

