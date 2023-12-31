create database chat_realtime;
use chat_realtime;
CREATE TABLE messages (
                       id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       message VARCHAR(2000) NOT NULL,
                       room VARCHAR(255),
                       created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO messages (username, message, room)
VALUES
    ("John Doe", "Hello from JavaScript!", "javascript"),
    ("Jane Smith", "Node.js is awesome!", "node"),
    ("Bob Johnson", "Express.js is a great framework!", "express"),
    ("Alice Williams", "React is fantastic for building UIs!", "react"),
    ("John Doe", "Another message in the JavaScript room.", "javascript"),
    ("Jane Smith", "Node.js questions anyone?", "node"),
    ("Bob Johnson", "Let\'s discuss Express.js here.", "express"),
    ("Alice Williams", "React components and props.", "react"),
    ("John Doe", "Hello, I'm new to JavaScript. Any tips?", "javascript"),
    ("Alice Smith", "I'm loving Node.js for server-side development.", "node"),
    ("Bob Johnson", "Express.js makes building APIs so easy!", "express"),
    ("Eva Brown", "React is amazing for building interactive UIs.", "react"),
    ("James Wilson", "Anyone here familiar with ES6 features?", "javascript"),
    ("Linda Davis", "How can I set up a REST API with Node.js?", "node"),
    ("Michael Lee", "I'm struggling with middleware in Express. Help?", "express"),
    ("Sarah Miller", "What are the best practices for state management in React?", "react"),
    ("David Anderson", "Any recommendations for learning JavaScript?", "javascript"),
    ("Karen White", "What's your favorite Node.js framework?", "node"),
    ("William Harris", "How do you handle authentication in Express?", "express"),
    ("Patricia Martin", "React hooks are a game-changer!", "react"),
    ("Richard Clark", "Is there a good tutorial on async/await in JavaScript?", "javascript"),
    ("Nancy Garcia", "Which Node.js version is the most stable?", "node"),
    ("Susan Lewis", "How can I improve the performance of my Express app?", "express"),
    ("Matthew Walker", "Discussing component lifecycles in React.", "react"),
    ("Jennifer Hall", "Any advice for debugging JavaScript?", "javascript"),
    ("Thomas Young", "What's your favorite npm package?", "node"),
    ("Elizabeth Scott", "What's talk about routing in Express.js.", "express"),
    ("Charles Turner", "Building reusable components in React.", "react"),
    ("Jessica Rodriguez", "How to avoid callback hell in JavaScript?", "javascript"),
    ("Daniel Martinez", "What's the best IDE for Node.js development?", "node"),
    ("Lisa Wilson", "Express.js vs. Koa.js - pros and cons?", "express"),
    ("Christopher Adams", "Exploring React Router for navigation.", "react"),
    ("Mary Johnson", "How to handle errors gracefully in JavaScript?", "javascript"),
    ("Paul Allen", "Discussing the event loop in Node.js.", "node"),
    ("Karen Davis", "Testing strategies for Express.js applications.", "express"),
    ("George Smith", "Building responsive designs in React.", "react"),
    ("Linda Taylor", "Tips for optimizing JavaScript code?", "javascript"),
    ("Mark Williams", "What's your favorite Node.js ORM?", "node"),
    ("Betty Thomas", "Authentication strategies in Express.js.", "express"),
    ("William Davis", "Styling in React with CSS-in-JS.", "react"),
    ("Sandra Martinez", "Understanding closures in JavaScript.", "javascript"),
    ("Kenneth Johnson", "Websockets in Node.js for real-time apps.", "node"),
    ("Donna Lewis", "Security considerations in Express.js.", "express"),
    ("Joseph Harris", "State management with Redux in React.", "react"),
    ("Carol Jones", "Best practices for error handling in JavaScript.", "javascript"),
    ("Edward Moore", "Comparing Node.js and Deno.", "node"),
    ("Ruth Taylor", "Working with middleware in Express.js.", "express"),
    ("Brian Clark", "Testing React components with Jest.", "react"),
    ("Pamela Adams", "JavaScript design patterns discussion.", "javascript"),
    ("Gary Lee", "Choosing the right database for Node.js.", "node"),
    ("Deborah White", "Building RESTful APIs with Express.js.", "express"),
    ("Kevin Garcia", "React state vs. props - when to use each?", "react"),
    ("Sharon Davis", "Asynchronous programming in JavaScript.", "javascript"),
    ("Ronald Hall", "Working with the Node.js fs module.", "node"),
    ("Cynthia Scott", "Deploying Express.js applications.", "express"),
    ("Jeffrey Turner", "Managing component state in React.", "react"),
    ("Kathleen Smith", "Common JavaScript interview questions.", "javascript"),
    ("Larry Harris", "Express.js middleware for authentication.", "node"),
    ("Angela Martin", "Optimizing Express.js for production.", "express"),
    ("Justin Wilson", "React performance optimizations.", "react"),
    ("Teresa Clark", "JavaScript promises and async/await explained.", "javascript"),
    ("Gerald Garcia", "Handling file uploads in Node.js.", "node"),
    ("Janet Lewis", "Express.js routing strategies.", "express"),
    ("Keith Anderson", "Advanced React topics - hooks and context.", "react"),
    ("Helen Young", "Debugging memory leaks in JavaScript.", "javascript"),
    ("Roy Davis", "Node.js microservices architecture.", "node"),
    ("Nicole Wilson", "Express.js error handling middleware.", "express"),
    ("Carl Turner", "Server-side rendering with React.", "react"),
    ("Diane Rodriguez", "JavaScript event delegation and bubbling.", "javascript"),
    ("Randy Martinez", "Building RESTful APIs with Node.js and Express.", "node"),
    ("Virginia Taylor", "Creating a RESTful API documentation in Express.", "express"),
    ("Harry Adams", "React component patterns and best practices.", "react"),
    ("Mildred Johnson", "JavaScript closures and scope.", "javascript"),
    ("Eugene Moore", "Using WebSockets with Node.js.", "node"),
    ("Sara Scott", "Express.js rate limiting and security.", "express"),
    ("Bobby White", "Managing global state in React.", "react"),
    ("Judith Hall", "JavaScript promises and handling errors.", "javascript"),
    ("Walter Smith", "Scaling Node.js applications.", "node"),
    ("Donna Davis", "Express.js validation and input sanitization.", "express"),
    ("Patrick Harris", "React context API for state management.", "react"),
    ("Frances Jones", "Understanding the this keyword in JavaScript.", "javascript"),
    ("Lawrence Clark", "Node.js authentication strategies.", "node"),
    ("Ann Garcia", "Express.js CORS and handling cross-origin requests.", "express"),
    ("Russell Turner", "React hooks in depth.", "react"),
    ("Shirley Smith", "Working with JSON data in JavaScript.", "javascript"),
    ("Gloria Martin", "Node.js best practices for error handling.", "node"),
    ("Roger Wilson", "Express.js file uploads with Multer.", "express"),
    ("Theresa Adams", "React state management with Mobx.", "react"),
    ("Philip Johnson", "Common JavaScript performance bottlenecks.", "javascript"),
    ("Lois Moore", "Node.js session management.", "node"),
    ("Doris Taylor", "Express.js authentication with Passport.js.", "express"),
    ("Jesse Young", "React Router for client-side routing.", "react"),
    ("Judy Davis", "JavaScript async functions and promises.", "javascript"),
    ("Benjamin Hall", "Node.js and Docker - containerization.", "node"),
    ("Joan Scott", "Express.js request and response objects.", "express"),
    ("Raymond Garcia", "React component testing with Enzyme.", "react"),
    ("Tina Smith", "JavaScript data structures - arrays and objects.", "javascript"),
    ("Bruce Turner", "Node.js cluster module for scaling.", "node"),
    ("Catherine White", "Express.js authentication with JWT.", "express"),
    ("Frank Adams", "React PropTypes and type checking.", "react"),
    ("Grace Martinez", "JavaScript callback functions and closures.", "javascript"),
    ("Carl Taylor", "Node.js deployment strategies.", "node"),
    ("Tammy Clark", "Express.js error handling best practices.", "express"),
    ("Jimmy Wilson", "React context vs. Redux for state management.", "react"),
    ("Nancy Rodriguez", "JavaScript async/await and promises.", "javascript"),
    ("Douglas Moore", "Node.js best practices for logging.", "node"),
    ("Lori Harris", "Securing Express.js APIs with OAuth2.", "express"),
    ("Timothy Anderson", "React performance optimization techniques.", "react");


