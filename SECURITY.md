# Security Policy

## Reporting Security Issues

If you discover a security vulnerability, please email security information to the project maintainer instead of using the issue tracker.

## Security Best Practices

This project follows Solana security best practices:

### 1. Private Key Management
- Never commit `id.json` or any private keys to version control
- Use environment variables for sensitive configuration
- Keep private keys in secure storage (hardware wallet, key management service)

### 2. Smart Contract Security
- All contracts follow the Solana Security Model
- Proper account validation and authorization checks
- Overflow/underflow protection
- Input validation for all public functions

### 3. Code Review
- All code changes go through peer review
- Security-focused code audits performed regularly
- Follow OWASP top 10 principles

### 4. Dependencies
- Regular updates of dependencies
- Review of new dependencies for security issues
- Use of `cargo audit` for vulnerability scanning

### 5. Deployment
- Test on devnet/testnet before mainnet deployment
- Use upgrade authority for contract updates
- Maintain upgrade logs

## Security Checklist

- [ ] Private keys are not in version control
- [ ] Environment variables are configured correctly
- [ ] All external accounts are validated
- [ ] Signatures are verified
- [ ] Amount overflows/underflows are handled
- [ ] Program is tested thoroughly
- [ ] Code has been reviewed

## Supported Versions

| Version | Supported          |
|---------|-------------------|
| Latest  | ✅ Yes            |
| < Latest| ❌ No             |

## Audit Information

For audit reports and security assessments, contact the maintainer.