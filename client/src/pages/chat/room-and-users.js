// client/src/pages/chat/room-and-users.js

import {useState, useEffect} from 'react';
import {useNavigate} from 'react-router-dom';
import {UserState} from "../../context/UserProvider";
import fieldConst from "../../utils/field-const";
import FieldConst from "../../utils/field-const";

const RoomAndUsers = ({socket}) => {
    const {room, setRoom, username, setUsername} = UserState();

    const [roomUsers, setRoomUsers] = useState([]);
    const navigate = useNavigate();

    useEffect(() => {
        socket.on(fieldConst.CHAT_ROOM_USERS, (data) => {
            setRoomUsers(data);
        })

        return () => socket.off(fieldConst.CHAT_ROOM_USERS);
    }, [socket]);

    const leaveRoom = () => {
        const createdDate = Date.now();
        socket.emit(fieldConst.LEAVE_ROOM, {username, room, createdDate});
        localStorage.removeItem(FieldConst.USER_INFO);
        setRoom(undefined);
        setUsername(undefined)
        // Redirect to home page
        navigate("/", {replace: true})
    }

    return (<div className="flex flex-col items-center py-[50px] h-[100vh] bg-violet-500">
        <div className="h-[90%]">
            <h2 className="font-bold text-5xl mb-[50px] text-white">{room}</h2>
            <div> {roomUsers.length > 0}
                <div className="font-bold text-3xl text-white">Users:</div>
                <ul className="">
                    {roomUsers.map((user) => (
                        <li className="text-xl text-white"
                            key={user.id}
                            style={{
                                fontWeight: user.username === username ? 'bold' : 'normal',
                            }}
                        >
                            {user.username}
                        </li>
                    ))}
                </ul>
            </div>
        </div>
        <button className='bg-white w-fit px-[20px] py-[10px] rounded-2xl hover:opacity-80 transition'
                onClick={leaveRoom}>
            Leave room
        </button>
    </div>);
};

export default RoomAndUsers;