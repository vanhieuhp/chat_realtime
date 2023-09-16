import styles from "./styles.module.css"
import React, {useState} from "react";
import {UserState} from "../../context/UserProvider";

const SendMessage = ({socket}) => {
    const {room, setRoom, username, setUsername} = UserState();
    const [message, setMessage] = useState('');

    const sendMessage = () => {
        if (message !== "") {
            const createdDate = Date.now();

            socket.emit("send_message", {username, room, message, createdDate});
            setMessage("");
        }
    }

    return (
        <div className={styles.sendMessageContainer}>
            <input
                className={styles.messageInput}
                placeholder='Message...'
                onChange={(e) => setMessage(e.target.value)}
                value={message}
            />
            <button className='btn btn-primary' onClick={sendMessage}>
                Send Message
            </button>
        </div>
    );
};

export default SendMessage;



