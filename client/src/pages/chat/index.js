// client/src/pages/chat/server.js

import MessagesReceived from './messages';
import SendMessage from "./send-message";
import RoomAndUsers from "./room-and-users";
import fieldConst from "../../utils/field-const";

const Chat = ({ socket }) => {
    const userInfo = JSON.parse(localStorage.getItem(fieldConst.USER_INFO));
    if (userInfo != null) {
        const username = userInfo.username;
        const room = userInfo.room;
        socket.emit(fieldConst.JOIN_ROOM, {username, room});
    }
    return (
        <div className="flex w-[100vw] h-[100vh] bg-violet-100">
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