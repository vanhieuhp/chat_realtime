const mysql = require('mysql2/promise');
const bluebird = require('bluebird');
require('dotenv').config();

const configConnection = {
    host: process.env.DB_URL,        // Replace with your MySQL host
    port: 3306,
    user: process.env.DB_USERNAME,     // Replace with your MySQL username
    password: process.env.DB_PW, // Replace with your MySQL password
    database: process.env.DB_NAME, // Replace with your MySQL database name
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    Promise: bluebird
}

// Function to create a new message
async function createMessage(username, message, room) {
    const connection = await mysql.createConnection(configConnection);
    const query = 'INSERT INTO messages (username, message, room) VALUES (?, ?, ?)';
    const values = [username, message, room];

    const [result] = await connection.execute(query, values);
    return result != null;
}

// Function to retrieve all messages from a room
// const query = 'SELECT * FROM messages WHERE room = ? LIMIT ?'
// const values = [room, number]
async function getAllMessages(room, number) {
    const connection = await mysql.createConnection(configConnection);
    const query = `SELECT * FROM messages WHERE room = "${room}" LIMIT ${number}`;
    const [rows] = await connection.execute(query);
    return rows;
}

module.exports = {
    createMessage,
    getAllMessages,
    // updateMessage,
    // deleteMessage,
    // closeConnection,
};
