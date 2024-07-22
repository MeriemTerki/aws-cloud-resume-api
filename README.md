
# AWS Cloud Resume API

This project will guide you through building and deploying a serverless API using AWS Lambda and DynamoDB, integrated with GitHub Actions and Terraform . The primary goal is to construct an API that serves resume data in JSON format and make it accessible on the internet using API Gateway .

## Demo
```sh
curl https://lpn6ekqu21.execute-api.us-east-1.amazonaws.com/prod/resume
```

## Overview

This project automates the deployment of an AWS Lambda function using Terraform and GitHub Actions. The Lambda function serves as the backend for a resume API, providing endpoints to fetch resume details stored in a dynamoDB table .

## Architecture

![Architecture Diagram](https://app.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%22BV-xxkpbX55yBwoLjc4p%22%3E7V1rd6LK0v41We%2BnyeJqko8qxrCXYIxkMubLLESCeMMXMQi%2F%2FlR1NygXI5moc0nO2XtjF01f6vJUVdN0LsTmfNP2zeVY80b27ELgRpsLUbkQBIG7EuCClIhSatc1SnB8d0RJ%2FJbQd2ObETlGXbsje5WpGHjeLHCXWaLlLRa2FWRopu97YbbaizfL9ro0HbtA6FvmrEh9ckfBmFKvZW5Lv7NdZ5z0zHPsztxMKjPCamyOvHCHJLYuxKbveQH9Nd807RkyL%2BELfe52z910YL69CKo8oK5WQT%2B4GzzcR82fY%2BHlaTjufWPSeTVnazbh%2BlMfCM2Ztx6xcQdRwoyl5y4CwlC5Af9Af03uQoY7TSxdCnKOkC9fZQl8sYRtZAn58lWWwOeb53P98%2FkB7hAKpUzzXK5%2FbmeA8I%2FY8NbBzF3YzVT1OCA6vjlyQSRNb%2Bb5QFt4C%2BBeYxzMZ1Di4Wc4dgO7vzQt5GoIZgO0F28RMOXnhaTMGI%2BtgnoHJvTlszaIJGy%2F9WpTgdA6s5m5XLnD9Cnfttb%2Byn21H%2BwVbRypoIhL%2FD3fOGizl2a4ki4d31svyfBV6Kv07k%2F4%2BdNCxfhpzgJsKPC9qZ1M9EIQ4f%2B3qHyNF3c2yzHg1fYDF%2ByqPnMdbD%2FwsDuTlWb2C2kRuOIunA4pKSLHOFHWxchcje0RmxLTYujC3uw1Dz41OkAr25vbgR9BleSBGrNTBlRiUg63Zl%2BTGG28Y%2FJpRZNBjZO2vbVG%2BMEM8h3GKYoF6yyYpD0CuGJFzw%2FGnuMtzFlrS22A6BajlFPbOh0PJUC0aWIHQcTUz1wHXlZfaZ%2FY0V7WvoUtgek79pv1pHLB%2BPbMDEB5s5hewmT26D3axI5ApaxA%2BaucnFbe2rds9tRWVHXfN6Odagz0qvdzncPh99WHH3QEW71JefLrqpT0%2BZtVCRTGj36w50lhgAUAWVZUNrs3lWi3dG%2F7LvCBYCD3cb2k4n%2BjHl9VgXnxgwr8IZRIhvmWaFdTO7DGidzK3NY%2BmN3jznYBHqq3lCsMfPIugVXOQHXiBzrm0J7deys3cIm%2FGXpB4M0POgrLXhAN2NWqQ87TXC3pRF%2FcDY6j4D35fV5xZs6HI%2FPny3ph0WFW8zT71W6%2F%2B%2BGELCpwRfcjXRe9T0I7ulpJ0h%2BBGCc3crGqke%2BR3we9lCDk5J73UnRgH%2FZSIpfzOtLbXupA%2FdN4Kb5CwJOBstKEpDQpKUtMSpOTYoKSqUZShpIe8sQy2lWRyBerJVlGkVhGK0up8k%2FzJU%2Fzuaf3JzT7PEPOBTRvBJkCaT4reCH%2F%2BxP9QCnm%2BzYFDZoHQQ61KsuIRtHCnHuj4QldgiTkTLDEJcglCYl8qnyEr%2BASvszzzzTPq3qd52ufxjxX4gkNU5azhnlz%2FXtDNfHqU4Rqp1onEGq%2FFIEdK%2BgRvlD1r0XV1hUvXzU%2BDaqaS%2FenYwZ2iIH%2F2VJhQar9XnwVyvC1RpbAh%2FDDwR%2F%2Fv7Z914YEjFNIZKgAe2rmHKW3GK6WhF30ERhC%2BlRCG7mveVJaB2BW4F6I%2FSPWrdZzG9%2BnmYH5VotAyzSaAxQQWZDVo4KO5VVx7o5G1FHgywRz%2B5Yhi0doUugb2AuHYkZQsoLESCdTqJusv74qxtF82cq%2BdKpAWiyD%2FJzY1yvb%2Fz%2FUp%2Fq9SgQPGrYKykX%2BqYWbW04XSrIkXix7b3My6V4flm7gu45j%2ByjfYIz23CErjb%2BKEXmsSRcsvxCikhJ9kw%2Fr0HkR4uawDlFgaDN%2F%2FAUMOZleZcN6kS%2BRKXdOXJD4wzJd%2Bp5lr1b2FhiA70tvscKfLz7EiMcPMMzFCNXEJhcXM6OhaU1xAF46CvRGl19oUtEl5bYS8FJxgUConRNOpAouKa9Olm8DtOBoiGJAOvDiOmvfPpaPooo1Y36P23FZlbU6r3RVdZ12ncHPL%2BX%2BNVcpVvSUJ9skI1dA1R3E%2FHKS2XcM%2Bdd8Jbuebs7pJOWyV4A5cfahDtdYW1P7Kx8qLk4nyeUbEr0%2Bq0QrhLJvZT%2BfWZg3fC6QKK6EXZ1Tln%2FNiwZGOvhO4aM7t8pfKeSWJKTr3Mrkid8ovHcXxQk2hJHqyj4L%2BuPWxCtvCMM8qKq9v73f%2BFs%2BS5ASoNx9vV%2ByzC2fbMfXYZx%2BxOn%2F2yh9SGqykJGaLBQhuWxTxskgOVnW%2BHcwmSUYB3fknQa7v%2BVe7stcNfB%2B74a8bzfl%2FezbkHeg%2Fmk25Mll6wZ%2Fv3Idfw9BHsvP7PHlw2IqdfKndsQlPlS8JK52YQc%2FxWLcoAiKqIj7w4wjQHg%2BOKsVF%2BfOujZXO%2Bx2VcaxT%2B16xezCU5njPWsuVGFJla4wPnyKV7cH4qbrfLBblN5Z15n4CsuGifiSFzBf8ttaH39VkN9536aJZQL8q0MTvmrgK%2BxZNHpfEPPugFXI7UeXDkWsBx440TckFWKhTNhTGhi9ZcCzXHxUsOx3BlD5ICm0hzPQwtWl4wbj9fAY1gvZwmXWfUqJ%2FezmrXLRfhPa8QG4LO7Jr1IxzrhzckrDYQYT0TRMa%2BoQw05wcGS%2FmGsC3ntC2Px6EOmwnlC5hIJN4b47sU6Lwu3q1bkQGhtQFqF5f6cLz1FDGj5t1lbMuebdA2cp3mtHHImjSBa1SH615tarNqmHWvMmHs0tV20%2FL4ft8Eady6%2FD%2BaOr3j0vn3%2BMmkPRuVEndUdr1gWd%2FKs6Zvv78lkYc%2Fd9VdKURmgDbSTMpqM21nVC7a4hqRPp2mrfcmazMTefNiuoO9GVOqe11Eh1G9P7%2Fn%2B6FjtrTRk42mSw1ozHzWjS2nQmPVHjQq7brMdaX5K6xu0TjHMNzwrDJid3JlNOVR7XetzjbVd9vZ9swsGPBy8dv6vxvfjh9sGAObR7MB8u0iMp1KJ6pDUlDvvr9iUZ5sJ3Jhan%2FxhsoB9Oj%2FVVx5iuu0Yv0PuSqN8OWP1RzTBagqq0uGR83adwZxwPQscgdMlQaD17zmGb2GcMbQjapJfpc%2BSS%2B1y3HQaUziE97rKxdO88txNL1x0R5BhLF2T98gjWl%2FrAZBX%2FRir6TqHEd6bE47%2BTqWB8f5nzvD6GTyx%2BnplL7AVZyjZx4sSer7AA8wlQsoiKG23iOJqh7iIeRTdANX0yAERoKJrRAmSxsH4ICAFoMRVVpe4kdQZxHdtYdxULkWLTVVpwT4N7jxtVUaG%2BFgN6RLorbTRxEAOiSbqgsbYsaGsKdWEck9ZaizUueUZzAfX6UqzFD15n0pL1Jw3pIdABweBehFfoywAUNhxAWSuGNoVebEE9QCOXzq%2BLYzVaMqNJZN7QJ%2FZlRZwEbUrdJrfpAtrBOALSFswLkBHuDYRuW0Oki%2FVYBR5wGxg%2F%2FFsXkA96RJ4DBNagj2evg%2FM3vk862EasIZ%2BgvUFAnjFU8hvqPenIn9iSB6SPxw3wB9vhNaPH%2BIxj1taIvoDovG589zQX0BbaJjxRNOR1CHwmPFcpekvEA0X1jU54pIkwX%2BSzCHwSun2OjblOxwxj1%2BcOQXvdGFVtdwNeIdJjh%2BgP5dkggGvc7W%2FLjIdSL25F4A15kH3cVZxdOaCXTOWgKj1pEHF0zFE9BN7jmEWtX8pnVY%2FB2yl1Hp6hOtHnmE6Qq4zy1N3kmRbyPD7QptdBHTYesU2434vZOFBHZWiXAzlJwMMNygHmAm2CZ59YEXpNvIey12IaEejAN3g2grHwoM%2FYHo4HbQD485%2Bio2zJvBN76uE8BCovrD8QgNcheOMQPTXW7RloF6rM7CLqGmpik46OvE1tltZDm6P1emm9bZ2elNQrbY%2FYXa%2FQ5vZK8WNnrDyx87tl0DFgvJMWzNta60ZvAzqAdgRzRH44EuoJ6pGO%2FJpoqf3CVYAoBWQEkRbBhx5EWL0Yr3pchz7JWKCMdXs8oRtaPFRaMbQPGIO23OMBJ6Cs8iBf5D%2FIB%2B3I4jqGBe3VkQbYQvSE05%2FCAO0M7JEnNmvMxjrRf2J35MrsMQC5i9rkMUDM0kWYJ44fcFEnvGs5STs4Pt1wJJA%2FHVe%2FTsf1fYD6ttEnz7Wh0YM2oU%2B0y3Zro0XQBvCFXan90zLIQaVYABrZI22CzCJW19C2Mkvx08FyzHSA1etldEVPsPuN9lifHJ0H%2FFosA6JnRxov2I%2FMfAPF5GScBPcwQk10bAr6N6B6Nm9t26H14m09Ok7QAzaO%2F2rDPseB3Hj0LzrBz9uxRmwQ%2FFlyTeSLETvqbDyGaBqieoLxyEOiR4gBeJX0NuoxjCWqJ1c6%2FyYXo26Q6Bkzg%2FJ%2BHGgjxAyB1J2HMcEiUp6CPFSUC9hKcq2z59BfAA9I27cr1KOu8hgQfYof9s2J9AW6Tvty6%2FvGvUG7hHni3FE3ARsaX3w6wCfDGCSxjVxFL0k8EjFcpXW2V2oTQWI36TPTt9pFObXCbj%2FTJrdj%2B4ldChqr0zWeYdyP6NNDivEPE%2FR7mkHaDRAvYI4hYCf6ZOwnIrFXn9JBHoSu3xFcID4YyoHe1sKkHUYXO5iNNjmaUdK4ALBDQxzdUBzAPtK6Dh0vaYNndIn0BX1acY%2FonaY8OtgmxJxJO4xukb46xkM6P4jbQE6PhFdUThIPuuAkvEivzTrWi0Fn4L7G6GqQraci7vNM%2F5EeEJ9vtBKMZHKrk3p4T%2B9ziX5sElxKfCSNHUh8PWHtJuNB30Hmz%2BIDdkUdtXiwLbwfM3qU9J%2BWMfvvk7glKfNd1i%2FodxJXh7QemW9hnizmrqnudvUD8gip236eqy6kUo37u8Z41HacZ4VzDWOrgV02KxbJSTuRHETYJOpCdGBRl4WeHzyyttlnzTDKSCceFywHPTV4YESYvfWRblgSocck%2B9iDEuR%2BRK5Qf4hX4KymOOJeZGlKIWRBOJZQn2oyah9G0iRrUTAimuK6ioCWQrOq1LtBeTxBiUMUItHIPskwIJKJHYlG2BhFJVkIRqv0XpqFpBnKNrrejQ4rePJo6yHrezw49y4P3iWR284893rwXR15zmiWHs%2FcHc2iuSr8OtIbl%2BKabbqevvuqumSHWO1kH0L%2Fc9tB%2BJuq71x%2B7xl%2FZXuo88tAX1s6f%2FeWTkEWcyZbK%2Fk%2B5qybOoWy7YH5z2PsV3vmLT%2F71k6hJuSld13cG3TWbyekf27DfXqI%2B3nOW3zvS24ht8syOYNt3zvuA%2FVPtCvzn9vyu880P%2Fj25ir3LZR05rc3QtkelRz4GjYoyIvnzz81%2BAq5Xdci%2F5uRNzGpt0TXZvszuDr5cnn1qSVY4j6FEvfJ82eVYoWvSRMpfmrZFQJX6bq4wa9sW%2FTpRFfhs9HlGpIOelSGixfLG%2BGH%2FXhuxTHPKAANuSN27ttLTGY8f89xK3%2FvaQG%2BF5gsSTvS39P4Jt7IOZ2SS7ba82UfS53uWJ0KqN5dYFQDc8fJoIZdZE5C2dWB5rGOYEk17E1P8quHXhS0env4FJ680VShyaaCs3WXNi4bfGn3Qe2WhNw5GHLJGS9lvu5kB2FIFTa%2BnvVPfFyK0s3Fzp%2F54C85sXZxmj%2F0UTnRYAnAwfTzo2fNfkyUFb4JwpTBDErPidoe6IS3d050%2BswhDi%2FkV%2BZKDPasX%2B7KFT64XoGj2TkMLNgmiyA0ejwT8Muu5oc%2BiaglKZeGlJzPzZ%2F3UJsKB8huvfB96oU5EDX8V128%2BCYwcG0F5Pwt7t73Xt0VODR34XxqUX%2Fjc3ury16RHWvhAIrbv9ZIl4i2f%2FNSbP0P%3C%2Fdiagram%3E%3C%2Fmxfile%3E)

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


