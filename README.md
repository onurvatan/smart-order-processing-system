# 🌐 Real-World Azure Cloud Project: Smart Order Processing System

This project simulates a scalable, secure order processing platform (e.g., for an online store or IoT orders) that integrates event-driven architecture with APIs, serverless computing, caching, and secure secrets management.

---

## 🔧 Project Summary

Customers place orders via a public API. These orders are:

- Validated and queued using **Event Hubs** and **Service Bus**
- Processed asynchronously by **Azure Functions**
- Stored in **Cosmos DB**
- Audited using **Event Grid**
- Served to users via a secure **API Gateway**
- Deployed using **Containers** and **App Services**

---

## 🧩 Azure Services Breakdown

| **Azure Service**         | **Usage in Project**                                                                       |
| ------------------------- | ------------------------------------------------------------------------------------------ |
| **Container Registry**    | Stores custom-built Docker images for the Order Processing microservice                    |
| **Container Instances**   | Runs isolated microservices for scaling bursts (e.g., fraud checks)                        |
| **App Service**           | Hosts the main API for users to submit orders and retrieve history                         |
| **Azure Functions**       | Background processors for: order validation, payment confirmation, and email notifications |
| **Azure Cosmos DB**       | Stores order details and metadata in a globally distributed NoSQL DB                       |
| **Blob Storage**          | Stores uploaded order attachments or invoices (PDFs, images)                               |
| **Microsoft Entra ID**    | Secures API access using OAuth2 and user roles                                             |
| **Key Vault**             | Stores connection strings, secrets, and API keys                                           |
| **Azure Cache for Redis** | Caches frequently accessed order and product data                                          |
| **API Apps**              | Hosts micro-APIs for internal services (e.g., user preferences, product catalog)           |
| **API Management**        | Public-facing API gateway with rate limiting, analytics, and key rotation                  |
| **Event Hubs**            | Ingests high-throughput events from mobile/IoT frontends                                   |
| **Event Grid**            | Publishes events to trigger logging, external integrations, or ML models                   |
| **Service Bus Messaging** | Reliable delivery of order processing and payment steps between services                   |
| **Queue Storage**         | Lightweight queuing for retry logic or low-priority background tasks                       |

---

## 📘 Flow Overview

1. **User submits an order** → via API hosted in **App Service**
2. **API Management** handles requests, forwards to internal API App
3. API sends message to **Event Hub** (for high-scale ingestion)
4. **Event Hub** forwards to **Azure Function** to validate order
5. Valid orders are enqueued in **Service Bus Queue**
6. Multiple **Azure Functions** consume queue:
   - Validate inventory
   - Process payment
   - Generate invoice PDF and store in **Blob Storage**
7. Completed orders are saved in **Cosmos DB**
8. Summary events are published to **Event Grid**
9. Other services subscribe: audit logs, external systems, analytics
10. Redis Cache used to serve fast reads for order status
11. CI/CD pipeline pulls from GitHub and pushes to **Container Registry**, deploys to **App Service** or **Container Instance**
12. All secrets are stored in **Key Vault**, access controlled via **Entra ID**

---

## 🔐 Security Notes

- All APIs require token-based auth via **Microsoft Entra ID**
- RBAC controls access to Azure Functions and Blob Storage
- **Key Vault** used for service-to-service auth secrets
- Logs & metrics exported to Azure Monitor

---

## 🚀 CI/CD Strategy

- Source: GitHub
- Build: GitHub Actions / Azure DevOps
- Push: Azure Container Registry
- Deploy: App Service, Container Instances
- Infrastructure as Code: Bicep or Terraform recommended

---

## ✅ AZ-204 Topics Covered

- Azure Functions, API Apps, Event Grid
- Serverless messaging (Event Hub, Service Bus, Queue Storage)
- Container-based deployment
- Secure APIs with Entra ID and Key Vault
- Use of Redis, Cosmos DB, Blob Storage
- Monitoring, logging, and automation with Event Grid

## Cost Control

| **Service**             | **Free/Cheap Option**                                   |
| ----------------------- | ------------------------------------------------------- |
| **Resource Group**      | Free                                                    |
| **Storage (Blob)**      | Use **Standard LRS**, Hot access tier                   |
| **Cosmos DB**           | Use **Free Tier (5 GB, 400 RU/s)**                      |
| **App Service**         | Use **F1 (Free) plan** for dev                          |
| **Container Instances** | Minimal vCPU/memory; stop when not in use               |
| **Functions**           | First 1 million executions/month are **free**           |
| **Event Hub**           | **Basic tier** with minimal throughput units            |
| **Service Bus**         | **Basic tier**, lowest pricing tier                     |
| **Queue Storage**       | Built into Storage Account (very cheap)                 |
| **API Management**      | Use **Consumption Tier** (lowest cost)                  |
| **Redis Cache**         | **Basic C0** (250MB, low throughput, or remove for dev) |
| **Key Vault**           | Charges per secret access — use sparsely in dev         |
| **Entra ID**            | Free tier covers basic RBAC and app registration        |

---

> 💡 **Next step:** Break this project into smaller modules for hands-on learning (e.g., start with App Service + Event Hub integration).
