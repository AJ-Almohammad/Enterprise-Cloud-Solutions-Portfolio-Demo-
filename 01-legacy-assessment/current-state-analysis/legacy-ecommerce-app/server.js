// Legacy E-commerce Application - Assessment Target
// This represents a typical legacy system needing cloud migration

const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());
app.use(cors());
app.use(express.static("public"));

// Legacy Database Connection (Single Instance - No Failover)
const db = mysql.createConnection({
    host: "localhost",
    user: "root", 
    password: "password123",
    database: "legacy_ecommerce"
});

// Legacy API Endpoints (Monolithic Structure)
app.get("/api/products", (req, res) => {
    const query = "SELECT * FROM products";
    db.query(query, (err, results) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ error: "Database connection failed" });
        }
        res.json(results);
    });
});

app.post("/api/orders", (req, res) => {
    const { customer_id, product_id, quantity } = req.body;
    const query = "INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES (?, ?, ?, NOW())";
    
    db.query(query, [customer_id, product_id, quantity], (err, result) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ error: "Order creation failed" });
        }
        res.json({ message: "Order created successfully", orderId: result.insertId });
    });
});

// Legacy Authentication (Insecure - Shows Migration Needs)
app.post("/api/login", (req, res) => {
    const { username, password } = req.body;
    // WARNING: Plain text password - Security Issue for assessment!
    const query = "SELECT * FROM users WHERE username = ? AND password = ?";
    
    db.query(query, [username, password], (err, results) => {
        if (err || results.length === 0) {
            return res.status(401).json({ error: "Invalid credentials" });
        }
        res.json({ message: "Login successful", user: results[0] });
    });
});

// Start server
app.listen(PORT, () => {
    console.log(`Legacy E-commerce Server running on port ${PORT}`);
    console.log("WARNING: Legacy system with security vulnerabilities");
    console.log("Needs cloud migration and modernization");
});