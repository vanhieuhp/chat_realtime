import {useNavigate} from "react-router-dom";
import fieldConst from "../utils/field-const";

const { createContext, useState, useEffect, useContext } = require("react")

const UserContext = createContext();

const UserProvider = ({ children }) => {
    const [username, setUsername] = useState();
    const [room, setRoom] = useState();
    const navigate = useNavigate(); // Add this

    const userInfo = JSON.parse(localStorage.getItem(fieldConst.USER_INFO));
    useEffect(() => {
        if (userInfo !== null) {
            console.log("use state")
            // setUsername(userInfo.username);
            // setRoom(userInfo.room);
            // navigate("/chat", { replace: true }); // Add this
        } else {
            // navigate("/home", { replace: true }); // Add this
        }
    }, [userInfo]);

    return (
        <UserContext.Provider value={{
            username, setUsername, room, setRoom
        }}>
            {children}
        </UserContext.Provider>
    )

}

export const UserState = () => {

    return useContext(UserContext)
}


export default UserProvider;