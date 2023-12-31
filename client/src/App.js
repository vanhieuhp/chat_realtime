import './App.css';
import {Route, Routes} from 'react-router-dom';
import Home from './pages/home';
import Chat from './pages/chat';
import io from 'socket.io-client';
import env from "react-dotenv";
const socket = io.connect(env.SERVER_URL);

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
