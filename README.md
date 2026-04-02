# Collibra Data Catalog Simulation — Haworth CDP

Interactive simulation of the **Collibra Data Intelligence Platform** populated with real metadata from Haworth's Salesforce Data Cloud (Data360) org. Built to demo the art-of-the-possible for enterprise data catalog integration.

![Data Catalog](https://assets.meshmesh.io/tenants/org_01KDY098Y468ZK9Q6DFDZXJBG6/task-assets/e298ce97-b5f5-420c-80aa-953dc8a6fe94/458e4f77-3ab1-4c69-bd22-bbf7859c6384.png)

## Overview

Haworth is an office furniture wholesale manufacturer with customer data scattered across MS Dynamics 365, SAP ECC, HubSpot, and a D2C ecommerce platform. This simulation demonstrates how Collibra's data catalog would look when connected to Salesforce Data Cloud — cataloging every data asset from source system to audience segment.

## Features

### Tab 1: Data Catalog
Browse 16 data assets organized across 6 domains — Source Systems, Data Model, Unified Profiles, Analytics, and Audiences. Click any row to open a detail drawer showing field schemas, data types, classifications, and stewardship assignments.

- 134,811 total records across all assets
- 4 source systems (MS Dynamics 365, SAP ECC, HubSpot, D2C Ecommerce)
- 3 data spaces (default, B2B, D2C)
- 13 segments with real population counts
- Domain filter buttons for quick navigation

### Tab 2: Data Lineage
Interactive SVG flow diagram showing the complete data pipeline:

```
Source Systems → IngestAPI Connections → DMOs → IDR Rulesets → Unified Profiles → Calculated Insights → Segments
```

- 4 source systems feeding 4 IngestAPI connections
- 9 Data Model Objects (5 standard + 4 custom)
- 3 Identity Resolution rulesets (B2B Account, B2B Individual, D2C Individual)
- 3 Unified Profile sets with consolidation rates
- 3 Calculated Insights (Revenue, Engagement, LTV)
- 13 audience segments with population counts

### Tab 3: Business Glossary
16 Haworth-specific business terms mapped to their technical Data Cloud assets. Each term includes a plain-language definition, the technical API name, and the assigned data owner. Searchable and tagged by business domain (B2B, D2C, Platform).

### Tab 4: Governance Dashboard
Simulated data governance metrics including:

- **94% Overall Data Quality** across all assets
- **100% Policy Compliance** status
- **87% Classification Coverage** (PII, Confidential, Internal, Public)
- **6 Assigned Data Stewards** across 16 assets
- Per-asset quality bars
- Identity Resolution performance metrics (consolidation rates)
- Data classification distribution
- Stewardship assignment cards

## Data Sources

All metadata was extracted from the live Haworth Salesforce Data Cloud org using REST APIs:

| Data | Source |
|------|--------|
| Connections | `/services/data/v65.0/ssot/connections` |
| Data Streams | `/services/data/v65.0/ssot/data-streams` |
| Data Spaces | `/services/data/v65.0/ssot/data-spaces` |
| Identity Resolution | `/services/data/v65.0/ssot/identity-resolutions` |
| Calculated Insights | `/services/data/v65.0/ssot/calculated-insights` |
| Segments | MarketSegment SOQL query |
| DMO Record Counts | DCSQL via `/services/data/v65.0/ssot/queryv2` |

Raw metadata JSON files are stored in the `data/` directory.

## Tech Stack

- **Single HTML file** — no build step, no dependencies
- **Tailwind CSS** via browser script for styling
- **Vanilla JavaScript** for tab navigation, search, filters, and detail drawers
- **SVG** for the lineage flow diagram with animated connection lines

## Usage

Open `index.html` in any modern browser. No server required — it's a fully self-contained static file.

```bash
# Or serve locally
python3 -m http.server 8889
# Then open http://localhost:8889/index.html
```

## Project Structure

```
colibra-sim/
├── index.html              # Main application (single-page, self-contained)
├── README.md               # This file
└── data/                   # Raw metadata extracted from Data Cloud
    ├── extract-metadata.sh         # Extraction script
    ├── connections.json            # IngestAPI connections
    ├── data-streams.json           # Data stream configurations
    ├── data-spaces.json            # B2B / D2C / default spaces
    ├── identity-resolutions.json   # IDR rulesets and match rules
    ├── calculated-insights.json    # CI definitions and expressions
    ├── segments.json               # Segment definitions and counts
    ├── activation-targets.json     # Activation target configs
    ├── data-action-targets.json    # Data action webhooks
    └── dmo-metadata.json           # DMO record counts and field schemas
```

## Architecture Context

This simulation represents what a production Collibra ↔ Data Cloud integration would deliver. The real integration would use:

1. **Metadata Export** — Data Cloud REST APIs extract DMO schemas, IDR configs, CI definitions, and segment metadata
2. **Collibra Import API** — Push metadata into Collibra communities, domains, and assets via `/rest/2.0/import/json-job`
3. **Data Action Webhook** — Real-time sync via Data Cloud Data Actions to keep the catalog fresh as new assets are created

Since no live Collibra instance is connected, this HTML simulation demonstrates the full catalog experience with real org data.

## License

Internal demo — not for distribution.
