-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: chat_realtime
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages`
(
    `id`           int unsigned  NOT NULL AUTO_INCREMENT,
    `username`     varchar(255)  NOT NULL,
    `message`      varchar(2000) NOT NULL,
    `room`         varchar(255)       DEFAULT NULL,
    `created_date` timestamp     NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 109
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages`
    DISABLE KEYS */;
INSERT INTO `messages`
VALUES (1, 'John Doe', 'Hello from JavaScript!', 'javascript', '2023-09-21 03:17:00'),
       (2, 'Jane Smith', 'Node.js is awesome!', 'node', '2023-09-21 03:17:00'),
       (3, 'Bob Johnson', 'Express.js is a great framework!', 'express', '2023-09-21 03:17:00'),
       (4, 'Alice Williams', 'React is fantastic for building UIs!', 'react', '2023-09-21 03:17:00'),
       (5, 'John Doe', 'Another message in the JavaScript room.', 'javascript', '2023-09-21 03:17:00'),
       (6, 'Jane Smith', 'Node.js questions anyone?', 'node', '2023-09-21 03:17:00'),
       (7, 'Bob Johnson', 'Let\'s discuss Express.js here.', 'express', '2023-09-21 03:17:00'),
       (8, 'Alice Williams', 'React components and props.', 'react', '2023-09-21 03:17:00'),
       (9, 'John Doe', 'Hello, I\'m new to JavaScript. Any tips?', 'javascript', '2023-09-21 03:17:00'),
       (10, 'Alice Smith', 'I\'m loving Node.js for server-side development.', 'node', '2023-09-21 03:17:00'),
       (11, 'Bob Johnson', 'Express.js makes building APIs so easy!', 'express', '2023-09-21 03:17:00'),
       (12, 'Eva Brown', 'React is amazing for building interactive UIs.', 'react', '2023-09-21 03:17:00'),
       (13, 'James Wilson', 'Anyone here familiar with ES6 features?', 'javascript', '2023-09-21 03:17:00'),
       (14, 'Linda Davis', 'How can I set up a REST API with Node.js?', 'node', '2023-09-21 03:17:00'),
       (15, 'Michael Lee', 'I\'m struggling with middleware in Express. Help?', 'express', '2023-09-21 03:17:00'),
       (16, 'Sarah Miller', 'What are the best practices for state management in React?', 'react',
        '2023-09-21 03:17:00'),
       (17, 'David Anderson', 'Any recommendations for learning JavaScript?', 'javascript', '2023-09-21 03:17:00'),
       (18, 'Karen White', 'What\'s your favorite Node.js framework?', 'node', '2023-09-21 03:17:00'),
       (19, 'William Harris', 'How do you handle authentication in Express?', 'express', '2023-09-21 03:17:00'),
       (20, 'Patricia Martin', 'React hooks are a game-changer!', 'react', '2023-09-21 03:17:00'),
       (21, 'Richard Clark', 'Is there a good tutorial on async/await in JavaScript?', 'javascript',
        '2023-09-21 03:17:00'),
       (22, 'Nancy Garcia', 'Which Node.js version is the most stable?', 'node', '2023-09-21 03:17:00'),
       (23, 'Susan Lewis', 'How can I improve the performance of my Express app?', 'express', '2023-09-21 03:17:00'),
       (24, 'Matthew Walker', 'Discussing component lifecycles in React.', 'react', '2023-09-21 03:17:00'),
       (25, 'Jennifer Hall', 'Any advice for debugging JavaScript?', 'javascript', '2023-09-21 03:17:00'),
       (26, 'Thomas Young', 'What\'s your favorite npm package?', 'node', '2023-09-21 03:17:00'),
       (27, 'Elizabeth Scott', 'What\'s talk about routing in Express.js.', 'express', '2023-09-21 03:17:00'),
       (28, 'Charles Turner', 'Building reusable components in React.', 'react', '2023-09-21 03:17:00'),
       (29, 'Jessica Rodriguez', 'How to avoid callback hell in JavaScript?', 'javascript', '2023-09-21 03:17:00'),
       (30, 'Daniel Martinez', 'What\'s the best IDE for Node.js development?', 'node', '2023-09-21 03:17:00'),
       (31, 'Lisa Wilson', 'Express.js vs. Koa.js - pros and cons?', 'express', '2023-09-21 03:17:00'),
       (32, 'Christopher Adams', 'Exploring React Router for navigation.', 'react', '2023-09-21 03:17:00'),
       (33, 'Mary Johnson', 'How to handle errors gracefully in JavaScript?', 'javascript', '2023-09-21 03:17:00'),
       (34, 'Paul Allen', 'Discussing the event loop in Node.js.', 'node', '2023-09-21 03:17:00'),
       (35, 'Karen Davis', 'Testing strategies for Express.js applications.', 'express', '2023-09-21 03:17:00'),
       (36, 'George Smith', 'Building responsive designs in React.', 'react', '2023-09-21 03:17:00'),
       (37, 'Linda Taylor', 'Tips for optimizing JavaScript code?', 'javascript', '2023-09-21 03:17:00'),
       (38, 'Mark Williams', 'What\'s your favorite Node.js ORM?', 'node', '2023-09-21 03:17:00'),
       (39, 'Betty Thomas', 'Authentication strategies in Express.js.', 'express', '2023-09-21 03:17:00'),
       (40, 'William Davis', 'Styling in React with CSS-in-JS.', 'react', '2023-09-21 03:17:00'),
       (41, 'Sandra Martinez', 'Understanding closures in JavaScript.', 'javascript', '2023-09-21 03:17:00'),
       (42, 'Kenneth Johnson', 'Websockets in Node.js for real-time apps.', 'node', '2023-09-21 03:17:00'),
       (43, 'Donna Lewis', 'Security considerations in Express.js.', 'express', '2023-09-21 03:17:00'),
       (44, 'Joseph Harris', 'State management with Redux in React.', 'react', '2023-09-21 03:17:00'),
       (45, 'Carol Jones', 'Best practices for error handling in JavaScript.', 'javascript', '2023-09-21 03:17:00'),
       (46, 'Edward Moore', 'Comparing Node.js and Deno.', 'node', '2023-09-21 03:17:00'),
       (47, 'Ruth Taylor', 'Working with middleware in Express.js.', 'express', '2023-09-21 03:17:00'),
       (48, 'Brian Clark', 'Testing React components with Jest.', 'react', '2023-09-21 03:17:00'),
       (49, 'Pamela Adams', 'JavaScript design patterns discussion.', 'javascript', '2023-09-21 03:17:00'),
       (50, 'Gary Lee', 'Choosing the right database for Node.js.', 'node', '2023-09-21 03:17:00'),
       (51, 'Deborah White', 'Building RESTful APIs with Express.js.', 'express', '2023-09-21 03:17:00'),
       (52, 'Kevin Garcia', 'React state vs. props - when to use each?', 'react', '2023-09-21 03:17:00'),
       (53, 'Sharon Davis', 'Asynchronous programming in JavaScript.', 'javascript', '2023-09-21 03:17:00'),
       (54, 'Ronald Hall', 'Working with the Node.js fs module.', 'node', '2023-09-21 03:17:00'),
       (55, 'Cynthia Scott', 'Deploying Express.js applications.', 'express', '2023-09-21 03:17:00'),
       (56, 'Jeffrey Turner', 'Managing component state in React.', 'react', '2023-09-21 03:17:00'),
       (57, 'Kathleen Smith', 'Common JavaScript interview questions.', 'javascript', '2023-09-21 03:17:00'),
       (58, 'Larry Harris', 'Express.js middleware for authentication.', 'node', '2023-09-21 03:17:00'),
       (59, 'Angela Martin', 'Optimizing Express.js for production.', 'express', '2023-09-21 03:17:00'),
       (60, 'Justin Wilson', 'React performance optimizations.', 'react', '2023-09-21 03:17:00'),
       (61, 'Teresa Clark', 'JavaScript promises and async/await explained.', 'javascript', '2023-09-21 03:17:00'),
       (62, 'Gerald Garcia', 'Handling file uploads in Node.js.', 'node', '2023-09-21 03:17:00'),
       (63, 'Janet Lewis', 'Express.js routing strategies.', 'express', '2023-09-21 03:17:00'),
       (64, 'Keith Anderson', 'Advanced React topics - hooks and context.', 'react', '2023-09-21 03:17:00'),
       (65, 'Helen Young', 'Debugging memory leaks in JavaScript.', 'javascript', '2023-09-21 03:17:00'),
       (66, 'Roy Davis', 'Node.js microservices architecture.', 'node', '2023-09-21 03:17:00'),
       (67, 'Nicole Wilson', 'Express.js error handling middleware.', 'express', '2023-09-21 03:17:00'),
       (68, 'Carl Turner', 'Server-side rendering with React.', 'react', '2023-09-21 03:17:00'),
       (69, 'Diane Rodriguez', 'JavaScript event delegation and bubbling.', 'javascript', '2023-09-21 03:17:00'),
       (70, 'Randy Martinez', 'Building RESTful APIs with Node.js and Express.', 'node', '2023-09-21 03:17:00'),
       (71, 'Virginia Taylor', 'Creating a RESTful API documentation in Express.', 'express', '2023-09-21 03:17:00'),
       (72, 'Harry Adams', 'React component patterns and best practices.', 'react', '2023-09-21 03:17:00'),
       (73, 'Mildred Johnson', 'JavaScript closures and scope.', 'javascript', '2023-09-21 03:17:00'),
       (74, 'Eugene Moore', 'Using WebSockets with Node.js.', 'node', '2023-09-21 03:17:00'),
       (75, 'Sara Scott', 'Express.js rate limiting and security.', 'express', '2023-09-21 03:17:00'),
       (76, 'Bobby White', 'Managing global state in React.', 'react', '2023-09-21 03:17:00'),
       (77, 'Judith Hall', 'JavaScript promises and handling errors.', 'javascript', '2023-09-21 03:17:00'),
       (78, 'Walter Smith', 'Scaling Node.js applications.', 'node', '2023-09-21 03:17:00'),
       (79, 'Donna Davis', 'Express.js validation and input sanitization.', 'express', '2023-09-21 03:17:00'),
       (80, 'Patrick Harris', 'React context API for state management.', 'react', '2023-09-21 03:17:00'),
       (81, 'Frances Jones', 'Understanding the this keyword in JavaScript.', 'javascript', '2023-09-21 03:17:00'),
       (82, 'Lawrence Clark', 'Node.js authentication strategies.', 'node', '2023-09-21 03:17:00'),
       (83, 'Ann Garcia', 'Express.js CORS and handling cross-origin requests.', 'express', '2023-09-21 03:17:00'),
       (84, 'Russell Turner', 'React hooks in depth.', 'react', '2023-09-21 03:17:00'),
       (85, 'Shirley Smith', 'Working with JSON data in JavaScript.', 'javascript', '2023-09-21 03:17:00'),
       (86, 'Gloria Martin', 'Node.js best practices for error handling.', 'node', '2023-09-21 03:17:00'),
       (87, 'Roger Wilson', 'Express.js file uploads with Multer.', 'express', '2023-09-21 03:17:00'),
       (88, 'Theresa Adams', 'React state management with Mobx.', 'react', '2023-09-21 03:17:00'),
       (89, 'Philip Johnson', 'Common JavaScript performance bottlenecks.', 'javascript', '2023-09-21 03:17:00'),
       (90, 'Lois Moore', 'Node.js session management.', 'node', '2023-09-21 03:17:00'),
       (91, 'Doris Taylor', 'Express.js authentication with Passport.js.', 'express', '2023-09-21 03:17:00'),
       (92, 'Jesse Young', 'React Router for client-side routing.', 'react', '2023-09-21 03:17:00'),
       (93, 'Judy Davis', 'JavaScript async functions and promises.', 'javascript', '2023-09-21 03:17:00'),
       (94, 'Benjamin Hall', 'Node.js and Docker - containerization.', 'node', '2023-09-21 03:17:00'),
       (95, 'Joan Scott', 'Express.js request and response objects.', 'express', '2023-09-21 03:17:00'),
       (96, 'Raymond Garcia', 'React component testing with Enzyme.', 'react', '2023-09-21 03:17:00'),
       (97, 'Tina Smith', 'JavaScript data structures - arrays and objects.', 'javascript', '2023-09-21 03:17:00'),
       (98, 'Bruce Turner', 'Node.js cluster module for scaling.', 'node', '2023-09-21 03:17:00'),
       (99, 'Catherine White', 'Express.js authentication with JWT.', 'express', '2023-09-21 03:17:00'),
       (100, 'Frank Adams', 'React PropTypes and type checking.', 'react', '2023-09-21 03:17:00'),
       (101, 'Grace Martinez', 'JavaScript callback functions and closures.', 'javascript', '2023-09-21 03:17:00'),
       (102, 'Carl Taylor', 'Node.js deployment strategies.', 'node', '2023-09-21 03:17:00'),
       (103, 'Tammy Clark', 'Express.js error handling best practices.', 'express', '2023-09-21 03:17:00'),
       (104, 'Jimmy Wilson', 'React context vs. Redux for state management.', 'react', '2023-09-21 03:17:00'),
       (105, 'Nancy Rodriguez', 'JavaScript async/await and promises.', 'javascript', '2023-09-21 03:17:00'),
       (106, 'Douglas Moore', 'Node.js best practices for logging.', 'node', '2023-09-21 03:17:00'),
       (107, 'Lori Harris', 'Securing Express.js APIs with OAuth2.', 'express', '2023-09-21 03:17:00'),
       (108, 'Timothy Anderson', 'React performance optimization techniques.', 'react', '2023-09-21 03:17:00');
/*!40000 ALTER TABLE `messages`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-09-21 10:22:08
