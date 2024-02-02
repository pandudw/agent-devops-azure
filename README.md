# Self-Hosted Agent DevOps for Azure Pipeline

1. Build Docker image
```
docker build --tag "agent:azure-pipeline" -f Dockerfile .
```
2. Run Docker container 
```
docker run -e AZP_URL="<Azure DevOps instance>" -e AZP_TOKEN="<Personal Access Token>" -e AZP_POOL="<Agent Pool Name>" -e AZP_AGENT_NAME="Docker Agent - Linux" --name "agent-devops" agent:azure-pipeline
```
