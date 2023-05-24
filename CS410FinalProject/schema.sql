CREATE TABLE Class(
	class_id INT PRIMARY KEY AUTO_INCREMENT,
	course_num VARCHAR(20) NOT NULL,
	section_num INT NOT NULL,
	term VARCHAR(5) NOT NULL,
	description TEXT(1000) NOT NULL
);

CREATE TABLE Student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20),
	username VARCHAR(40) NOT NULL,
	email VARCHAR(320) NOT NULL
);

CREATE TABLE Class_categories(
	category_id INT PRIMARY KEY AUTO_INCREMENT,
	category_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Assignment(
	assignment_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	description TEXT(1000) NOT NULL,
	point_value INT NOT NULL,
	category_ID INT,
	class_id INT,
	FOREIGN KEY (category_id) REFERENCES Class_categories(category_id),
	FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

CREATE TABLE enrolled_in(
	class_id INT,
	student_id INT,
	FOREIGN KEY (class_id) REFERENCES Class(class_id),
	FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE grade_on(
	assignment_id INT,
	student_id INT,
	grade INT,
	FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
	FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


CREATE TABLE weighted(
	class_id INT,
	category_id INT,
	weight INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(class_id),
	FOREIGN KEY (category_id) REFERENCES Class_categories(category_id)
);

CREATE INDEX retrieve_class
ON Class (class_id,course_num,section_num,term);

CREATE INDEX retrieve_student
ON Student(student_id, username);

CREATE INDEX assignment_retrieve
ON Assignment(assignment_id,name,point_value,category_id,class_id);

insert into Class (class_id, course_num, section_num, term, description) values (1, 'ENGL212', 1, 'FA19', 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.');
insert into Class (class_id, course_num, section_num, term, description) values (2, 'CS343', 1, 'SP20', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.');
insert into Class (class_id, course_num, section_num, term, description) values (3, 'CS115', 1, 'SP21', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into Class (class_id, course_num, section_num, term, description) values (4, 'CS122', 1, 'SP19', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into Class (class_id, course_num, section_num, term, description) values (5, 'CS221', 1, 'SP19', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into Class (class_id, course_num, section_num, term, description) values (6, 'CS221', 2, 'SP20', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.');
insert into Class (class_id, course_num, section_num, term, description) values (7, 'CS221', 3, 'SP20', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.');
insert into Class (class_id, course_num, section_num, term, description) values (8, 'CS321', 1, 'SP22', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.');
insert into Class (class_id, course_num, section_num, term, description) values (9, 'CS321', 2, 'SP22', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.');
insert into Class (class_id, course_num, section_num, term, description) values (10, 'CS321', 3, 'FA20', 'Phasellus in felis.');
insert into Class (class_id, course_num, section_num, term, description) values (11, 'CS354', 1, 'FA21', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.');
insert into Class (class_id, course_num, section_num, term, description) values (12, 'CS354', 2, 'FA21', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into Class (class_id, course_num, section_num, term, description) values (13, 'CS253', 1, 'SP22', 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.');
insert into Class (class_id, course_num, section_num, term, description) values (14, 'CS101', 1, 'FA20', 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into Class (class_id, course_num, section_num, term, description) values (15, 'CS101', 2, 'SP20', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into Class (class_id, course_num, section_num, term, description) values (16, 'CS101', 3, 'SP20', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.');
insert into Class (class_id, course_num, section_num, term, description) values (17, 'CS101', 4, 'FA21', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.');
insert into Class (class_id, course_num, section_num, term, description) values (18, 'CS121', 1, 'FA21', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.');
insert into Class (class_id, course_num, section_num, term, description) values (19, 'CS121', 2, 'SP22', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.');
insert into Class (class_id, course_num, section_num, term, description) values (20, 'CS121', 3, 'SP22', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.');
insert into Class (class_id, course_num, section_num, term, description) values (21, 'CS121', 4, 'SP22', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into Class (class_id, course_num, section_num, term, description) values (22, 'CS121', 5, 'FA20', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.');
insert into Class (class_id, course_num, section_num, term, description) values (23, 'CS421', 1, 'SP21', 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into Class (class_id, course_num, section_num, term, description) values (24, 'CS421', 2, 'SP22', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into Class (class_id, course_num, section_num, term, description) values (25, 'MATH361', 1, 'SP19', 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.');
insert into Class (class_id, course_num, section_num, term, description) values (26, 'MATH270', 1, 'FA17', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.');
insert into Class (class_id, course_num, section_num, term, description) values (27, 'MATH270', 2, 'FA15', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.');
insert into Class (class_id, course_num, section_num, term, description) values (28, 'CS-HU271', 1, 'SP19', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into Class (class_id, course_num, section_num, term, description) values (29, 'CS-HU101', 1, 'FA19', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.');
insert into Class (class_id, course_num, section_num, term, description) values (30, 'CS-HU310', 1, 'FA20', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.');
insert into Class (class_id, course_num, section_num, term, description) values (31, 'CS-HU310', 2, 'SP20', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.');
insert into Class (class_id, course_num, section_num, term, description) values (32, 'CS-HU310', 1, 'SP22', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.');
insert into Class (class_id, course_num, section_num, term, description) values (33, 'CS410', 1, 'SP22', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.');
insert into Class (class_id, course_num, section_num, term, description) values (34, 'CS410', 2, 'SP22', 'Proin at turpis a pede posuere nonummy. Integer non velit.');
insert into Class (class_id, course_num, section_num, term, description) values (35, 'CS361', 1, 'SP22', 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.');
insert into Class (class_id, course_num, section_num, term, description) values (36, 'CS361', 2, 'FA21', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into Class (class_id, course_num, section_num, term, description) values (37, 'CS361', 3, 'FA21', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.');
insert into Class (class_id, course_num, section_num, term, description) values (38, 'CS361', 4, 'SP17', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.');
insert into Class (class_id, course_num, section_num, term, description) values (39, 'ENGL101', 1, 'SP18', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.');
insert into Class (class_id, course_num, section_num, term, description) values (40, 'ENGL102', 1, 'SP22', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into Class (class_id, course_num, section_num, term, description) values (41, 'CS410', 3, 'FA22', 'This is the complete class for grader testing');

insert into Class_categories (category_id, category_name) values (1, 'Assignments');
insert into Class_categories (category_id, category_name) values (2, 'Quizs');
insert into Class_categories (category_id, category_name) values (3, 'Discussions');
insert into Class_categories (category_id, category_name) values (4, 'Extra-Credit');
insert into Class_categories (category_id, category_name) values (5, 'Final');
insert into Class_categories (category_id, category_name) values (6, 'Midterms');
insert into Class_categories (category_id, category_name) values (7, 'Papers');
insert into Class_categories (category_id, category_name) values (8, 'Reading');
insert into Class_categories (category_id, category_name) values (9, 'Writing');
insert into Class_categories (category_id, category_name) values (10, 'Speaking');

insert into weighted (class_id, category_id, weight) values (1, 4, 9);
insert into weighted (class_id, category_id, weight) values (2, 6, 50);
insert into weighted (class_id, category_id, weight) values (3, 8, 18);
insert into weighted (class_id, category_id, weight) values (4, 8, 49);
insert into weighted (class_id, category_id, weight) values (5, 8, 91);
insert into weighted (class_id, category_id, weight) values (6, 8, 29);
insert into weighted (class_id, category_id, weight) values (7, 4, 26);
insert into weighted (class_id, category_id, weight) values (8, 5, 31);
insert into weighted (class_id, category_id, weight) values (9, 8, 49);
insert into weighted (class_id, category_id, weight) values (10, 9, 38);
insert into weighted (class_id, category_id, weight) values (11, 6, 4);
insert into weighted (class_id, category_id, weight) values (12, 3, 63);
insert into weighted (class_id, category_id, weight) values (13, 6, 38);
insert into weighted (class_id, category_id, weight) values (14, 9, 100);
insert into weighted (class_id, category_id, weight) values (15, 8, 19);
insert into weighted (class_id, category_id, weight) values (16, 8, 14);
insert into weighted (class_id, category_id, weight) values (17, 3, 28);
insert into weighted (class_id, category_id, weight) values (18, 5, 20);
insert into weighted (class_id, category_id, weight) values (19, 9, 46);
insert into weighted (class_id, category_id, weight) values (20, 4, 76);
insert into weighted (class_id, category_id, weight) values (21, 8, 64);
insert into weighted (class_id, category_id, weight) values (22, 7, 25);
insert into weighted (class_id, category_id, weight) values (23, 1, 73);
insert into weighted (class_id, category_id, weight) values (24, 9, 55);
insert into weighted (class_id, category_id, weight) values (25, 2, 34);
insert into weighted (class_id, category_id, weight) values (26, 3, 59);
insert into weighted (class_id, category_id, weight) values (27, 9, 39);
insert into weighted (class_id, category_id, weight) values (28, 10, 83);
insert into weighted (class_id, category_id, weight) values (29, 6, 99);
insert into weighted (class_id, category_id, weight) values (30, 1, 98);
insert into weighted (class_id, category_id, weight) values (31, 5, 90);
insert into weighted (class_id, category_id, weight) values (32, 7, 3);
insert into weighted (class_id, category_id, weight) values (33, 3, 59);
insert into weighted (class_id, category_id, weight) values (34, 4, 75);
insert into weighted (class_id, category_id, weight) values (35, 2, 19);
insert into weighted (class_id, category_id, weight) values (36, 3, 99);
insert into weighted (class_id, category_id, weight) values (37, 3, 80);
insert into weighted (class_id, category_id, weight) values (38, 5, 14);
insert into weighted (class_id, category_id, weight) values (39, 5, 68);
insert into weighted (class_id, category_id, weight) values (40, 9, 29);
insert into weighted (class_id, category_id, weight) values (1, 3, 91);
insert into weighted (class_id, category_id, weight) values (2, 5, 50);
insert into weighted (class_id, category_id, weight) values (3, 3, 82);
insert into weighted (class_id, category_id, weight) values (4, 6, 51);
insert into weighted (class_id, category_id, weight) values (5, 7, 9);
insert into weighted (class_id, category_id, weight) values (6, 5, 71);
insert into weighted (class_id, category_id, weight) values (7, 5, 74);
insert into weighted (class_id, category_id, weight) values (8, 4, 69);
insert into weighted (class_id, category_id, weight) values (9, 5, 51);
insert into weighted (class_id, category_id, weight) values (10, 7, 62);
insert into weighted (class_id, category_id, weight) values (11, 10, 96);
insert into weighted (class_id, category_id, weight) values (12, 1, 37);
insert into weighted (class_id, category_id, weight) values (13, 5, 62);
insert into weighted (class_id, category_id, weight) values (14, 8, 0);
insert into weighted (class_id, category_id, weight) values (15, 9, 81);
insert into weighted (class_id, category_id, weight) values (16, 3, 86);
insert into weighted (class_id, category_id, weight) values (17, 10, 72);
insert into weighted (class_id, category_id, weight) values (18, 2, 80);
insert into weighted (class_id, category_id, weight) values (19, 1, 54);
insert into weighted (class_id, category_id, weight) values (20, 6, 24);
insert into weighted (class_id, category_id, weight) values (21, 1, 36);
insert into weighted (class_id, category_id, weight) values (22, 2, 75);
insert into weighted (class_id, category_id, weight) values (23, 3, 27);
insert into weighted (class_id, category_id, weight) values (24, 6, 45);
insert into weighted (class_id, category_id, weight) values (25, 7, 66);
insert into weighted (class_id, category_id, weight) values (26, 4, 41);
insert into weighted (class_id, category_id, weight) values (27, 7, 61);
insert into weighted (class_id, category_id, weight) values (28, 9, 17);
insert into weighted (class_id, category_id, weight) values (29, 7, 1);
insert into weighted (class_id, category_id, weight) values (30, 6, 2);
insert into weighted (class_id, category_id, weight) values (31, 9, 10);
insert into weighted (class_id, category_id, weight) values (32, 5, 97);
insert into weighted (class_id, category_id, weight) values (33, 5, 41);
insert into weighted (class_id, category_id, weight) values (34, 2, 25);
insert into weighted (class_id, category_id, weight) values (35, 8, 81);
insert into weighted (class_id, category_id, weight) values (36, 8, 1);
insert into weighted (class_id, category_id, weight) values (37, 5, 20);
insert into weighted (class_id, category_id, weight) values (38, 8, 86);
insert into weighted (class_id, category_id, weight) values (39, 2, 32);
insert into weighted (class_id, category_id, weight) values (40, 5, 71);
insert into weighted (class_id, category_id, weight) values (41, 1, 50);
insert into weighted (class_id, category_id, weight) values (41, 6, 30);
insert into weighted (class_id, category_id, weight) values (41, 5, 20);

insert into Student (student_id, first_name, last_name, username, email) values (1, 'Haywood', 'Meert', 'hmeert0', 'hmeert0@unc.edu');
insert into Student (student_id, first_name, last_name, username, email) values (2, 'Johnathan', 'Orleton', 'jorleton1', 'jorleton1@nba.com');
insert into Student (student_id, first_name, last_name, username, email) values (3, 'Norby', 'Quimby', 'nquimby2', 'nquimby2@gravatar.com');
insert into Student (student_id, first_name, last_name, username, email) values (4, 'Liza', 'McAster', 'lmcaster3', 'lmcaster3@netvibes.com');
insert into Student (student_id, first_name, last_name, username, email) values (5, 'Ange', 'Burgyn', 'aburgyn4', 'aburgyn4@nasa.gov');
insert into Student (student_id, first_name, last_name, username, email) values (6, 'Pierrette', 'Lipson', 'plipson5', 'plipson5@google.com.hk');
insert into Student (student_id, first_name, last_name, username, email) values (7, 'Ynez', 'Fadell', 'yfadell6', 'yfadell6@un.org');
insert into Student (student_id, first_name, last_name, username, email) values (8, 'Gary', 'Veltmann', 'gveltmann7', 'gveltmann7@delicious.com');
insert into Student (student_id, first_name, last_name, username, email) values (9, 'Scarface', 'Janney', 'sjanney8', 'sjanney8@state.gov');
insert into Student (student_id, first_name, last_name, username, email) values (10, 'Anitra', 'Snellman', 'asnellman9', 'asnellman9@live.com');
insert into Student (student_id, first_name, last_name, username, email) values (11, 'Sheff', 'Cartin', 'scartina', 'scartina@mozilla.org');
insert into Student (student_id, first_name, last_name, username, email) values (12, 'Tony', 'Piatek', 'tpiatekb', 'tpiatekb@sina.com.cn');
insert into Student (student_id, first_name, last_name, username, email) values (13, 'Northrop', 'Digweed', 'ndigweedc', 'ndigweedc@illinois.edu');
insert into Student (student_id, first_name, last_name, username, email) values (14, 'York', 'Horick', 'yhorickd', 'yhorickd@shutterfly.com');
insert into Student (student_id, first_name, last_name, username, email) values (15, 'Christian', 'Gillease', 'cgilleasee', 'cgilleasee@blogger.com');
insert into Student (student_id, first_name, last_name, username, email) values (16, 'Sibylla', 'Priddie', 'spriddief', 'spriddief@soup.io');
insert into Student (student_id, first_name, last_name, username, email) values (17, 'Maurice', 'McVie', 'mmcvieg', 'mmcvieg@angelfire.com');
insert into Student (student_id, first_name, last_name, username, email) values (18, 'Bendick', 'Baumer', 'bbaumerh', 'bbaumerh@rakuten.co.jp');
insert into Student (student_id, first_name, last_name, username, email) values (19, 'Aleksandr', 'Fountaine', 'afountainei', 'afountainei@si.edu');
insert into Student (student_id, first_name, last_name, username, email) values (20, 'Jammie', 'Quilligan', 'jquilliganj', 'jquilliganj@oracle.com');
insert into Student (student_id, first_name, last_name, username, email) values (21, 'Daniel', 'Cornell', 'danielcornell', 'danielcornell@u.boisestate.edu');
insert into Student (student_id, first_name, last_name, username, email) values (22, 'Matt', 'Rockenhaus', 'mattrockenhaus', 'mattrockenhaus@u.boisestate.edu');
insert into Student (student_id, first_name, last_name, username, email) values (23, 'Jane', 'Doe', 'janedoe', 'janedoe@u.boisestate.edu');


insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (1, 'enim', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', 21, 5, 1);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (2, 'nunc vestibulum', 'nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 24, 10, 2);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (3, 'velit', 'quisque porta volutpat erat quisque erat eros viverra eget congue eget', 11, 9, 3);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (4, 'vestibulum', 'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi', 73, 5, 4);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (5, 'cursus vestibulum', 'at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac', 57, 5, 5);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (6, 'primis', 'rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede', 35, 3, 6);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (7, 'at', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur', 27, 1, 7);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (8, 'velit', 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut', 89, 2, 8);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (9, 'molestie hendrerit', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat', 5, 6, 9);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (10, 'sapien', 'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor', 15, 10, 10);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (11, 'felis', 'elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur', 46, 3, 11);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (12, 'quam nec', 'semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 59, 3, 12);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (13, 'in', 'cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis', 56, 7, 13);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (14, 'vel', 'varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at', 67, 5, 14);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (15, 'non velit', 'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio', 24, 10, 15);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (16, 'magna', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', 1, 10, 16);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (17, 'eros elementum', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in', 80, 9, 17);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (18, 'sapien', 'nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 46, 2, 18);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (19, 'turpis', 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 25, 2, 19);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (20, 'quam', 'ullamcorper augue a suscipit nulla elit ac nulla sed vel', 89, 10, 20);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (21, 'HW1', 'First Homework for CS410', 80, 1, 41);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (22, 'HW2', 'Second Homework for CS410', 100, 1, 41);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (23, 'HW3', 'Third Homework for CS410', 95, 1, 41);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (24, 'Midterm 1', 'Midterm 1 for CS410', 100, 5, 41);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (25, 'Midterm 2', 'Midterm 2 for CS410', 80, 5, 41);
insert into Assignment (assignment_id, name, description, point_value, category_id, class_id) values (26, 'Final', 'Third Homework for CS410', 120, 6, 41);

insert into enrolled_in (class_id, student_id) values (1, 13);
insert into enrolled_in (class_id, student_id) values (2, 10);
insert into enrolled_in (class_id, student_id) values (3, 12);
insert into enrolled_in (class_id, student_id) values (4, 12);
insert into enrolled_in (class_id, student_id) values (5, 20);
insert into enrolled_in (class_id, student_id) values (6, 15);
insert into enrolled_in (class_id, student_id) values (7, 17);
insert into enrolled_in (class_id, student_id) values (8, 14);
insert into enrolled_in (class_id, student_id) values (9, 18);
insert into enrolled_in (class_id, student_id) values (10, 10);
insert into enrolled_in (class_id, student_id) values (11, 4);
insert into enrolled_in (class_id, student_id) values (12, 7);
insert into enrolled_in (class_id, student_id) values (13, 8);
insert into enrolled_in (class_id, student_id) values (14, 20);
insert into enrolled_in (class_id, student_id) values (15, 12);
insert into enrolled_in (class_id, student_id) values (16, 6);
insert into enrolled_in (class_id, student_id) values (17, 17);
insert into enrolled_in (class_id, student_id) values (18, 13);
insert into enrolled_in (class_id, student_id) values (19, 4);
insert into enrolled_in (class_id, student_id) values (20, 11);
insert into enrolled_in (class_id, student_id) values (21, 11);
insert into enrolled_in (class_id, student_id) values (22, 2);
insert into enrolled_in (class_id, student_id) values (23, 1);
insert into enrolled_in (class_id, student_id) values (24, 7);
insert into enrolled_in (class_id, student_id) values (25, 3);
insert into enrolled_in (class_id, student_id) values (26, 3);
insert into enrolled_in (class_id, student_id) values (27, 16);
insert into enrolled_in (class_id, student_id) values (28, 20);
insert into enrolled_in (class_id, student_id) values (29, 13);
insert into enrolled_in (class_id, student_id) values (30, 19);
insert into enrolled_in (class_id, student_id) values (31, 4);
insert into enrolled_in (class_id, student_id) values (32, 5);
insert into enrolled_in (class_id, student_id) values (33, 20);
insert into enrolled_in (class_id, student_id) values (34, 12);
insert into enrolled_in (class_id, student_id) values (35, 4);
insert into enrolled_in (class_id, student_id) values (36, 4);
insert into enrolled_in (class_id, student_id) values (37, 11);
insert into enrolled_in (class_id, student_id) values (38, 14);
insert into enrolled_in (class_id, student_id) values (39, 15);
insert into enrolled_in (class_id, student_id) values (40, 2);

insert into enrolled_in (class_id, student_id) values (1, 13);
insert into enrolled_in (class_id, student_id) values (2, 14);
insert into enrolled_in (class_id, student_id) values (3, 13);
insert into enrolled_in (class_id, student_id) values (4, 18);
insert into enrolled_in (class_id, student_id) values (5, 11);
insert into enrolled_in (class_id, student_id) values (6, 8);
insert into enrolled_in (class_id, student_id) values (7, 17);
insert into enrolled_in (class_id, student_id) values (8, 17);
insert into enrolled_in (class_id, student_id) values (9, 20);
insert into enrolled_in (class_id, student_id) values (10, 12);
insert into enrolled_in (class_id, student_id) values (11, 1);
insert into enrolled_in (class_id, student_id) values (12, 10);
insert into enrolled_in (class_id, student_id) values (13, 11);
insert into enrolled_in (class_id, student_id) values (14, 2);
insert into enrolled_in (class_id, student_id) values (15, 6);
insert into enrolled_in (class_id, student_id) values (16, 10);
insert into enrolled_in (class_id, student_id) values (17, 14);
insert into enrolled_in (class_id, student_id) values (18, 6);
insert into enrolled_in (class_id, student_id) values (19, 5);
insert into enrolled_in (class_id, student_id) values (20, 4);
insert into enrolled_in (class_id, student_id) values (21, 18);
insert into enrolled_in (class_id, student_id) values (22, 2);
insert into enrolled_in (class_id, student_id) values (23, 17);
insert into enrolled_in (class_id, student_id) values (24, 1);
insert into enrolled_in (class_id, student_id) values (25, 9);
insert into enrolled_in (class_id, student_id) values (26, 11);
insert into enrolled_in (class_id, student_id) values (27, 18);
insert into enrolled_in (class_id, student_id) values (28, 13);
insert into enrolled_in (class_id, student_id) values (29, 7);
insert into enrolled_in (class_id, student_id) values (30, 18);
insert into enrolled_in (class_id, student_id) values (31, 4);
insert into enrolled_in (class_id, student_id) values (32, 6);
insert into enrolled_in (class_id, student_id) values (33, 16);
insert into enrolled_in (class_id, student_id) values (34, 16);
insert into enrolled_in (class_id, student_id) values (35, 2);
insert into enrolled_in (class_id, student_id) values (36, 15);
insert into enrolled_in (class_id, student_id) values (37, 6);
insert into enrolled_in (class_id, student_id) values (38, 12);
insert into enrolled_in (class_id, student_id) values (39, 9);
insert into enrolled_in (class_id, student_id) values (40, 16);

insert into enrolled_in (class_id, student_id) values (1, 1);
insert into enrolled_in (class_id, student_id) values (2, 15);
insert into enrolled_in (class_id, student_id) values (3, 5);
insert into enrolled_in (class_id, student_id) values (4, 5);
insert into enrolled_in (class_id, student_id) values (5, 20);
insert into enrolled_in (class_id, student_id) values (6, 7);
insert into enrolled_in (class_id, student_id) values (7, 18);
insert into enrolled_in (class_id, student_id) values (8, 18);
insert into enrolled_in (class_id, student_id) values (9, 18);
insert into enrolled_in (class_id, student_id) values (10, 11);
insert into enrolled_in (class_id, student_id) values (11, 4);
insert into enrolled_in (class_id, student_id) values (12, 7);
insert into enrolled_in (class_id, student_id) values (13, 16);
insert into enrolled_in (class_id, student_id) values (14, 13);
insert into enrolled_in (class_id, student_id) values (15, 13);
insert into enrolled_in (class_id, student_id) values (16, 10);
insert into enrolled_in (class_id, student_id) values (17, 2);
insert into enrolled_in (class_id, student_id) values (18, 8);
insert into enrolled_in (class_id, student_id) values (19, 6);
insert into enrolled_in (class_id, student_id) values (20, 7);
insert into enrolled_in (class_id, student_id) values (21, 10);
insert into enrolled_in (class_id, student_id) values (22, 3);
insert into enrolled_in (class_id, student_id) values (23, 20);
insert into enrolled_in (class_id, student_id) values (24, 8);
insert into enrolled_in (class_id, student_id) values (25, 10);
insert into enrolled_in (class_id, student_id) values (26, 2);
insert into enrolled_in (class_id, student_id) values (27, 9);
insert into enrolled_in (class_id, student_id) values (28, 17);
insert into enrolled_in (class_id, student_id) values (29, 20);
insert into enrolled_in (class_id, student_id) values (30, 20);
insert into enrolled_in (class_id, student_id) values (31, 3);
insert into enrolled_in (class_id, student_id) values (32, 19);
insert into enrolled_in (class_id, student_id) values (33, 12);
insert into enrolled_in (class_id, student_id) values (34, 13);
insert into enrolled_in (class_id, student_id) values (35, 4);
insert into enrolled_in (class_id, student_id) values (36, 12);
insert into enrolled_in (class_id, student_id) values (37, 19);
insert into enrolled_in (class_id, student_id) values (38, 15);
insert into enrolled_in (class_id, student_id) values (39, 20);
insert into enrolled_in (class_id, student_id) values (40, 9);
insert into enrolled_in (class_id, student_id) values (41, 21);
insert into enrolled_in (class_id, student_id) values (41, 22);
insert into enrolled_in (class_id, student_id) values (41, 23);

insert into grade_on (assignment_id, student_id, grade) values (1, 8, 52);
insert into grade_on (assignment_id, student_id, grade) values (2, 16, 62);
insert into grade_on (assignment_id, student_id, grade) values (3, 2, 67);
insert into grade_on (assignment_id, student_id, grade) values (4, 15, 64);
insert into grade_on (assignment_id, student_id, grade) values (5, 4, 58);
insert into grade_on (assignment_id, student_id, grade) values (6, 3, 78);
insert into grade_on (assignment_id, student_id, grade) values (7, 8, 61);
insert into grade_on (assignment_id, student_id, grade) values (8, 17, 94);
insert into grade_on (assignment_id, student_id, grade) values (9, 4, 59);
insert into grade_on (assignment_id, student_id, grade) values (10, 15, 63);
insert into grade_on (assignment_id, student_id, grade) values (11, 8, 76);
insert into grade_on (assignment_id, student_id, grade) values (12, 6, 70);
insert into grade_on (assignment_id, student_id, grade) values (13, 11, 58);
insert into grade_on (assignment_id, student_id, grade) values (14, 12, 98);
insert into grade_on (assignment_id, student_id, grade) values (15, 8, 70);
insert into grade_on (assignment_id, student_id, grade) values (16, 11, 71);
insert into grade_on (assignment_id, student_id, grade) values (17, 12, 56);
insert into grade_on (assignment_id, student_id, grade) values (18, 14, 54);
insert into grade_on (assignment_id, student_id, grade) values (19, 16, 71);
insert into grade_on (assignment_id, student_id, grade) values (20, 2, 53);

insert into grade_on (assignment_id, student_id, grade) values (21, 21, 68);
insert into grade_on (assignment_id, student_id, grade) values (21, 22, 88);
insert into grade_on (assignment_id, student_id, grade) values (21, 23, 76);
insert into grade_on (assignment_id, student_id, grade) values (22, 21, 88);
insert into grade_on (assignment_id, student_id, grade) values (22, 22, 94);
insert into grade_on (assignment_id, student_id, grade) values (22, 23, 56);
insert into grade_on (assignment_id, student_id, grade) values (24, 21, 89);
insert into grade_on (assignment_id, student_id, grade) values (24, 22, 80);
insert into grade_on (assignment_id, student_id, grade) values (24, 23, 92);
insert into grade_on (assignment_id, student_id, grade) values (25, 21, 82);
insert into grade_on (assignment_id, student_id, grade) values (25, 22, 67);
insert into grade_on (assignment_id, student_id, grade) values (25, 23, 73);
insert into grade_on (assignment_id, student_id, grade) values (23, 21, null);
insert into grade_on (assignment_id, student_id, grade) values (23, 22, null);
insert into grade_on (assignment_id, student_id, grade) values (23, 23, null);
insert into grade_on (assignment_id, student_id, grade) values (26, 21, null);
insert into grade_on (assignment_id, student_id, grade) values (26, 22, null);
insert into grade_on (assignment_id, student_id, grade) values (26, 23, null);
