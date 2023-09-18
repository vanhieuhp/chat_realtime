// client/src/pages/chat/server.js

import MessagesReceived from './messages';
import SendMessage from "./send-message";
import RoomAndUsers from "./room-and-users";
import fieldConst from "../../utils/field-const";
import {UserState} from "../../context/UserProvider";

const Chat = ({ socket }) => {
    const {room, setRoom, username, setUsername} = UserState();
    if (room !== undefined || username !== undefined) {
        socket.emit(fieldConst.JOIN_ROOM, {username, room});
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