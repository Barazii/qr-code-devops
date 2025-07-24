# Overview and Architecture

This project provides a solution for containerizing QR code generator microservices and deploying them to a Kubernetes cluster on AWS, utilizing Infrastructure as Code (IaC) best practices. This diagram shows the solution design for when CloudFormation is used (not Terraform).

![Alt Text](diagram/diagram.png)

Key components include:

- Microservices Architecture: QR code generator service and frontend web page service are individually packaged as Docker containers for modularity and multi-language support (backend in Python and frontend in JavaScript).
- Kubernetes Orchestration: Deployment and management of services are automated using Kubernetes.
- AWS services: Used for deploying Kubernetes network on the cloud, storing containerized microservices, and storing deployment artifacts.
- Infrastructure as Code: All cloud resources and configurations are managed through code using CloudFormation, enabling reproducibility and automated provisioning.
