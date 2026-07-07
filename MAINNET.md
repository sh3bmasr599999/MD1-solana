# MD1USD Solana - Mainnet Deployment

## Program Information

**Program ID:** `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8`

**Network:** Mainnet-Beta

**Status:** ✅ Live on Mainnet

## Verification Status

### Verification Process

To verify that the deployed program matches this source code:

```bash
# Make scripts executable
chmod +x scripts/verify.sh
chmod +x scripts/program-info.sh

# Run verification
bash scripts/verify.sh

# View program information
bash scripts/program-info.sh
```

### Manual Verification Steps

1. **Build the program with verifiable flag:**
   ```bash
   anchor build --verifiable
   ```

2. **Extract the on-chain program:**
   ```bash
   solana program dump 3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8 program.so --url https://api.mainnet-beta.solana.com
   ```

3. **Compare hashes:**
   ```bash
   # On-chain program hash
   sha256sum program.so
   
   # Local build hash
   sha256sum target/verifiable/md1usd_solana.so
   ```

4. **If hashes match:** ✅ Program is verified!

## Blockchain Explorers

View the program on major Solana explorers:

- **Solscan:** https://solscan.io/program/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
- **Solana Beach:** https://solanabeach.io/program/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8
- **Explorer:** https://explorer.solana.com/address/3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8?cluster=mainnet-beta

## Security Considerations

- The program is **immutable** once deployed (unless upgrade authority is retained)
- All transactions are **transparent** and visible on-chain
- Code is **open source** and available for audit
- Verify the program source before transactions

## Deployment Details

| Field | Value |
|-------|-------|
| Program ID | `3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8` |
| Network | Mainnet-Beta |
| Language | Rust (Solana) |
| Framework | Anchor 0.30.1 |
| Status | Active |

## Audit & Verification

To verify the program's authenticity:

1. Clone this repository
2. Run `bash scripts/verify.sh`
3. Compare the generated hash with the on-chain program
4. If hashes match, the program is authentic ✅

## Support

For questions or issues:
- Open an issue on GitHub
- Check the [VERIFICATION.md](../VERIFICATION.md) for more details
- Review [SECURITY.md](../SECURITY.md) for security practices

---

**Last Updated:** 2026-07-07

**Repository:** https://github.com/dido599999/md1usd_solana
