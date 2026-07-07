# Solana Program Verification Guide

## Program Verification

This document provides instructions for verifying the MD1USD Solana program on-chain.

### Prerequisites

```bash
# Install Solana CLI
curl https://release.solana.com/stable/install

# Install Anchor Framework
npm install -g @project-serum/anchor-cli
```

### Building for Verification

```bash
# Build with verification flags
anchor build --verifiable

# This creates a reproducible build suitable for verification
```

### Verification Steps

1. **Get Program ID**
   ```bash
   solana config get
   solana program show <PROGRAM_ID>
   ```

2. **Compare Build Hash**
   ```bash
   # Local build
   solana program dump <PROGRAM_ID> program.so
   sha256sum program.so
   ```

3. **Verify on-chain**
   ```bash
   solana program show --programs
   ```

### Verification Platforms

- **Solscan**: https://solscan.io
- **Solana Beach**: https://solanabeach.io
- **Anchor Program Registry**: https://www.anchor-lang.com/programs

### On-Chain Verification

To make your program verifiable on Anchor program registry:

1. Ensure your repository is public
2. Tag your release with version number
3. Build with `--verifiable` flag
4. Submit to Anchor program registry

### Deployment Checklist

- [ ] Code is audited and tested
- [ ] Build is reproducible
- [ ] Version tags are created
- [ ] Documentation is complete
- [ ] SECURITY.md is in place
- [ ] README with examples exists
- [ ] License file exists
- [ ] Source code repository is public

### Network Deployments

#### Devnet
- Status: Development/Testing
- Reset: Periodic
- Use for: Initial testing

#### Testnet
- Status: Long-running
- Reset: Rare
- Use for: Pre-production testing

#### Mainnet-Beta
- Status: Production
- Reset: Never
- Use for: Production deployment

### Verification Links

Once deployed, verify using:

- Program Authority:
  ```bash
  solana program show --authority <PROGRAM_ID>
  ```

- Program Data Account:
  ```bash
  solana account <PROGRAM_ID> --output json
  ```

- On Solscan:
  https://solscan.io/program/<PROGRAM_ID>

---

For more information, visit [Solana Docs](https://docs.solana.com)