# Chat with Azure Docs - Certification Q&A Agent

[![Azure OpenAI](https://img.shields.io/badge/Azure-OpenAI-blue.svg)](https://azure.microsoft.com/en-us/products/ai-services/openai-service)
[![AI Search](https://img.shields.io/badge/Azure-AI_Search-0089D6.svg)](https://azure.microsoft.com/en-us/products/ai-services/ai-search)

An AI-powered RAG application leveraging Azure OpenAI and Azure AI Search to answer technical questions about Azure certifications. Automatically deployed infrastructure with full-stack implementation.

![Demo Screenshot](./docs/chat.png) <!-- Add actual screenshot path -->

## Features
- **AI-Powered Q&A**: GPT-4 answers with Azure certification exam context
- **Semantic Search**: Azure AI Search indexes technical documentation
- **Infra Deployment**: Terraform-provisioned Azure infrastructure
- **Secure API**: Managed identities for Azure service authentication

## Architecture
```mermaid
%%{init: {'theme':'neutral'}}%%
graph TD
    A[User] -->|Ask question| B(Frontend UI)
    B <-->|API call| C[Backend API]
    C -->|Search| D[Azure AI Search Index]
    C <-->|Generate answer| E[Azure OpenAI]
    F -->|Generate Embeddings| E
    F[Azure Search Indexer] -->|Populate data| D
    F -->|Get Data| G[Blob Storage]
    
    style A fill:#f0f0f0,stroke:#333
    style B fill:#4CAF50,color:white
    style C fill:#2196F3,color:white
    style D fill:#9C27B0,color:white
    style E fill:#007FFF,color:white
    style F fill:#673AB7,color:white

```

## 🚀 Quick Start

### Prerequisites
- Azure account with valid subscription
- Terraform v1.5+
- Java 17+, Maven
- Node.js 18+

### Setup Steps

1. Clone Repository
    ```bash
    git clone https://github.com/gmezan/azure-openai-search-rag.git
    cd azure-openai-search-rag
    ````

1. Deploy Azure Infrastructure

    ```bash
    cd infra/
    terraform init
    terraform apply
    ````


1. Configure & Start Backend

    ```bash
    # Set environment variables (use .env file or export)
    export AZURE_OPENAI_KEY="<from-terraform-output-or-portal>"
    export AZURE_OPENAI_ENDPOINT="<from-terraform-output-or-portal>"
    export AZURE_SEARCH_ENDPOINT="<from-terraform-output-or-portal>"
    export AZURE_SEARCH_KEY="<from-terraform-output-or-portal>"
    export AZURE_STORAGE_CS="<from-terraform-output-or-portal>"

    mvn spring-boot:run
    ````

1. Launch Frontend
    ```bash
    cd frontend/
    npm install
    npm run dev
    ````

1. Start Chatting

    Access frontend at http://localhost:5173 and ask questions like: "Explain Azure Virtual Network peering requirements for AZ-104"
   

https://github.com/user-attachments/assets/c9db6367-1e19-444e-b6e1-a3805ed72f2c




