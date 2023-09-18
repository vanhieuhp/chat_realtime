const express = require("express");
const app = express();
const http = require("http");
const cors = require("cors");
const { Server } = require("socket.io");
const fieldConst = require("./utils/field-const")
require('dotenv').config();

app.use(cors()); //Add cors middleware
const server = http.createServer(app);
const msgService = require('./services/message');
const leaveRoom = require("./utils/leave-room");

const io = new Server(server, {
    cors: {
        origin: "http://localhost:3000",
        methods: ["GET", "POST"]
    }
})

let chatRoom = ""
let allUsers = [];
io.on(fieldConst.CONNECTION, (socket) => {
    console.log(`User connected ${socket.id}`)

    socket.on(fieldConst.JOIN_ROOM,  async (data) => {
        const { username, room } = data;
        socket.join(room);

        let created_date = Date.now();
        socket.to(room).emit(fieldConst.RECEIVE_MESSAGE, {
            message: `${username} has joined the chat room`,
            username: fieldConst.CHAT_BOT,
            created_date,
        })

        socket.emit(fieldConst.RECEIVE_MESSAGE, {
            message: `Welcome ${username}`,
            username: fieldConst.CHAT_BOT,
            created_date
        })

        socket.emit(fieldConst.USER_ID, {
            id: socket.id,
        })
        chatRoom = room;
        allUsers.push({id: socket.id, username: username, room});
        let chatRoomUsers = allUsers.filter((user) => user.room === room);
        socket.to(room).emit(fieldConst.CHAT_ROOM_USERS, chatRoomUsers);
        socket.emit(fieldConst.CHAT_ROOM_USERS, chatRoomUsers);

        const last100Messages = await msgService.getAllMessages(room, 100);
        if (last100Messages != null) {
            socket.emit(fieldConst.LAST_100_MESSAGES, last100Messages);
        }
    })

    socket.on(fieldConst.SEND_MESSAGE, async (data) => {
        const { message, username, room } = data;
        io.in(room).emit(fieldConst.RECEIVE_MESSAGE, data);
        const response= await msgService.createMessage(username, message, room);
        console.log(`${username} send message to ${room}: ${response}`)
    })


    socket.on(fieldConst.LEAVE_ROOM, async (data) => {
        const { username, room } = data;
        socket.leave(room);
        const createdDate = Date.now();

        // remove user from memory
        allUsers = leaveRoom(socket.id, allUsers);
        socket.to(room).emit(fieldConst.CHAT_ROOM_USERS, allUsers);
        socket.to(room).emit(fieldConst.RECEIVE_MESSAGE, {
            username: fieldConst.CHAT_BOT,
            message: `${username} has left the chat`,
            createdDate
        })
        console.log(`${username} has left the chat`);
    })

    socket.on(fieldConst.DISCONNECT, () => {
        console.log("User disconnected from the chat");
        const user = allUsers.find((user) => user.id === socket.id)
        if (user?.username) {
            allUsers = leaveRoom(socket.id, allUsers);
            socket.to(chatRoom).emit(fieldConst.CHAT_ROOM_USERS, allUsers);
            socket.to(chatRoom).emit(fieldConst.RECEIVE_MESSAGE, {
                message: `${user.username} has disconnected from the chat!`
            })
        }
    })
})

server.listen(4000, () => "Server is running on port 4000");
