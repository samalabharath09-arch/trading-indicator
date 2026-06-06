#!/bin/bash
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║   FOREX ICT / SMC 5-PILLAR SCANNER           ║"
echo "║   CB Rate · TRP · OB · FVG/MS · Inst.Flow    ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

if ! command -v node &>/dev/null; then
  echo "❌ Node.js not found. Install from https://nodejs.org"
  exit 1
fi

echo "📦 Installing server dependencies..."
cd server && npm install --silent && cd ..

echo "📦 Installing client dependencies..."
cd client && npm install --silent && cd ..

echo ""
echo "🚀 Backend  → http://localhost:3002"
echo "🌐 Frontend → http://localhost:5174"
echo ""
echo "Open http://localhost:5174 in your browser"
echo "Press Ctrl+C to stop"
echo ""

node server/index.js &
SERVER_PID=$!
sleep 2
cd client && npx vite --port 5174
kill $SERVER_PID 2>/dev/null
