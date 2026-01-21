// Load environment variables from .env
require("dotenv").config();

// Basic sanity checks
console.log("Node.js working ✅");

// Log environment variables
console.log("Firebase URL:", process.env.FIREBASE_DB_URL);
console.log("Contract:", process.env.CONTRACT_ADDRESS);