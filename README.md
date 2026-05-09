# Microsoft Fabric Portfolio

End-to-end data engineering portfolio built on Microsoft Fabric — covering the full Fabric stack from ingestion through warehouse modelling, real-time intelligence, CI/CD, and data quality, with two sprint-based real-world projects as the centrepiece.

Built as part of structured Fabric Dojo learning programme alongside DP-700 (Microsoft Fabric Data Engineer Associate) certification preparation.

## Modules

| Module | Focus |
|---|---|
| [Ingestion & Access](./ingestion-access) | Dataflow Gen2, Copy Jobs, REST APIs, Shortcuts, Mirroring |
| [Orchestration & Logging](./orchestration) | Data Pipelines, metadata-driven frameworks, parameter passing |
| [Data Warehouse & T-SQL](./warehouse-tsql) | Kimball modelling, SCDs, watermarking, CONFX warehouse project |
| [Lakehouses & Notebooks](./lakehouse-notebooks) | PySpark, Delta Lake, OneLake, notebook orchestration |
| [Real-time & Streaming](./realtime) | Eventstreams, Eventhouse, KQL |
| [CI/CD](./cicd) | Git integration, Deployment Pipelines, Fabric REST API, GitHub Actions |
| [Quality Assurance](./quality-assurance) | Great Expectations (GX Core 1.0), validation across the data lifecycle |
| [Platform, Security & Governance](./platform-security) | RLS / OLS / CLS, Dynamic Data Masking, capacity management |
| [Solution Architecture](./solution-architecture) | Capacity sizing, workspace topology, domains, disaster recovery |
| [Real-world Projects](./real-world-projects) | Two end-to-end Fabric implementations delivered sprint-by-sprint |

## Skills

**Microsoft Fabric** — Data Pipelines · Dataflow Gen2 · Lakehouses · Data Warehouses · Notebooks · OneLake · Shortcuts · Mirroring · Eventstreams · Eventhouse · Real-Time Intelligence · Deployment Pipelines · Variable Libraries · Fabric REST API · Fabric CLI

**Languages** — T-SQL · PySpark · Python · KQL · Power Query M · DAX

**Data engineering** — Medallion architecture · Kimball dimensional modelling · Slowly Changing Dimensions (Type 1 & 2) · Incremental loading · Metadata-driven frameworks · Watermarking · Data quality with Great Expectations

**DevOps** — Azure DevOps · Git workflows · Branch policies · CI/CD pipelines · GitHub Actions · Service Principals

**Security & governance** — Row-Level Security · Object-Level Security · Column-Level Security · Dynamic Data Masking · RBAC · Capacity management

## Certifications

- **DP-700** — Microsoft Fabric Data Engineer Associate *(in progress)*

## How this repo is built

This repository is itself a small applied CI/CD project. Each module is developed in its own Microsoft Fabric workspace, committed to a dedicated Azure DevOps repository via Fabric's Git integration, and mirrored to this GitHub repo by an Azure Pipeline that syncs each module into its own subfolder. The mirror runs automatically on every commit.

## About

Built by [Vishesh Gupta](https://github.com/visheshtechie) — data engineer focused on Microsoft Fabric and the modern Azure data stack.
