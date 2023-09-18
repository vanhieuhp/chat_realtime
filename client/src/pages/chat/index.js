// client/src/pages/chat/server.js

import MessagesReceived from './messages';
import SendMessage from "./send-message";
import RoomAndUsers from "./room-and-users";
import fieldConst from "../../utils/field-const";

const Chat = ({ socket }) => {
    const userInfo = JSON.parse(localStorage.getItem(fieldConst.USER_INFO));
    if (userInfo != null && userInfo.id == null) {
        console.log("chat navigate")
        const username = userInfo.username;
        const room = userInfo.room;
        let id = null;
        socket.emit(fieldConst.JOIN_ROOM, {username, room});
        // socket.on(fieldConst.USER_ID, (userId) => {
        //     id = userId;
        //     console.log("userId", id);
        // });
    }
    return (
        <div className="flex w-[100vw] h-[100vh]">
            <div className="w-[30%]">
                <RoomAndUsers socket={socket}/>
            </div>
            <div className="w-[70%]">
                <MessagesReceived socket={socket} />
                <SendMessage socket={socket} />
            </div>
        </div>
    );
};

export default Chat;