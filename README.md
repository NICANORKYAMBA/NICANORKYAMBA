<div align="center">

<img src="assets/banner.svg" alt="Nicanor Kyamba — Cloud & DevOps Engineer. 12 of 12 AWS certifications, 3 Google Cloud certifications, 34 Credly badges." width="100%"/>

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=18&pause=1400&color=39D98A&center=true&vCenter=true&width=680&lines=Terraform+platforms+on+AWS+%E2%80%94+417+resources%2C+zero+drift;Multi-tenant+AI+SaaS+running+in+production;Security+pipelines+across+client+AWS+accounts;Open+to+Cloud%2C+DevOps+%26+Platform+roles" alt="Terraform platforms on AWS, multi-tenant AI SaaS in production, security pipelines across client AWS accounts, open to Cloud, DevOps and Platform roles"/>

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTQgOWg0djExSDR6TTYgMy41YTIuMjUgMi4yNSAwIDEgMSAwIDQuNSAyLjI1IDIuMjUgMCAwIDEgMC00LjV6TTEwIDloMy44djEuNmguMDVjLjUzLTEgMS44My0yLjA1IDMuNzctMi4wNSA0LjAzIDAgNC43OCAyLjY1IDQuNzggNi4xVjIwaC00di00LjhjMC0xLjE1LS4wMi0yLjYyLTEuNi0yLjYyLTEuNiAwLTEuODUgMS4yNS0xLjg1IDIuNTRWMjBIMTB6Ii8+PC9zdmc+)](https://www.linkedin.com/in/nicanor-kyamba-36b362158/)
[![Credly](https://img.shields.io/badge/Credly_·_34_badges-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTEyIDJsMi40IDEuOCAzLS4xLjkgMi45IDIuNCAxLjgtMSAyLjggMSAyLjgtMi40IDEuOC0uOSAyLjktMy0uMUwxMiAyMC40bC0yLjQtMS44LTMgLjEtLjktMi45LTIuNC0xLjggMS0yLjgtMS0yLjggMi40LTEuOC45LTIuOSAzIC4xek0xMC42IDE0LjZsLTIuNS0yLjUtMS40IDEuNCAzLjkgMy45IDYuOC02LjgtMS40LTEuNHoiLz48L3N2Zz4=)](https://www.credly.com/users/nicanor-kyamba)
[![Email](https://img.shields.io/badge/Email-0b110d?style=for-the-badge&logo=gmail&logoColor=39d98a)](mailto:nicanorkyamba98@gmail.com)

</div>

## `$ cat about.md`

I'm a **Cloud & DevOps Engineer** at [Kitsilano Technologies](https://kitstek.com), an AWS Partner in Nairobi, where I own AWS infrastructure for clients across East Africa: I write it in Terraform, secure it, keep it observable and keep its bill honest. Before and alongside that, I build software: multi-tenant AI products, a video-streaming platform and the pipelines that ship them.

- 🏗️ **Infrastructure as code that matches reality.** I brought a client's live AWS estate under Terraform with zero drift, and I design for the recovery targets the business actually signed up for.
- 🛡️ **Security people can act on.** Org-wide guardrails, threat-detection pipelines that page on real threats rather than routine admin work, least-privilege access.
- 🤖 **Full-stack and AI.** Next.js, Angular, Node and Python products running LLMs, retrieval and event-driven pipelines in production.
- 🏆 **All 12 active AWS certifications**, plus Google Cloud Professional Cloud Architect and Professional Cloud DevOps Engineer, and KCNA.

## `$ ls ~/work --featured`

<table>
<tr>
<td width="50%" valign="top">

### ☁️ Multi-environment AWS platform
**East African beverage group · vendor platform**

Terraform for a containerised platform across staging and production accounts, with one reusable country stack and a thin root per country and environment.

- **417 staging resources at zero drift**, including adopting hand-built live resources without disturbing them; **202 in production**
- ECS Fargate on Graviton, RDS MySQL behind RDS Proxy, ElastiCache, API Gateway (HTTP, REST, WebSocket), EventBridge, SQS FIFO
- CloudFront + WAF at the edge, TLS end to end, GuardDuty, Inspector, AWS Config, CloudTrail alarms
- Datadog monitors and DB monitoring, cost anomaly detection
- DR position written against a **30-minute RTO / 15-minute RPO**; state and config backed up encrypted to a second region

`Terraform` `ECS Fargate` `RDS Proxy` `WAF` `Datadog` `GitHub Actions`

</td>
<td width="50%" valign="top">

### 🤖 RibboAI: AI customer-support SaaS
**Multi-tenant platform · 1,400+ of my commits**

Businesses train a chatbot on their own documents and websites, embed it on their site and hand conversations to a human when needed.

- Built **live agent handoff** and **LLM-driven conversational onboarding**
- Privacy detection that understands **Swahili** contact requests (*jina, simu, nambari*)
- Fixed a **cross-visitor chat-resume** security flaw by verifying the visitor on contact match
- Subscription, credits and billing correctness; MRR / ARR in the admin overview
- Streaming fixes so long answers are never truncated

`Next.js` `TypeScript` `Firebase` `LangChain` `Pinecone` `Amazon Bedrock`

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🧠 Ajirii: AI recruitment platform
**Full stack · Next.js app + serverless API (95 of 131 API commits)**

Recruiters post jobs, upload CVs in bulk and get extracted, scored and optionally anonymised candidates.

- Serverless **Python API on AWS SAM**: Cognito with a Lambda authorizer, DynamoDB, SES, tests
- **CV text extraction** with Textract and DOCX parsing, and **SHA-256 de-duplication**
- Anonymisation as a configurable org setting; **ML-scoring integration** endpoints
- Next.js 15 frontend: processing pipeline with stage progress, analytics, notifications, audit logs, **MFA enforced for admins**

`Next.js` `TypeScript` `Python` `AWS SAM` `Cognito` `Textract`

</td>
<td width="50%" valign="top">

### 🎬 NW Plus TV: African video streaming
**Video-on-demand platform · 2024–2026 · 970+ commits across 3 repos**

[nwplus.tv](https://www.nwplus.tv) streams African films, documentaries and podcasts. I built most of it end to end.

- **Node.js / Express / Prisma API** on Google Cloud Run, media in **Cloud Storage** behind signed URLs, Paystack payments
- **Angular 15 + NgRx** frontend: content, subscriptions, discounts, payment plans and profiles
- Admin analytics built on **server-authoritative counts** (paying customers, not just active subscribers), with filters and export
- GA4 conversion-funnel tracking; Next.js business site ([nwplus.biz](https://nwplus.biz))
- Wrote the full technical handover

`Node.js` `Prisma` `Angular` `NgRx` `Cloud Run` `Paystack`

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🛡️ Security & governance at org scale

- **Threat-detection pipeline across 4 client AWS accounts**: GuardDuty → EventBridge (severity ≥ 7) → Lambda enricher → SNS, with operator attribution so routine admin activity doesn't page but genuine threats do. Includes deploy and end-to-end verification tooling.
- **AWS Partner tag enforcement in four layers**: SCP hard-block, tag policy, AWS Config auto-remediation and an EventBridge + Lambda safety net, rolled out with CloudFormation StackSets across the organisation.

`GuardDuty` `EventBridge` `Lambda` `SCPs` `AWS Config` `StackSets`

</td>
<td width="50%" valign="top">

### 💰 Operations & FinOps

- **SAP HANA backup automation** for a multi-tenant logistics account: S3 lifecycle to Glacier Instant Retrieval, plus a cross-region Deep Archive copy
- **Cost investigations** for client accounts that tripped their budgets: root cause, remediation and a written report each time
- **Migration decision guides**, e.g. SQL Server on EC2 (BYOL) vs RDS (BYOM) with costed recommendations
- Incident RCAs, runbooks and weekly client reporting

`AWS Backup` `S3 Lifecycle` `Cost Explorer` `Budgets` `Python`

</td>
</tr>
</table>

<sub>Client work is described without client names or internal details. Happy to walk through any of it in conversation.</sub>

## `$ cat certifications.yml`

<div align="center">

**All 12 active AWS certifications · 3 Google Cloud certifications · 34 badges on [Credly](https://www.credly.com/users/nicanor-kyamba)**

</div>

| | Certification | Earned |
|---|---|---|
| ![AWS](https://img.shields.io/badge/AWS-Professional-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Solutions Architect · DevOps Engineer · Generative AI Developer *(early adopter)* | 2025–26 |
| ![AWS](https://img.shields.io/badge/AWS-Specialty-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Security · Advanced Networking | 2025–26 |
| ![AWS](https://img.shields.io/badge/AWS-Associate-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Solutions Architect · Developer · CloudOps Engineer · Data Engineer · Machine Learning Engineer | 2024–26 |
| ![AWS](https://img.shields.io/badge/AWS-Foundational-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Cloud Practitioner · AI Practitioner | 2023, 2026 |
| ![Google Cloud](https://img.shields.io/badge/Google_Cloud-Professional-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Cloud Architect · Cloud DevOps Engineer | 2025–26 |
| ![Google Cloud](https://img.shields.io/badge/Google_Cloud-Associate-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Associate Cloud Engineer | 2025 |
| ![Linux Foundation](https://img.shields.io/badge/Linux_Foundation-CNCF-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | KCNA: Kubernetes and Cloud Native Associate | 2026 |
| ![Microsoft · Cisco](https://img.shields.io/badge/Microsoft_·_Cisco-Fundamentals-0b110d?style=flat-square&labelColor=133D17&color=0b110d) | Security, Compliance & Identity · Microsoft 365 · Cisco Ethical Hacker | 2024–25 |

## `$ which --all tools`

<div align="center">

**Cloud & IaC**<br/>
<img src="https://img.shields.io/badge/AWS-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="AWS"/>
<img src="https://img.shields.io/badge/Google_Cloud-0b110d?style=for-the-badge&logo=googlecloud&logoColor=39d98a" alt="Google Cloud"/>
<img src="https://img.shields.io/badge/Terraform-0b110d?style=for-the-badge&logo=terraform&logoColor=39d98a" alt="Terraform"/>
<img src="https://img.shields.io/badge/CloudFormation-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="CloudFormation"/>
<img src="https://img.shields.io/badge/Ansible-0b110d?style=for-the-badge&logo=ansible&logoColor=39d98a" alt="Ansible"/>

**Containers & delivery**<br/>
<img src="https://img.shields.io/badge/Kubernetes-0b110d?style=for-the-badge&logo=kubernetes&logoColor=39d98a" alt="Kubernetes"/>
<img src="https://img.shields.io/badge/Docker-0b110d?style=for-the-badge&logo=docker&logoColor=39d98a" alt="Docker"/>
<img src="https://img.shields.io/badge/Helm-0b110d?style=for-the-badge&logo=helm&logoColor=39d98a" alt="Helm"/>
<img src="https://img.shields.io/badge/GitHub_Actions-0b110d?style=for-the-badge&logo=githubactions&logoColor=39d98a" alt="GitHub Actions"/>
<img src="https://img.shields.io/badge/Linux-0b110d?style=for-the-badge&logo=linux&logoColor=39d98a" alt="Linux"/>

**Observability & security**<br/>
<img src="https://img.shields.io/badge/Datadog-0b110d?style=for-the-badge&logo=datadog&logoColor=39d98a" alt="Datadog"/>
<img src="https://img.shields.io/badge/CloudWatch-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTYuNSAxOWE0LjUgNC41IDAgMCAxLS44LTguOTNBNiA2IDAgMCAxIDE3LjMgOC42IDQuNSA0LjUgMCAwIDEgMTcuNSAxOWgtMTF6Ii8+PC9zdmc+" alt="CloudWatch"/>
<img src="https://img.shields.io/badge/Prometheus-0b110d?style=for-the-badge&logo=prometheus&logoColor=39d98a" alt="Prometheus"/>
<img src="https://img.shields.io/badge/Grafana-0b110d?style=for-the-badge&logo=grafana&logoColor=39d98a" alt="Grafana"/>
<img src="https://img.shields.io/badge/Kali_Linux-0b110d?style=for-the-badge&logo=kalilinux&logoColor=39d98a" alt="Kali Linux"/>

**Software & AI**<br/>
<img src="https://img.shields.io/badge/TypeScript-0b110d?style=for-the-badge&logo=typescript&logoColor=39d98a" alt="TypeScript"/>
<img src="https://img.shields.io/badge/Python-0b110d?style=for-the-badge&logo=python&logoColor=39d98a" alt="Python"/>
<img src="https://img.shields.io/badge/Next.js-0b110d?style=for-the-badge&logo=nextdotjs&logoColor=39d98a" alt="Next.js"/>
<img src="https://img.shields.io/badge/Angular-0b110d?style=for-the-badge&logo=angular&logoColor=39d98a" alt="Angular"/>
<img src="https://img.shields.io/badge/Node.js-0b110d?style=for-the-badge&logo=nodedotjs&logoColor=39d98a" alt="Node.js"/>
<img src="https://img.shields.io/badge/Firebase-0b110d?style=for-the-badge&logo=firebase&logoColor=39d98a" alt="Firebase"/>
<img src="https://img.shields.io/badge/LangChain-0b110d?style=for-the-badge&logo=langchain&logoColor=39d98a" alt="LangChain"/>
<img src="https://img.shields.io/badge/PostgreSQL_·_MySQL-0b110d?style=for-the-badge&logo=postgresql&logoColor=39d98a" alt="PostgreSQL and MySQL"/>
<img src="https://img.shields.io/badge/Redis-0b110d?style=for-the-badge&logo=redis&logoColor=39d98a" alt="Redis"/>

</div>

## `$ git log --career --oneline`

```text
2025-03 → now      Cloud Engineer · Kitsilano Technologies (AWS Partner), Nairobi
                   AWS platforms, security and FinOps for clients across East Africa
2024-06 → 2026-07  Full-Stack Engineer · NW Plus TV (Nifty Works Plus)
                   Video-streaming platform on Google Cloud: Node.js, Angular, Cloud Run

2026-01 → now      BSc Computer Science · University of the People
2025-01 → 2025-02  HNG12 Internship · DevOps & backend track
2022-08 → 2023     ALX Software Engineering programme
```

## `$ gh stats`

<div align="center">

<img src="https://github-readme-stats.vercel.app/api?username=NICANORKYAMBA&show_icons=true&count_private=true&hide_border=true&bg_color=0b110d&title_color=5dffa8&text_color=c9d6cc&icon_color=39d98a&ring_color=39d98a" alt="GitHub stats for NICANORKYAMBA" height="165"/>
<img src="https://streak-stats.demolab.com?user=NICANORKYAMBA&hide_border=true&background=0b110d&ring=39d98a&fire=5dffa8&currStreakLabel=5dffa8&sideLabels=c9d6cc&currStreakNum=c9d6cc&sideNums=c9d6cc&dates=4a6b52&stroke=1f3324" alt="GitHub contribution streak for NICANORKYAMBA" height="165"/>

<sub>Most of my work lives in private client and company repositories, so public repos show only part of it.</sub>

</div>

## `$ ./contact.sh`

<div align="center">

**🟢 Open to Cloud, DevOps and Platform Engineering roles: full-time, contract or freelance.**<br/>
Remote, hybrid or on-site · Nairobi, Kenya · EAT (GMT+3)

[![LinkedIn](https://img.shields.io/badge/Connect_on_LinkedIn-0b110d?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iIzM5ZDk4YSIgZD0iTTQgOWg0djExSDR6TTYgMy41YTIuMjUgMi4yNSAwIDEgMSAwIDQuNSAyLjI1IDIuMjUgMCAwIDEgMC00LjV6TTEwIDloMy44djEuNmguMDVjLjUzLTEgMS44My0yLjA1IDMuNzctMi4wNSA0LjAzIDAgNC43OCAyLjY1IDQuNzggNi4xVjIwaC00di00LjhjMC0xLjE1LS4wMi0yLjYyLTEuNi0yLjYyLTEuNiAwLTEuODUgMS4yNS0xLjg1IDIuNTRWMjBIMTB6Ii8+PC9zdmc+)](https://www.linkedin.com/in/nicanor-kyamba-36b362158/)
[![Email](https://img.shields.io/badge/nicanorkyamba98@gmail.com-0b110d?style=for-the-badge&logo=gmail&logoColor=39d98a)](mailto:nicanorkyamba98@gmail.com)

<img src="https://komarev.com/ghpvc/?username=NICANORKYAMBA&label=profile+views&color=133D17&style=flat-square" alt="Profile views"/>

</div>
