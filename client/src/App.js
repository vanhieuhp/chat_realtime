import './App.css';
import {Route, Routes} from 'react-router-dom';
import Home from './pages/home';
import Chat from './pages/chat';
import io from 'socket.io-client';

const socket = io.connect('http://localhost:4000');

function App() {
    console.log("APP RUNNING!")
    return (
        <div className='App'>
            <Routes>
                <Route path='/chat' element={<Chat socket={socket}/>} />
                <Route path='/home' element={<Home socket={socket} />} />
            </Routes>
        </div>
    );
}

export default App;
