<div align="center">

<img src="assets/banner.svg" alt="Nicanor Kyamba — Cloud & DevOps Engineer. 12 of 12 AWS certifications, 3 Google Cloud certifications, 34 Credly badges." width="100%"/>

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=18&pause=1400&color=39D98A&center=true&vCenter=true&width=700&lines=Platform+Lead+%E2%80%94+12+microservices+on+EKS+with+GitOps;Terraform+on+AWS+%E2%80%94+417+resources%2C+zero+drift;AI+SaaS+on+Amazon+Bedrock%2C+in+production;Open+to+Cloud%2C+DevOps+%26+Platform+roles" alt="Platform Lead for 12 microservices on EKS with GitOps; Terraform on AWS with 417 resources at zero drift; AI SaaS on Amazon Bedrock in production; open to Cloud, DevOps and Platform roles"/>

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTQgOWg0djExSDR6TTYgMy41YTIuMjUgMi4yNSAwIDEgMSAwIDQuNSAyLjI1IDIuMjUgMCAwIDEgMC00LjV6TTEwIDloMy44djEuNmguMDVjLjUzLTEgMS44My0yLjA1IDMuNzctMi4wNSA0LjAzIDAgNC43OCAyLjY1IDQuNzggNi4xVjIwaC00di00LjhjMC0xLjE1LS4wMi0yLjYyLTEuNi0yLjYyLTEuNiAwLTEuODUgMS4yNS0xLjg1IDIuNTRWMjBIMTB6Ii8+PC9zdmc+)](https://www.linkedin.com/in/nicanor-kyamba-36b362158/)
[![Credly](https://img.shields.io/badge/Credly_·_34_badges-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTEyIDJsMi40IDEuOCAzLS4xLjkgMi45IDIuNCAxLjgtMSAyLjggMSAyLjgtMi40IDEuOC0uOSAyLjktMy0uMUwxMiAyMC40bC0yLjQtMS44LTMgLjEtLjktMi45LTIuNC0xLjggMS0yLjgtMS0yLjggMi40LTEuOC45LTIuOSAzIC4xek0xMC42IDE0LjZsLTIuNS0yLjUtMS40IDEuNCAzLjkgMy45IDYuOC02LjgtMS40LTEuNHoiLz48L3N2Zz4=)](https://www.credly.com/users/nicanor-kyamba)
[![Email](https://img.shields.io/badge/Email-0b110d?style=for-the-badge&logo=gmail&logoColor=39d98a)](mailto:nicanorkyamba98@gmail.com)

</div>

## `$ cat about.md`

I'm a **Cloud & DevOps Engineer** at [Kitsilano Technologies](https://kitstek.com), an AWS Partner in Nairobi. I lead production platforms, from Kubernetes and GitOps to Terraform, security and cost, for products and clients across East Africa, and I write a lot of the software that runs on them: multi-tenant AI products, a video-streaming service, recruitment tooling.

What people get when they work with me: infrastructure that matches what's in git, security that pages on real threats, recovery targets that are written down and designed for, and documentation good enough to hand over.

<img src="assets/impact.svg" alt="3,690+ commits on 7 production systems; 417 AWS resources in Terraform at zero drift; 12 microservices on EKS shipped with GitOps; threat detection across 4 client AWS accounts." width="100%"/>

## `$ ls ~/work --flagship`

### ☸️ DukQa · production platform on Amazon EKS

> **Role** Platform Lead · **Period** Dec 2025 – May 2026 · **Scale** 12 microservices, 16 GitOps apps, 380+ commits

DukQa is a B2C logistics product for East Africa. I led the production platform: **12 microservices on EKS, delivered entirely through GitOps**, and wrote most of the platform code.

<img src="assets/arch-dukqa.svg" alt="DukQa architecture: GitHub and CI push images to ECR; ArgoCD Image Updater writes new digests back to git; ArgoCD syncs 16 applications into EKS; 12 microservices behind an ALB ingress; RabbitMQ, Secrets Store CSI with IRSA, Prometheus; RDS PostgreSQL through RDS Proxy, ElastiCache and S3." width="100%"/>

- **GitOps end to end:** ArgoCD with ApplicationSets managing 16 applications; ArgoCD Image Updater writes new image digests back to git, so the cluster always matches the repo
- **Scales on demand:** Cluster Autoscaler across node groups in two availability zones; right-sized requests and pinned image digests in production
- **No credentials in pods:** Secrets Store CSI driver with IRSA per service, plus NetworkPolicies, RBAC, priority classes and limit ranges
- **Hard problems, solved and written up:** diagnosed TLS failures between services and RDS Proxy (ACM certificates, not the RDS CA bundle), tuned RabbitMQ to HA with the right memory and topology, and reported to stakeholders on platform health

`EKS` `ArgoCD` `Helm` `Terraform` `RDS Proxy` `RabbitMQ` `Prometheus` `IRSA`

### ☁️ Vendor platform on AWS · fully in Terraform

> **Role** Infrastructure owner · **Period** Apr 2026 – present · **Scale** 619 resources across 2 accounts, 401 of 409 commits

A containerised vendor platform for an East African beverage group, across staging and production accounts. I wrote the Terraform and run the platform.

<img src="assets/arch-aws-platform.svg" alt="AWS vendor platform: CloudFront with WAF, ALB and API Gateway, ECS Fargate on Graviton and Lambda, RDS MySQL through RDS Proxy, ElastiCache, SQS, EventBridge and SES; GuardDuty, Inspector, AWS Config and CloudTrail alarms; Datadog, CloudWatch and X-Ray. Terraform: one country stack, staging at 417 resources with zero drift, production at 202, encrypted state backup in a second region, 30-minute RTO and 15-minute RPO." width="100%"/>

- **Brought a live estate under code:** 417 staging resources at **zero drift**, including resources others built by hand, adopted without disturbing their live testing; 202 resources in production
- **One stack, many countries:** everything a country runs is written once and deployed through thin per-environment roots, ready for expansion beyond Kenya
- **Recovery designed, not hoped for:** DR position written against a **30-minute RTO / 15-minute RPO**, with state and configuration backed up encrypted to a second region
- **Operated, not just built:** Datadog monitor audits and DB monitoring, RDS Proxy cutover, Redis scaling, credential rotation, cost anomaly detection and weekly reporting

`Terraform` `ECS Fargate` `Graviton` `RDS Proxy` `WAF` `Datadog` `GitHub Actions`

### 🤖 RibboAI · multi-tenant AI customer support

> **Role** Full-stack & AI engineer · **Period** Nov 2025 – Sep 2026 · **Scale** 1,460+ commits

Businesses train an AI agent on their own documents and websites, embed it on their site or in WhatsApp, and hand conversations to a human when needed.

<img src="assets/arch-ribboai.svg" alt="RibboAI architecture: web widget, WhatsApp agents and human operators connect to a multi-tenant Next.js app with an agent builder, live handoff, onboarding, sessions and billing; an AI layer on Amazon Bedrock with a model allowlist, a PII guard, LangChain and retrieval on Pinecone; Firebase, AWS hosting, Cypress and Sentry." width="100%"/>

- **Built the agent builder end to end on Amazon Bedrock**, and chose the model on evidence rather than habit
- **Live agent handoff** and **LLM-driven conversational onboarding**, with persistent assistant sessions and an audit trail
- **Security and privacy by default:** a Bedrock model allowlist (unapproved models are refused), a PII anonymisation design for other providers, Swahili-aware privacy detection (*jina, simu, nambari*), and a fix for unverified cross-visitor chat resume
- **Billing that adds up:** subscriptions, credits and renewals credited to the right organisation; MRR / ARR in the admin overview
- **Moved hosting from Vercel to AWS** and wrote the migration and operations guide

`Next.js` `TypeScript` `Amazon Bedrock` `LangChain` `Pinecone` `Firebase` `Cypress`

## `$ ls ~/work --selected`

<img src="assets/selected-work.svg" alt="Selected work: NW Plus TV, African video streaming with 970+ commits; Ajirii, AI recruitment platform; org-scale security with GuardDuty detection across 4 accounts and 4-layer tag enforcement; operations and FinOps; solution architecture and pre-sales; web and internal tools." width="100%"/>

<details>
<summary><b>Read the full write-ups</b></summary>
<br/>

<table>
<tr>
<td width="50%" valign="top">

### 🎬 NW Plus TV · African video streaming

**970+ commits across 3 repos · 2024–2026**

[nwplus.tv](https://www.nwplus.tv) streams African films, documentaries and podcasts. I built most of it end to end.

- Node.js / Express / Prisma API on **Google Cloud Run**, media in Cloud Storage behind signed URLs, Paystack payments
- Angular 15 + NgRx frontend: content, subscriptions, discounts, payment plans, profiles
- Admin analytics on **server-authoritative counts** (paying customers, not just active subscribers)
- GA4 funnel tracking, the Next.js business site and the full technical handover

`Node.js` `Prisma` `Angular` `NgRx` `Cloud Run`

</td>
<td width="50%" valign="top">

### 🧠 Ajirii · AI recruitment platform

**Serverless API (95 of 131 commits) + Next.js app**

Recruiters post jobs, upload CVs in bulk and get extracted, scored and optionally anonymised candidates.

- Python API on **AWS SAM**: Cognito with a Lambda authorizer, DynamoDB, SES, tests
- **CV text extraction** with Textract and DOCX parsing; **SHA-256 de-duplication**
- Anonymisation as an org setting; ML-scoring integration endpoints
- Next.js 15 app: processing pipeline with stage progress, analytics, audit logs, **MFA for admins**

`Python` `AWS SAM` `Cognito` `Textract` `Next.js`

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🛡️ Security & governance at org scale

- **Threat detection across 4 client AWS accounts:** GuardDuty → EventBridge (severity ≥ 7) → Lambda enricher → SNS. Operator attribution means routine admin work doesn't page, but genuine threats do. Includes deploy and end-to-end verification tooling.
- **AWS Partner tag enforcement in four layers:** SCP hard-block, tag policy, AWS Config auto-remediation and an EventBridge + Lambda safety net, rolled out with CloudFormation StackSets across the organisation.

`GuardDuty` `EventBridge` `Lambda` `SCPs` `AWS Config` `StackSets`

</td>
<td width="50%" valign="top">

### 💰 Operations & FinOps

- **SAP HANA backup automation** for a multi-tenant logistics account: S3 lifecycle to Glacier Instant Retrieval plus a cross-region Deep Archive copy
- **Cost investigations** for client accounts that tripped their budgets: root cause, remediation and a written report each time
- Incident **RCAs**, runbooks, DR positions and weekly client reports

`AWS Backup` `S3 Lifecycle` `Cost Explorer` `Budgets` `Python`

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📐 Solution architecture & pre-sales

- **Digital forms and approvals platform** for a sugar manufacturer: ECS Fargate behind CloudFront, RDS PostgreSQL Multi-AZ, SSO with Entra ID, data-only DR to a second region, costed at $265–382/month
- **SQL Server migration guide:** EC2 with BYOL vs RDS with BYOM, costed with a clear recommendation
- **WhatsApp AI agent demo** for a 40-company conglomerate: four agent patterns on one platform, with demo sites carrying the live widget

`Solution design` `Cost modelling` `Entra ID SSO` `AWS Pricing`

</td>
<td width="50%" valign="top">

### 🧰 Web & internal tools

- **Kitstek website:** Next.js 16 App Router marketing site with SEO structure and audit, deployed on AWS Amplify (60 of 62 commits)
- **Kitsilano HRMS:** leave management for the whole company, with accrual by cron, role-based access, approvals and email notifications, on AWS Lightsail
- **CKAD lab repository:** structured labs and a microservices practice app for the Certified Kubernetes Application Developer exam

`Next.js 16` `Tailwind` `PHP 8` `MariaDB` `Lightsail` `kubectl`

</td>
</tr>
</table>

</details>

<sub>Client work is described without client names or internal details. Happy to walk through any of it in conversation.</sub>

## `$ cat principles.md`

<img src="assets/principles.svg" alt="Principles: 01 Git is the source of truth: if it runs in production, it is in Terraform or GitOps, and drift is found and closed. 02 Design for the recovery target: agree RTO and RPO first; backups, regions and runbooks follow. 03 Alerts must mean something: a page is a real threat or a real outage, never routine admin work. 04 Cost is a feature: Graviton, right-sizing, lifecycle rules, budgets and anomaly detection by default. 05 Leave it documented: runbooks, RCAs, DR positions and handovers that let someone else take over." width="100%"/>

## `$ cat certifications.yml`

<img src="assets/certifications.svg" alt="Certifications: all 12 active AWS certifications: Professional (Solutions Architect, DevOps Engineer, Generative AI Developer), Specialty (Security, Advanced Networking), Associate (Solutions Architect, Developer, CloudOps Engineer, Data Engineer, Machine Learning Engineer), Foundational (Cloud Practitioner, AI Practitioner). Google Cloud Professional Cloud Architect, Professional Cloud DevOps Engineer, Associate Cloud Engineer. KCNA. Microsoft SC-900 and MS-900. Cisco Ethical Hacker." width="100%"/>

<div align="center"><sub>Verify every badge on <a href="https://www.credly.com/users/nicanor-kyamba">Credly</a>.</sub></div>

## `$ which --all tools`

<div align="center">

**Cloud & IaC**<br/>
<img src="https://img.shields.io/badge/AWS-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="AWS"/>
<img src="https://img.shields.io/badge/Google_Cloud-0b110d?style=for-the-badge&logo=googlecloud&logoColor=39d98a" alt="Google Cloud"/>
<img src="https://img.shields.io/badge/Terraform-0b110d?style=for-the-badge&logo=terraform&logoColor=39d98a" alt="Terraform"/>
<img src="https://img.shields.io/badge/CloudFormation_·_SAM-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="CloudFormation and SAM"/>
<img src="https://img.shields.io/badge/Bash-0b110d?style=for-the-badge&logo=gnubash&logoColor=39d98a" alt="Bash"/>

**Containers & delivery**<br/>
<img src="https://img.shields.io/badge/Kubernetes-0b110d?style=for-the-badge&logo=kubernetes&logoColor=39d98a" alt="Kubernetes"/>
<img src="https://img.shields.io/badge/ArgoCD-0b110d?style=for-the-badge&logo=argo&logoColor=39d98a" alt="ArgoCD"/>
<img src="https://img.shields.io/badge/Helm-0b110d?style=for-the-badge&logo=helm&logoColor=39d98a" alt="Helm"/>
<img src="https://img.shields.io/badge/Docker-0b110d?style=for-the-badge&logo=docker&logoColor=39d98a" alt="Docker"/>
<img src="https://img.shields.io/badge/GitHub_Actions-0b110d?style=for-the-badge&logo=githubactions&logoColor=39d98a" alt="GitHub Actions"/>
<img src="https://img.shields.io/badge/Linux-0b110d?style=for-the-badge&logo=linux&logoColor=39d98a" alt="Linux"/>

**Observability & security**<br/>
<img src="https://img.shields.io/badge/Datadog-0b110d?style=for-the-badge&logo=datadog&logoColor=39d98a" alt="Datadog"/>
<img src="https://img.shields.io/badge/CloudWatch-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="CloudWatch"/>
<img src="https://img.shields.io/badge/Prometheus-0b110d?style=for-the-badge&logo=prometheus&logoColor=39d98a" alt="Prometheus"/>
<img src="https://img.shields.io/badge/RabbitMQ-0b110d?style=for-the-badge&logo=rabbitmq&logoColor=39d98a" alt="RabbitMQ"/>
<img src="https://img.shields.io/badge/Kali_Linux-0b110d?style=for-the-badge&logo=kalilinux&logoColor=39d98a" alt="Kali Linux"/>

**Software & AI**<br/>
<img src="https://img.shields.io/badge/TypeScript-0b110d?style=for-the-badge&logo=typescript&logoColor=39d98a" alt="TypeScript"/>
<img src="https://img.shields.io/badge/Python-0b110d?style=for-the-badge&logo=python&logoColor=39d98a" alt="Python"/>
<img src="https://img.shields.io/badge/Next.js-0b110d?style=for-the-badge&logo=nextdotjs&logoColor=39d98a" alt="Next.js"/>
<img src="https://img.shields.io/badge/Angular-0b110d?style=for-the-badge&logo=angular&logoColor=39d98a" alt="Angular"/>
<img src="https://img.shields.io/badge/Node.js-0b110d?style=for-the-badge&logo=nodedotjs&logoColor=39d98a" alt="Node.js"/>
<img src="https://img.shields.io/badge/Amazon_Bedrock-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="Amazon Bedrock"/>
<img src="https://img.shields.io/badge/LangChain-0b110d?style=for-the-badge&logo=langchain&logoColor=39d98a" alt="LangChain"/>
<img src="https://img.shields.io/badge/Firebase-0b110d?style=for-the-badge&logo=firebase&logoColor=39d98a" alt="Firebase"/>
<img src="https://img.shields.io/badge/PostgreSQL_·_MySQL-0b110d?style=for-the-badge&logo=postgresql&logoColor=39d98a" alt="PostgreSQL and MySQL"/>
<img src="https://img.shields.io/badge/Redis-0b110d?style=for-the-badge&logo=redis&logoColor=39d98a" alt="Redis"/>

</div>

## `$ git log --career`

<img src="assets/career.svg" alt="Career timeline. Work: Cloud Engineer at Kitsilano Technologies (AWS Partner, Nairobi) since March 2025; Full-Stack Engineer at NW Plus TV, June 2024 to July 2026. Learning: ALX Software Engineering programme 2022 to 2023; HNG12 internship (DevOps and backend) January to February 2025; BSc Computer Science at the University of the People since January 2026. Milestones: first AWS certification October 2023; AWS Solutions Architect Professional and Google Cloud Professional Cloud Architect December 2025; all 12 AWS certifications June 2026. Now: preparing for CKAD, writing about the road to 12 AWS certifications, studying computer science." width="100%"/>

## `$ gh stats`

<div align="center">

<img src="https://streak-stats.demolab.com?user=NICANORKYAMBA&hide_border=true&background=0b110d&ring=39d98a&fire=5dffa8&currStreakLabel=5dffa8&sideLabels=c9d6cc&currStreakNum=c9d6cc&sideNums=c9d6cc&dates=4a6b52&stroke=1f3324" alt="GitHub contribution streak for NICANORKYAMBA" height="165"/>

<sub>Most of my work lives in private client and company repositories, so public stats show only part of it.</sub>

</div>

## `$ ./contact.sh`

<div align="center">

**🟢 Open to Cloud, DevOps and Platform Engineering roles: full-time, contract or freelance.**<br/>
Remote, hybrid or on-site · Nairobi, Kenya · EAT (GMT+3)

[![LinkedIn](https://img.shields.io/badge/Connect_on_LinkedIn-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTQgOWg0djExSDR6TTYgMy41YTIuMjUgMi4yNSAwIDEgMSAwIDQuNSAyLjI1IDIuMjUgMCAwIDEgMC00LjV6TTEwIDloMy44djEuNmguMDVjLjUzLTEgMS44My0yLjA1IDMuNzctMi4wNSA0LjAzIDAgNC43OCAyLjY1IDQuNzggNi4xVjIwaC00di00LjhjMC0xLjE1LS4wMi0yLjYyLTEuNi0yLjYyLTEuNiAwLTEuODUgMS4yNS0xLjg1IDIuNTRWMjBIMTB6Ii8+PC9zdmc+)](https://www.linkedin.com/in/nicanor-kyamba-36b362158/)
[![Email](https://img.shields.io/badge/nicanorkyamba98@gmail.com-0b110d?style=for-the-badge&logo=gmail&logoColor=39d98a)](mailto:nicanorkyamba98@gmail.com)

<img src="https://komarev.com/ghpvc/?username=NICANORKYAMBA&label=profile+views&color=133D17&style=flat-square" alt="Profile views"/>

</div>
