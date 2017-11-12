-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 12 2017 г., 03:03
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `SchoolERP`
--

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `active`) VALUES
(1, 'Cybersecurity (Koishybayev I.) 2016-2017/2', 'Cybersecurity is the body of technologies, processes and practices designed to protect networks, computers, programs and data from attack, damage or unauthorized access. In a computing context, security includes both cybersecurity and physical security.', 1),
(2, 'Development of mobile applications for Android (Mobile 1) () 2016-2017/2', 'Picking the right choice to Mobile App Development is an important success factor that can boost your project. Lets take a glance on our services.', 1),
(3, 'Networking and Security (SDP 9) (Kozhamzharova D.H.) 2016-2017/2\n', 'Network Security is the process of taking physical and software preventative measures to protect the underlying networking infrastructure from unauthorized access, misuse, malfunction, modification, destruction, or improper disclosure.', 1),
(4, 'Project Management (SDP 8) (Moldagulova A.N.) 2016-2017/2\n', 'Project management is the discipline of initiating, planning, executing, controlling, and closing the work of a team to achieve specific goals and meet specific success criteria.', 1),
(5, 'Database and Client/Server Applications (SDP 6) (Satybaldiyeva R. Zh.) 2016-2017/1\n', 'The client-server model is a distributed application structure that partitions tasks or workloads ... The customer\'s login credentials may be stored in a database, and the web server accesses the database server as a client.', 1),
(6, 'Schematics (Sariev K.A.) 2015-2016/2', 'A schematic, or schematic diagram, is a representation of the elements of a system using abstract, graphic symbols rather than realistic pictures.', 1),
(7, 'WEB-technlogoies (Altaibek A.A.) 2015-2016/2\n', 'While the terms \"web developer\" and \"web designer\" are often used synonymously, they do not mean the same thing. Technically, a web designer only designs website interfaces using HTML and CSS. A web developer may be involved in designing a website.', 1),
(8, 'Data structures and algorithms SDP-4 (Orazbelov S.) 2015-2016/2\n', 'Data Structures - Algorithms Basics. Algorithm is a step-by-step procedure, which defines a set of instructions to be executed in a certain order to get the desired output. Algorithms are generally created independent of underlying languages, i.e.', 1),
(9, 'Ecology (Davletova Sholpan) 2015-2016/2\r\n', 'Ecology (from Greek: ?????, \"house\", or \"environment\"; -?????, \"study of\") is the scientific analysis and study of interactions among organisms and their environment. It is an interdisciplinary field that includes biology, geography, and Earth science.', 1),
(10, 'Physics (Kunakov S.K.) 2015-2016/2\r\n', 'knowledge of nature\", from ????? phúsis \"nature\") is the natural science that involves the study of matter and its motion and behavior through space and time, along with related concepts such as energy and force.', 1),
(11, 'Data security and protection(Moldagulova A.N) 2016-2017/2', 'Data security and protection - it is a one of the main aspects in process of developing.', 1),
(12, 'Data manning', 'njsbdasbfjj', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `courses_users`
--

CREATE TABLE `courses_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `courses_users`
--

INSERT INTO `courses_users` (`id`, `user_id`, `course_id`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 2),
(4, 1, 5),
(5, 1, 10),
(6, 2, 7),
(7, 1, 8),
(10, 3, 11),
(11, 1, 11),
(12, 1, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `exams`
--

INSERT INTO `exams` (`id`, `user_id`, `created_date`) VALUES
(16, 1, '2017-06-04 13:09:56'),
(17, 1, '2017-06-04 13:12:03'),
(18, 1, '2017-06-05 03:27:19'),
(19, 1, '2017-06-05 03:35:09');

-- --------------------------------------------------------

--
-- Структура таблицы `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(10) NOT NULL,
  `question` longtext NOT NULL,
  `answer_one` longtext NOT NULL,
  `answer_two` longtext NOT NULL,
  `answer_three` longtext NOT NULL,
  `answer_four` longtext NOT NULL,
  `correct_answer_value` int(10) NOT NULL,
  `user_answer_value` int(10) NOT NULL,
  `is_correct` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `exam_id`, `question`, `answer_one`, `answer_two`, `answer_three`, `answer_four`, `correct_answer_value`, `user_answer_value`, `is_correct`) VALUES
(11, 13, 'Define a verification in reconnaissance', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 4, 4, 1),
(12, 13, 'Distinction between direct and indirect transfers', 'direct transfers use relative offsets, indirect transfers are absolute', 'direct transfers are absolute, indirect transfers use relative offsets', 'direct transfers use fixed offsets, indirect transfers are not absolute', 'direct transfers are not absolute, indirect transfers use fixed offsets', 1, 3, 2),
(13, 13, 'Define OWASP', 'Open Web Application Security Program', 'Open Wide Application Security Program', 'Open Wide Application Security Project', 'Open Web Application Security Project', 4, 4, 1),
(14, 13, 'Distinction between jumps and calls', 'there is no destinction between jumps and calls', 'jumps used to implement procedures, calls simply transfer control with side effects', 'jumps simply transfer control with no side effects, calls used to implement procedures', 'jumps simply transfer control with side effects, calls used to implement transfers', 3, 3, 1),
(15, 13, 'Dissasembling', 'Preservers a symbol table entity', 'The process of recovering assembly from machine code', 'The process of deallocating arguments on the stack', 'All of the above', 2, 2, 1),
(16, 13, 'Caller:', 'registers that must not be clobbered', 'procedure invoked by another function', 'code that invokes a procedure', 'none of the above', 3, 3, 1),
(17, 13, 'Define foot printing', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 2, 2, 1),
(18, 13, 'Callee:', 'all of the above', 'procedure invoked by another function', 'code that invokes a procedure', 'deallocates arguments on stack after return', 2, 2, 1),
(19, 13, 'How old are you?', '20', '21', '22', '18', 1, 1, 1),
(20, 13, 'What does register ?rip? store?', 'Condition flags', 'Program counter', 'Frame pointer', 'Stack pointer', 2, 2, 1),
(21, 16, 'Standards (calling conventions) exist for:', 'none of the above', 'specify the caller and callee?s responsibilities', 'specify where arguments are passed (registers, stack)', 'all of the above', 4, 4, 1),
(22, 16, 'Distinction between jumps and calls', 'there is no destinction between jumps and calls', 'jumps used to implement procedures, calls simply transfer control with side effects', 'jumps simply transfer control with no side effects, calls used to implement procedures', 'jumps simply transfer control with side effects, calls used to implement transfers', 3, 3, 1),
(23, 16, 'What does register ?rip? store?', 'Condition flags', 'Program counter', 'Frame pointer', 'Stack pointer', 2, 2, 1),
(24, 16, 'Define intelligent gathering', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 1, 1, 1),
(25, 16, 'Which of the following GDB commands puts breakpoints at the beginning of the program?', 'b N', 'b +N', 'b main', 'into break', 3, 3, 1),
(26, 16, 'Caller:', 'registers that must not be clobbered', 'procedure invoked by another function', 'code that invokes a procedure', 'none of the above', 3, 3, 1),
(27, 16, 'Where are you from?', 'Almaty', 'Aktobe', 'Shymkent', 'Taldykorgan', 3, 3, 1),
(28, 16, 'Distinction between direct and indirect transfers', 'direct transfers use relative offsets, indirect transfers are absolute', 'direct transfers are absolute, indirect transfers use relative offsets', 'direct transfers use fixed offsets, indirect transfers are not absolute', 'direct transfers are not absolute, indirect transfers use fixed offsets', 1, 2, 2),
(29, 16, 'How old are you?', '20', '21', '22', '18', 1, 3, 2),
(30, 16, 'Give the description of Mem(rsp)Succ(rip)', 'pop successor into rip', 'store successor', 'jump to address', 'jump to successor', 3, 2, 2),
(31, 17, 'Callee:', 'all of the above', 'procedure invoked by another function', 'code that invokes a procedure', 'deallocates arguments on stack after return', 2, 2, 1),
(32, 17, 'Define intelligent gathering', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 1, 2, 2),
(33, 17, 'Define a verification in reconnaissance', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 4, 1, 2),
(34, 17, 'Which of the following GDB commands puts breakpoints at the beginning of the program?', 'b N', 'b +N', 'b main', 'into break', 3, 3, 1),
(35, 17, 'Dissasembling', 'Preservers a symbol table entity', 'The process of recovering assembly from machine code', 'The process of deallocating arguments on the stack', 'All of the above', 2, 2, 1),
(36, 17, 'How old are you?', '20', '21', '22', '18', 1, 1, 1),
(37, 17, 'Caller:', 'registers that must not be clobbered', 'procedure invoked by another function', 'code that invokes a procedure', 'none of the above', 3, 3, 1),
(38, 17, 'Define foot printing', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 2, 2, 1),
(39, 17, 'Where are you from?', 'Almaty', 'Aktobe', 'Shymkent', 'Taldykorgan', 3, 3, 1),
(40, 17, 'Distinction between jumps and calls', 'there is no destinction between jumps and calls', 'jumps used to implement procedures, calls simply transfer control with side effects', 'jumps simply transfer control with no side effects, calls used to implement procedures', 'jumps simply transfer control with side effects, calls used to implement transfers', 3, 3, 1),
(41, 18, 'Define OWASP', 'Open Web Application Security Program', 'Open Wide Application Security Program', 'Open Wide Application Security Project', 'Open Web Application Security Project', 4, 2, 2),
(42, 18, 'Dissasembling', 'Preservers a symbol table entity', 'The process of recovering assembly from machine code', 'The process of deallocating arguments on the stack', 'All of the above', 2, 4, 2),
(43, 18, 'Standards (calling conventions) exist for:', 'none of the above', 'specify the caller and callee?s responsibilities', 'specify where arguments are passed (registers, stack)', 'all of the above', 4, 0, 2),
(44, 18, 'Where are you from?', 'Almaty', 'Aktobe', 'Shymkent', 'Taldykorgan', 3, 0, 2),
(45, 18, 'How old are you?', '20', '21', '22', '18', 1, 0, 2),
(46, 18, 'Give the description of Mem(rsp)Succ(rip)', 'pop successor into rip', 'store successor', 'jump to address', 'jump to successor', 3, 0, 2),
(47, 18, 'Which of the following GDB commands puts breakpoint N lines down from the current line ?', 'N', 'fn', 'N', '+N', 4, 0, 2),
(48, 18, 'Caller:', 'registers that must not be clobbered', 'procedure invoked by another function', 'code that invokes a procedure', 'none of the above', 3, 0, 2),
(49, 18, 'Define intelligent gathering', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 1, 0, 2),
(50, 18, 'Define foot printing', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 2, 0, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `name`, `active`) VALUES
(1, 'IS-142K', 1),
(2, 'IS-143K', 1),
(3, 'MCM-1502K', 1),
(4, 'CS-147R', 1),
(5, 'CSSE-131K', 1),
(6, 'FIN-1501K', 1),
(7, 'JUR-1504K', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `test_questions`
--

CREATE TABLE `test_questions` (
  `id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `answer_one` longtext NOT NULL,
  `answer_two` longtext NOT NULL,
  `answer_three` longtext NOT NULL,
  `answer_four` longtext NOT NULL,
  `correct_answer_value` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `test_questions`
--

INSERT INTO `test_questions` (`id`, `question`, `answer_one`, `answer_two`, `answer_three`, `answer_four`, `correct_answer_value`) VALUES
(1, 'Where are you from?', 'Almaty', 'Aktobe', 'Shymkent', 'Taldykorgan', 3),
(2, 'How old are you?', '20', '21', '22', '18', 1),
(5, 'Define foot printing', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 2),
(6, 'Define a verification in reconnaissance', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 4),
(7, 'Define intelligent gathering', 'Find out more about structure of target', 'Find out individual computers of target', 'Involves relatively high amount of manual work', 'Check if target candidates are actual alive and reachable', 1),
(8, 'Define OWASP', 'Open Web Application Security Program', 'Open Wide Application Security Program', 'Open Wide Application Security Project', 'Open Web Application Security Project', 4),
(9, 'What does register ?rip? store?', 'Condition flags', 'Program counter', 'Frame pointer', 'Stack pointer', 2),
(10, 'Which of the following GDB commands puts breakpoints at the beginning of the program?', 'b N', 'b +N', 'b main', 'into break', 3),
(11, 'Which of the following GDB commands puts breakpoint N lines down from the current line ?', 'N', 'fn', 'N', '+N', 4),
(12, 'Dissasembling', 'Preservers a symbol table entity', 'The process of recovering assembly from machine code', 'The process of deallocating arguments on the stack', 'All of the above', 2),
(13, 'Callee:', 'all of the above', 'procedure invoked by another function', 'code that invokes a procedure', 'deallocates arguments on stack after return', 2),
(14, 'Caller:', 'registers that must not be clobbered', 'procedure invoked by another function', 'code that invokes a procedure', 'none of the above', 3),
(15, 'Give the description of Mem(rsp)Succ(rip)', 'pop successor into rip', 'store successor', 'jump to address', 'jump to successor', 3),
(16, 'Distinction between jumps and calls', 'there is no destinction between jumps and calls', 'jumps used to implement procedures, calls simply transfer control with side effects', 'jumps simply transfer control with no side effects, calls used to implement procedures', 'jumps simply transfer control with side effects, calls used to implement transfers', 3),
(17, 'Distinction between direct and indirect transfers', 'direct transfers use relative offsets, indirect transfers are absolute', 'direct transfers are absolute, indirect transfers use relative offsets', 'direct transfers use fixed offsets, indirect transfers are not absolute', 'direct transfers are not absolute, indirect transfers use fixed offsets', 1),
(18, 'Standards (calling conventions) exist for:', 'none of the above', 'specify the caller and callee?s responsibilities', 'specify where arguments are passed (registers, stack)', 'all of the above', 4),
(19, 'what is your name?', 'Aisa', 'Doszhan', 'Yergali', 'Russian', 3),
(20, 'Java', '1', '2', '3', '4', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_data_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role_id`, `user_data_id`, `group_id`, `active`) VALUES
(1, 'yergali28', '90232666e', 2, 1, 1, 1),
(2, 'dosik596', 'qwerty123', 2, 2, 1, 1),
(3, 'gazik141', '123123', 2, 3, 5, 1),
(4, 'admin', 'admin', 1, 4, NULL, 1),
(8, 'kosyakoss', '90232666e', 2, 11, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user_data`
--

INSERT INTO `user_data` (`id`, `name`, `surname`, `birth_date`) VALUES
(1, 'Yergali', 'Zhakhan', '1996-10-28'),
(2, 'Doszhan', 'Aituganova', '1996-05-09'),
(3, 'Gaziza', 'Yestemirova', '1997-02-09'),
(4, 'Ilyas', 'Zhuanyshev', '2017-04-04'),
(11, 'Asemay', 'Kuanysheva', '2001-12-12');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `courses_users`
--
ALTER TABLE `courses_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `courses_users`
--
ALTER TABLE `courses_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
