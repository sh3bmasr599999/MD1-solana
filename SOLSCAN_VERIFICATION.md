# Solscan Program Verification Guide

## Overview
This guide explains how to verify the MD1USD Solana program on Solscan for transparency and security.

**Program ID:** `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8`

---

## Method 1: Automated Workflow (Recommended) ⚙️

### Using GitHub Actions
The repository includes an automated workflow that builds the program and generates a verification package.

#### Steps:
1. Go to: https://github.com/sh3bmasr599999/MD1-solana/actions
2. Click on **"Build and Verify for Solscan"** workflow
3. Click **"Run workflow"** → **"Run workflow"**
4. Wait for the workflow to complete (usually 5-10 minutes)
5. Download the artifact `solscan-zip`
6. Extract and follow Solscan upload instructions

---

## Method 2: Local Verification 💻

### Requirements
- Rust 1.89.0+
- Anchor Framework 0.29.0+
- Solana CLI 1.18.26+
- Node.js 18+

### Steps:
```bash
# 1. Clone the repository
git clone https://github.com/sh3bmasr599999/MD1-solana.git
cd MD1-solana

# 2. Make script executable and run
chmod +x scripts/verify_solscan.sh
./scripts/verify_solscan.sh

# 3. The script will:
#    - Build the Anchor program in release mode
#    - Download the on-chain program binary from Mainnet
#    - Compare SHA256 checksums
#    - Generate a ZIP package for Solscan
```

### Output
The script creates:
- `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8-solscan.zip` - Upload this to Solscan

---

## Method 3: Manual Build 🛠️

If you prefer to build manually:

```bash
# Install dependencies
rustup toolchain install 1.89.0
cargo install --git https://github.com/coral-xyz/anchor avm --locked --force
avm install 0.29.0
avm use 0.29.0

# Build in release mode
anchor build --release

# Create verification package
mkdir -p solscan_pkg/target/deploy
cp target/deploy/*.so solscan_pkg/target/deploy/

# Download on-chain program
solana program dump 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8 \
  solscan_pkg/onchain.so \
  --url https://api.mainnet-beta.solana.com

# Compare checksums
echo "=== Built Binary ==="
sha256sum solscan_pkg/target/deploy/md1usd_solana.so
echo ""
echo "=== On-chain Binary ==="
sha256sum solscan_pkg/onchain.so

# Create ZIP
cd solscan_pkg
zip -r ../3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8-solscan.zip .
```

---

## Uploading to Solscan 🚀

### Steps:
1. Visit: https://solscan.io/address/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8#verification
2. Click on the **"Verification"** tab
3. Upload the ZIP file generated above
4. Provide the following information:

| Field | Value |
|-------|-------|
| **Repository** | https://github.com/sh3bmasr599999/MD1-solana |
| **Build Commitment** | Commit SHA from GitHub Actions workflow run |
| **Build Environment** | Ubuntu Latest with Rust 1.89.0, Anchor 0.29.0 |
| **Docker Image** | Not used (GitHub Actions default runner) |

---

## Build Environment Details 📋

| Component | Version |
|-----------|---------|
| Rust | 1.89.0 |
| Anchor Framework | 0.29.0 |
| Solana CLI | 1.18.26 |
| anchor-lang | 0.30.1 |
| anchor-spl | 0.30.1 |
| solana-program | 1.18.26 |
| Runner | ubuntu-latest |

---

## What Gets Verified? ✅

Solscan verification confirms:
- ✅ The published on-chain program matches the source code
- ✅ No malicious code modifications
- ✅ Build reproducibility
- ✅ Security and transparency
- ✅ Source code authenticity

---

## Troubleshooting 🔧

### SHA256 Mismatch
This might occur if:
- Different Rust/Anchor versions are used
- Different compiler optimization flags
- Different build environment

**Solution:** Use the exact versions specified above.

### Build Fails
Common causes:
- Missing Solana CLI tools
- Incorrect Anchor version
- Outdated dependencies

**Solution:** 
```bash
cargo clean
avm use 0.29.0
anchor build --release
```

### Upload Issues to Solscan
If Solscan upload fails:
1. Ensure the ZIP contains: `target/deploy/*.so`, `target/idl/`
2. Verify the Program ID is correct: `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8`
3. Check file permissions and ZIP integrity: `unzip -t 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8-solscan.zip`

---

## Files in This Repository

| File | Purpose |
|------|---------|
| `.github/workflows/solscan_build.yml` | Automated GitHub Actions workflow |
| `scripts/verify_solscan.sh` | Local verification script |
| `SOLSCAN_VERIFICATION.md` | This guide |

---

## Support & Links

- **GitHub Repository:** https://github.com/sh3bmasr599999/MD1-solana
- **GitHub Issues:** https://github.com/sh3bmasr599999/MD1-solana/issues
- **Solscan Verification:** https://solscan.io/address/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8#verification
- **Solscan Support:** https://solscan.io/contactus

---

**Last Updated:** 2026-07-07
**Status:** ✅ Ready for Solscan Verification
