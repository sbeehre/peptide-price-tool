# 🧪 Peptide Underground Price Tool

A high-performance, client-side web application and order optimization tool for comparing peptide vendor rate cards in real-time across **Marvel Chloe**, **Tong Shi Po**, and **Tina Bio**.

---

## ✨ Features

- **Multi-Vendor Rate Card Comparison**: Real-time cross-vendor pricing matrix for GLP-1 agonists, metabolic agents, and custom research peptides.
- **Featured Product Spotlight**: Instant price delta analysis highlighting lowest vendor rates and savings badges.
- **Smart Order Optimizer & Cart Planner**: Interactive kit builder with single-vendor and split-order courier shipping optimization.
- **Cryptographic Admin Gateway**:
  - WebCrypto PBKDF2 (100,000 iterations PBKDF2-HMAC-SHA256) password derivation.
  - Zero admin UI elements exposed to public visitors.
  - Hidden access triggers via keyboard shortcut (`Ctrl+Shift+A` / `Cmd+Shift+A`), triple-clicking the flask icon, or `?mode=admin`.
- **In-Browser Price Sheet Importer & Diff Review**:
  - PapaParse-powered CSV/TSV dropzone and spreadsheet copy-paste parser.
  - Fuzzy header matching and item normalization.
  - Interactive Diff Preview table with old vs. new price comparison, delta % badges, and selective row toggles.
- **Data Export & Persistence**:
  - `localStorage` custom override persistence.
  - Export Master Catalog (`peptides.json`) directly for version control backups.

---

## 🚀 Docker & Traefik Deployment

The application is containerized with lightweight `nginx:alpine` and configured for reverse proxying via Traefik.

### 1. Build and Run via Docker Compose

```bash
docker compose up -d
```

### 2. Traefik Configuration

The included `docker-compose.yml` connects to your external Traefik network (`traefik_default`) with automatic SSL certificate resolution:

```yaml
services:
  peptide-app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: peptide-compare-app
    restart: unless-stopped
    networks:
      - traefik_default
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.peptide.rule=Host(`peptides.yourdomain.com`)"
      - "traefik.http.routers.peptide.entrypoints=websecure"
      - "traefik.http.routers.peptide.tls.certresolver=myresolver"
      - "traefik.http.services.peptide.loadbalancer.server.port=80"

networks:
  traefik_default:
    external: true
```

---

## 🔐 Admin Gateway Credentials

- **Default Passphrase**: `peptide2026`
- **To update the master passphrase**:
  1. Open the browser Developer Console (<kbd>F12</kbd>).
  2. Run `await window.generateAdminHash("YourNewSecretPassphrase")`.
  3. Paste the generated 64-character hash into `ADMIN_TARGET_HASH_HEX` in `index.html`.

---

## 📄 Disclaimer

For research, educational, and comparative pricing analysis only.
