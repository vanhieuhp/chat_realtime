// client/src/pages/home/server.js

import {useNavigate} from "react-router-dom";
import {useState} from "react";
import {UserState} from "../../context/UserProvider";
import styles from "./styles.module.css"
import LoadingPage from "./loadpage";

const fieldConst = require("../../utils/field-const")
const localStorage = window.localStorage;

const Home = ({socket}) => {
    let loading = false;
    const {room, setRoom, username, setUsername} = UserState();
    const userInfo = JSON.parse(localStorage.getItem(fieldConst.USER_INFO));
    const navigate = useNavigate(); // Add this
    if (userInfo != null) {
        loading = true;
    }
    if (room !== undefined && username !== undefined && userInfo != null) {
        setTimeout(() => {
            navigate("/chat", { replace: true }); // Add this
        }, 2000); // Delay for 1 second (1000 milliseconds)
    }
    const joinRoom = async () => {
        if (room !== undefined && username !== undefined) {
            // save into local-storage
            const dataToStore = {
                username: username,
                room: room,
            }
            localStorage.setItem(fieldConst.USER_INFO, JSON.stringify(dataToStore));
            navigate("/chat", { replace: true }); // Add this
        }
    }
    const [isShowRoomOption, setIsShowRoomOption] = useState(false);
    const [roomSelected, setRoomSelected] = useState("Select Room");

    function showRoomOption() {
        setIsShowRoomOption(!isShowRoomOption)
    }

    function selectOption(value) {
        if (value !== undefined) {
            setIsShowRoomOption(!isShowRoomOption)
            setRoomSelected(value)
            setRoom(value)
        }
    }

    const roomOptions = ["JavaScript", "Node", "Express", "React"];
    return (<div className="flex justify-center items-center w-[100vw] h-[100vh]">
        <div className="flex flex-col bg-[#77337f] items-center w-[50%] min-h-[500px] rounded-2xl h-[80%] p-[50px]">
            <div className="flex flex-col w-[100%] h-[80%]">
                <h1 className="font-bold text-3xl text-white mb-[20px]">{`Chat Room`}</h1>
                <input className="py-[10px] my-[10px] rounded-xl px-[20px] focus:bg-none w-[100%]"
                       placeholder='Username...'
                       onChange={(e) => setUsername(e.target.value)} //Add this
                />

                <div id={"Room_Type"}
                     className="w-[100%] cursor-pointer flex flex-col bg-white mb-[20px] rounded-2xl overflow-hidden">
                    <div onClick={() => showRoomOption()} className={styles.roomSelect}>{roomSelected}</div>
                    {isShowRoomOption && (<div className={styles.roomOptions}>
                        {roomOptions.map((option, index) => (
                            <div key={index} onClick={() => selectOption(option)} className={styles.roomSelect}>
                                {option}
                            </div>))}
                    </div>)}
                </div>
            </div>
            <div>
                <button className='bg-white w-fit px-[20px] py-[10px] rounded-2xl hover:opacity-80 transition'
                        onClick={joinRoom}
                >Join Room
                </button>
            </div>
        </div>
        {loading ?
            (<div className="fixed w-[100%] h-[100%]">
                <LoadingPage/>
            </div>) :
            (<div></div>)
        }

    </div>);
};

export default Home;