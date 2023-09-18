// client/src/pages/chat/messages.js

import {useEffect, useRef, useState} from "react";
import fieldConst from "../../utils/field-const";
import styles from "./styles.module.css"

const Messages = ({socket}) => {
    const [messagesRecieved, setMessagesReceived] = useState([]);

    const messagesColumnRef = useRef(null); // Add this

    // Runs whenever a socket event is recieved from the server
    useEffect(() => {
        socket.on(fieldConst.RECEIVE_MESSAGE, (data) => {
            setMessagesReceived((state) => [
                ...state,
                {
                    message: data.message,
                    username: data.username,
                    createdDate: data.created_date,
                },
            ]);
        });

        // Remove event listener on component unmount
        return () => socket.off(fieldConst.RECEIVE_MESSAGE);
    }, [socket]);

    // Add this
    useEffect(() => {
        // Last 100 messages sent in the chat room (fetched from the db in backend)
        socket.on(fieldConst.LAST_100_MESSAGES, (last100Messages) => {
            // Sort these messages by __createdtime__
            last100Messages = sortMessagesByDate(last100Messages);
            setMessagesReceived((state) => [...last100Messages, ...state]);
        });

        return () => socket.off(fieldConst.LAST_100_MESSAGES);
    }, [socket]);

    // Add this
    // Scroll to the most recent message
    useEffect(() => {
        messagesColumnRef.current.scrollTop =
            messagesColumnRef.current.scrollHeight;
    }, [messagesRecieved]);

    // Add this
    function sortMessagesByDate(messages) {
        return messages.sort(
            (a, b) => parseInt(a.created_date) - parseInt(b.created_date)
        );
    }

    function formatDateFromTimestamp(timestamp) {
        const options_date = {
            day: '2-digit',
            month: 'short',
            hour: '2-digit',
            minute: '2-digit'
        };
        const options_time = {
            hour: '2-digit',
            minute: '2-digit'
        };
        const date = new Date(timestamp);
        const currentDate = new Date();
        const timeDifference = currentDate - date; // Calculate the time difference in milliseconds

        if (timeDifference < 24 * 60 * 60 * 1000) {
            return date.toLocaleTimeString('en-US', options_time);
        } else {
            return date.toLocaleDateString('en-US', options_date);
        }
    }

    return (
        // Add ref to this div
        <div className={styles.messagesColumn} ref={messagesColumnRef}>
            {messagesRecieved.map((msg, i) => (
                <div className="mt-[20px] flex" key={i}>
                    <div className="bg-amber-500 w-fit px-[20px] py-[10px] rounded-[50%] h-fit mr-[10px]">
                        {msg.username.at(0)}
                    </div>
                    <div className="bg-[#F2F2F7] flex flex-col w-[45%] rounded-3xl px-[10px] py-[10px]">
                        <span className="font-bold text-start">{msg.username}</span>
                        <p className="text-start">{msg.message}</p>
                        <span className="text-end">{formatDateFromTimestamp(msg.created_date)}</span>
                    </div>
                </div>
            ))}
        </div>
    );
};

export default Messages;