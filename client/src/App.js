import './App.css';
import {Route, Routes} from 'react-router-dom';
import Home from './pages/home';
import Chat from './pages/chat';
import io from 'socket.io-client';
// import dotenv from "dotenv";
// dotenv.config();
// const apiKey = process.env.SERVER;
// console.log(apiKey);
const socket = io.connect("http://13.229.230.179:4000");

function App() {
    console.log("APP RUNNING!")
    return (
        <div className='App'>
            <Routes>
                <Route path='/chat' element={<Chat socket={socket}/>} />
                <Route path='/' element={<Home socket={socket} />} />
            </Routes>
        </div>
    );
}

export default App;
