#!/bin/bash

# Solscan Verification Script
# Builds the MD1USD program and compares SHA256 with on-chain binary

set -e

echo "📦 MD1USD Solana Program Verification"
echo "======================================"
echo ""

PROGRAM_ID="3fN2LAt47q3oSgNq4dJZt4DuAh5yJw6mb6B3dRYJGHa8"
echo "Program ID: $PROGRAM_ID"
echo ""

# Step 1: Build
echo "🔨 Building Anchor program..."
echo "   Rust version: $(rustc --version)"
echo "   Anchor version: $(anchor --version)"
anchor build --release
echo "✅ Build completed"
echo ""

# Step 2: Create package directory
echo "📁 Creating Solscan package..."
mkdir -p solscan_pkg/target/deploy
mkdir -p solscan_pkg/target/idl

# Step 3: Copy artifacts
echo "📋 Copying build artifacts..."
if cp target/deploy/*.so solscan_pkg/target/deploy/ 2>/dev/null; then
    echo "✅ .so files copied"
else
    echo "⚠️  No .so files found"
fi

if cp target/deploy/*.idl solscan_pkg/target/idl/ 2>/dev/null; then
    echo "✅ IDL files copied"
else
    echo "⚠️  No IDL files found"
fi

# Step 4: Download on-chain program
echo ""
echo "⬇️  Downloading on-chain program from Mainnet..."
solana program dump "$PROGRAM_ID" solscan_pkg/onchain.so --url https://api.mainnet-beta.solana.com
echo "✅ On-chain program downloaded"
echo ""

# Step 5: Verify SHA256
echo "🔍 Verifying SHA256 checksums..."
echo ""
echo "--- Built .so ---"
sha256sum solscan_pkg/target/deploy/*.so
echo ""
echo "--- On-chain .so ---"
sha256sum solscan_pkg/onchain.so
echo ""

BUILT_SHA=$(sha256sum solscan_pkg/target/deploy/md1usd_solana.so 2>/dev/null | awk '{print $1}' || echo "NOT_FOUND")
ONCHAIN_SHA=$(sha256sum solscan_pkg/onchain.so | awk '{print $1}')

echo "Built SHA:    $BUILT_SHA"
echo "On-chain SHA: $ONCHAIN_SHA"
echo ""

if [ "$BUILT_SHA" = "$ONCHAIN_SHA" ]; then
    echo "✅ VERIFIED: Built binary matches on-chain binary!"
    VERIFY_STATUS="✅ PASSED"
    EXIT_CODE=0
else
    echo "⚠️  WARNING: SHA256 mismatch detected"
    echo "This may indicate:"
    echo "  - Different build environment"
    echo "  - Different Anchor/Rust versions"
    echo "  - Different compiler flags"
    VERIFY_STATUS="⚠️  MISMATCH"
    EXIT_CODE=1
fi
echo ""

# Step 6: Create ZIP
echo "🗜️  Creating ZIP package for Solscan..."
cd solscan_pkg
zip -r "../${PROGRAM_ID}-solscan.zip" . > /dev/null 2>&1
cd ..
echo "✅ ZIP created: ${PROGRAM_ID}-solscan.zip"
ls -lh "${PROGRAM_ID}-solscan.zip"
echo ""

# Step 7: Summary
echo "📊 VERIFICATION SUMMARY"
echo "======================" 
echo "Program ID:  $PROGRAM_ID"
echo "Status:      $VERIFY_STATUS"
echo "Package:     ${PROGRAM_ID}-solscan.zip"
echo "Location:    $(pwd)/${PROGRAM_ID}-solscan.zip"
echo ""
echo "📋 Next Steps to Verify on Solscan:"
echo "   1. Download the ZIP file"
echo "   2. Go to: https://solscan.io/address/$PROGRAM_ID#verification"
echo "   3. Upload the ZIP file"
echo ""
echo "📝 For manual verification:"
echo "   Repository: https://github.com/sh3bmasr599999/MD1-solana"
echo "   Workflow:   .github/workflows/solscan_build.yml"
echo ""

exit $EXIT_CODE
