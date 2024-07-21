
# AWS Cloud Resume API

This project will guide you through building and deploying a serverless API using AWS Lambda and DynamoDB, integrated with GitHub Actions and Terraform . The primary goal is to construct an API that serves resume data in JSON format and make it accessible on the internet using API Gateway .

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Structure of the Project](#structure-of-the-project)
- [Project Setup Steps](#project-setup-steps)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project automates the deployment of an AWS Lambda function using Terraform and GitHub Actions. The Lambda function serves as the backend for a resume API, providing endpoints to fetch resume details stored in a dynamoDB table .

## Architecture

![Architecture Diagram](link-to-architecture-diagram.png)

The architecture involves:

- **AWS Lambda**: Runs the backend code for the API.
- **AWS API Gateway**: Provides a RESTful API endpoint.
- **AWS S3**: Stores the static website files.
- **Terraform**: Manages the infrastructure as code.
- **GitHub Actions**: Automates the CI/CD pipeline.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- An AWS account with necessary permissions.
- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS CLI configured with your credentials.
- A GitHub account with access to the repository.

## Structure of the Project

```plaintext
AWS-CLOUD-RESUME-API/
├── .github/
│   └── workflows/
│       └── deploy.yml
├── src/
│   ├── lambda_function.py
│   └── lambda_function.zip
├── .gitignore
├── main.tf
├── provider.tf
├── README.md
└── requirements.txt


