
# AWS Cloud Resume API

This project will guide you through building and deploying a serverless API using AWS Lambda and DynamoDB, integrated with GitHub Actions and Terraform . The primary goal is to construct an API that serves resume data in JSON format and make it accessible on the internet using API Gateway .

## Demo
```sh
curl https://lpn6ekqu21.execute-api.us-east-1.amazonaws.com/prod/resume
```

## Overview

This project automates the deployment of an AWS Lambda function using Terraform and GitHub Actions. The Lambda function serves as the backend for a resume API, providing endpoints to fetch resume details stored in a dynamoDB table .

## Architecture

![Architecture Diagram]()

The architecture involves:

- **AWS Lambda**: Runs the backend code for the API.
- **AWS API Gateway**: Provides a RESTful API endpoint.
- **DynamoDB**: Stores the json resume data.
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
├── requirements.txt
└── resume.json
``` 
### Project setup steps 🚀

#### 1. Set Up AWS

- **Sign Up for AWS**: If you don't already have an AWS account, sign up at [aws.amazon.com](https://aws.amazon.com/).
- **Set Up Credentials**: Configure your AWS CLI with your credentials using `aws configure`.

#### 2. Create a JSON Resume

- Create a JSON file containing your resume data. Follow a schema [Here](https://jsonresume.org/schema)
- Store this JSON file for later use.
#### 3. Create DynamoDB Table

- **Table Name**: Resumes
- **Primary Key**: `id` (String)
- Populate the table with your resume data using the AWS Management Console, AWS CLI, or a script.

#### 4. Write the Lambda Function

- Create a Python script (`lambda_function.py`) to fetch resume data from DynamoDB and return it in JSON format.

#### 5. Package the Lambda Function

- Zip the `lambda_function.py` file.


#### 6. Create Terraform Configuration 

- Create `main.tf` and `provider.tf` for infrastructure as code as a way to automatically create the lambda function and the API Gateway configurations .

#### 7. Create an S3 bucket to store terraform state files 
- Create an S3 bucket in the AWS console or the AWS CLI with the same name as the one used in `provider.tf` file .

#### 7. Apply Terraform Configuration
- **Initialize Terraform**:
  ```sh
  terraform init
  ```
- **Plan the Deployment**:
  ```sh
  terraform plan
  ```
- **Apply Deployment**:
  ```sh
  terraform apply
  ```
 - After the deployement an api endpoint url is going to be generated , keep it for the test after . 


#### 8. Set Up GitHub Actions

- Create a GitHub Actions workflow (`.github/workflows/deploy.yml`) to automatically deploy updates to your Lambda function on every push to the repository.

#### 9. Test the API

- **API Gateway URL**: Test your endpoint to ensure it returns the resume data in JSON format (the one generated after executing the terraform setup) using `curl`.
- **GitHub Actions**: Make a change to your code, push to the repository, and verify that the GitHub Actions workflow deploys the updated Lambda function.

## Medium Blog 
- For a detailed step by step guide to build this project , follow the steps in this ![blog](link-to-medium-blog)


