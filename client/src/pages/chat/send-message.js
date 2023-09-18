import styles from "./styles.module.css"
import React, {useState} from "react";
import {UserState} from "../../context/UserProvider";

const SendMessage = ({socket}) => {
    const {room, setRoom, username, setUsername} = UserState();
    const [message, setMessage] = useState('');

    const sendMessage = () => {
        if (message !== "") {
            socket.emit("send_message", {username, room, message});
            setMessage("");
        }
    }

    return (
        <div className="py-[16px] px-[20px]">
            <input
                className={styles.messageInput}
                placeholder='Message...'
                onChange={(e) => setMessage(e.target.value)}
                value={message}
            />
            <button className='bg-[#8C67F6] hover:opacity-90 text-white font-bold px-[20px] py-[10px] w-fit rounded-2xl ' onClick={sendMessage}>
                Send
            </button>
        </div>
    );
};

export default SendMessage;



