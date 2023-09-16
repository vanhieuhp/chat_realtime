// client/src/pages/chat/messages.js

import {useEffect, useRef, useState} from 'react';
import fieldConst from "../../utils/field-const";

const Messages = ({ socket }) => {
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

    // dd/mm/yyyy, hh:mm:ss
    function formatDateFromTimestamp(timestamp) {
        const date = new Date(timestamp);
        return date.toLocaleString();
    }

    return (
        // Add ref to this div
        <div className="py-[20px]" ref={messagesColumnRef}>
            {messagesRecieved.map((msg, i) => (
                <div className="bg-amber-100" key={i}>
                    <div className="">
                        <span className="">{msg.username}</span>
                        <span className="">{formatDateFromTimestamp(msg.created_date)}</span>
                    </div>
                    <p className="">{msg.message}</p>
                    <br />
                </div>
            ))}
        </div>
    );
};

export default Messages;