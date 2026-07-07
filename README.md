# MD1USD Solana

A Solana blockchain smart contract implementation for MD1USD token.

## Overview

This project implements a Solana Program (Smart Contract) for the MD1USD token with comprehensive functionality and security measures.

## Prerequisites

- Rust 1.70 or higher
- Solana CLI 1.16 or higher
- Anchor Framework 0.29 or higher

## Installation

```bash
# Clone the repository
git clone https://github.com/dido599999/md1usd_solana.git
cd md1usd_solana

# Install dependencies
cargo build

# Build the program
anchor build
```

## Building

```bash
anchor build
```

## Testing

```bash
anchor test
```

## Deployment

```bash
# Set your RPC endpoint
export ANCHOR_PROVIDER_URL=https://api.devnet.solana.com

# Deploy to devnet
anchor deploy --provider.cluster devnet

# Deploy to mainnet-beta
anchor deploy --provider.cluster mainnet-beta
```

## Program Verification

This program is verified on-chain and can be viewed using:

```bash
solana program show <PROGRAM_ID>
```

## Security

- All smart contracts have been audited
- Follow best practices for Solana development
- Private keys and secrets are never committed to version control

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues and questions, please open an issue on GitHub.

## Contributing

Contributions are welcome! Please open a pull request with your changes.

---

Built with ❤️ on Solana