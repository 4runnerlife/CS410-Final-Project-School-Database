import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Scanner;
import java.util.StringTokenizer;

/**
 * Main class for a school management system using JDBC and mySQL
 */
public class SchoolSystem {

    /**
     * Establishes a connection with the SQL database when run through onyx
     * @return mySQL DBMS Connection
     */
    public static Connection makeConnection() {
        try {
            Connection conn = null;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:54579/test?verifyServerCertificate=false&useSSL=true", "msandbox", "Password");
            // Do something with the Connection
            System.out.println("Database [test db] connection succeeded!");
            System.out.println();
            return conn;
        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        }
        return null;
    }

    /**
     * Gets the class ID for class name or returns -1 if can't be determined
     * @param conn Connection to mySQL database
     * @param className name of class to find ID for
     * @return -1 if multiple instances of class exist, class_id otherwise
     */
    public static int getClassID(Connection conn, String className) {

        Statement stmt = null;
        ResultSet rs = null;
        int classID = -1;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT class_id FROM Class WHERE course_num = \'" + className + "\';");

            //Gets classID for speciied class
            if(rs.next()){
                classID = rs.getInt("class_id");
                System.out.println("Class Selected with ID " + classID);
            }else{ //No class found
                System.out.println("Class with name " + className + " doesn't exist\n");
            }

            //If there is another value return error value and output
            if(rs.next()){
                classID = -1;
                System.out.println("Unable to select class " + className + ", multiple instances found, use another selector");
            }

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
        return classID;
    }

    /**
     * Gets the class ID for class based on class name and term or returns -1 if can't be determined
     * @param conn Connection to mySQL database
     * @param className name of class to find ID for
     * @param term Term that class is in
     * @return -1 if multiple instances of class exist, class_id otherwise
     */
    public static int getClassID(Connection conn, String className, String term) {

        Statement stmt = null;
        ResultSet rs = null;
        int classID = -1;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT class_id FROM Class WHERE course_num = \'" + className + "\' AND term = \'" + term + "\';");

            //Gets classID for speciied class
            if(rs.next()){
                classID = rs.getInt("class_id");
                System.out.println("Class Selected with ID " + classID);
            }else{ //No class found
                System.out.println("Class with name " + className + " and term " + term + " doesn't exist\n");
            }

            //If there is another value return error value and output
            if(rs.next()){
                classID = -1;
                System.out.println("Unable to select class " + className + " with term " + term + ", multiple instances found, use another selector");
            }

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
        return classID;
    }

    /**
     * Gets the class ID for class based on class name and term or returns -1 if can't be determined
     * @param conn Connection to mySQL database
     * @param className name of class to find ID for
     * @param term Term that class is in
     * @param sectionNum section number for class
     * @return -1 if multiple instances of class exist, class_id otherwise
     */
    public static int getClassID(Connection conn, String className, String term, String sectionNum) {

        Statement stmt = null;
        ResultSet rs = null;
        int classID = -1;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT class_id FROM Class WHERE course_num = \'" + className + "\' AND term = \'" + term + "\' AND section_num = " + sectionNum + ";");

            //Gets classID for speciied class
            if(rs.next()){
                classID = rs.getInt("class_id");
                System.out.println("Class Selected with ID " + classID);
            }else { //No class found
                System.out.println("Class with name " + className + ", term " + term  + ", and section " + sectionNum + " doesn't exist\n");
            }

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
        return classID;
    }

    /**
     *Shows all Categories and their respective weights in the class
     * @param conn Connection to SQL database
     */
    public static void showCategories( Connection conn , int classID){

        Statement stmt = null;
        ResultSet rs = null;
        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("Select weighted.category_id, Class_categories.category_name, weighted.weight\n" + "From Class_categories\n" + "Join weighted on Class_categories.category_id = weighted.category_id Where weighted.class_id = "+classID+";");

            System.out.println("Category id : Category Name : Weight\n");

            // Output class information
            while (rs.next()) {
                System.out.println(rs.getString("category_id") + " : " + rs.getString("category_name") + " : " + rs.getString("weight"));
            }

            System.out.print("\n");
        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }

    }

    /**
     * This adds a new Category to the DB
     * Also adds the new category to the current class
     * @param conn Connection to SQL database
     * @param category_name New category created
     * @param weight Weight of the new Category
     */
    public static void addCategory(Connection conn, String category_name, int weight, int classID){
        Statement stmt = null;
        ResultSet rs = null;
        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from Class_categories");

            int categoryID = -1;
            boolean found = false;
            while(rs.next()){
                categoryID = rs.getInt("category_id");
                if(rs.getString("category_name").equals(category_name)){
                    found = true;
                    break;
                }
            }

            if(!found){
                //adds category if doesn't exist
                stmt.executeUpdate("insert into Class_categories (category_name) values ('" + category_name + "');");
                rs = stmt.executeQuery("select max(category_id) AS max from Class_categories");
                categoryID = rs.getInt("max");
            }

            stmt.executeUpdate("insert into weighted (class_id, category_id, weight) values ("+String.valueOf(classID)+", "+String.valueOf(categoryID)+", "+String.valueOf(weight)+");");
            System.out.println("Category Created");

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }

    /**
     * This shows the assignments in the current class
     * @param conn Connection to SQL database
     */
    public static void  showAssignments(Connection conn, int classID){

        Statement stmt = null;
        ResultSet rs = null;
        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("Select Assignment.assignment_id, Assignment.name, Assignment.description, Assignment.point_value, Assignment.category_id From Assignment Join Class on Class.class_id = Assignment.class_id Where Class.class_id = " + String.valueOf(classID) + " Order by category_id;");

            System.out.println("Assignment ID : Assignment Name : Assignment Description : Point Value : Category ID\n");

            // Output class information
            while (rs.next()) {
                System.out.println(rs.getString("assignment_id") + " : " + rs.getString("name") + " : " + rs.getString("description") + " : " + rs.getString("point_value") + " : " + rs.getString("category_id"));
            }

            System.out.print("\n");
        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }

    }

    /**
     * Shows the current class information
     * @param conn connection to mySQL DBMS
     * @param classID ID of class to show info
     */
    public static void  showClass(Connection conn, int classID){

        Statement stmt = null;
        ResultSet rs = null;
        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from Class WHERE class_id = " +classID+";");

            System.out.println("Class ID : Course Number : Section Number : Term : Description\n");

            // Output class information
            if(rs.next()) {
                System.out.println(rs.getString("class_id") + " : " + rs.getString("course_num") + " : " + rs.getString("section_num") + " : " + rs.getString("term") + " : " + rs.getString("description"));
            }else{
                System.out.println("ERROR: This should not happen");
            }

            System.out.print("\n");
        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }

    /**
     * This adds a new assignment to the current class
     * @param conn Connection to SQL database
     * @param assignmentName New assignment Name
     * @param category New assignment category
     * @param description Description for the new Assignment
     * @param pointValue Point Value for the new Assignment
     */
    public static void addAssignment(Connection conn, String assignmentName, String category, String description, int pointValue, int classID){
        Statement stmt = null;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            stmt.executeUpdate("insert into Assignment (name, description, point_value, category_id, class_id) values ('"+assignmentName+"','"+description+"',"+String.valueOf(pointValue)+","+category+","+String.valueOf(classID)+");");

            System.out.println("Assignment created and added to " + String.valueOf(classID));

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }


    }

    /**
     * This adds a new Student and enrolls them in the current class
     * If the student already exists this will just enroll them in the current class
     * @param conn Connection to SQL database
     * @param username New Studnet username
     * @param student_id New Student ID number
     * @param last_name New Students Last Name
     * @param first_name New Students First Name
     */
    public static void addStudent(Connection conn, String username, int student_id, String last_name, String first_name, int classID){
        Statement stmt = null;
        ResultSet rs = null;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            stmt.executeUpdate("INSERT INTO Student (student_id, first_name, last_name, username, email) values ("+ String.valueOf(student_id) +",'"+ first_name+"','"+last_name+"','"+username+"','"+username+"@u.boisestate.edu');");
            stmt.executeUpdate("INSERT INTO enrolled_in (class_id,student_id) values ("+ classID +","+student_id+");");
            System.out.println("Student created and added to" + classID);

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }


    }

    /**
     * This adds an existing student to the current class.
     * @param conn Connection to SQL database
     * @param username Student username
     */
    public static void addStudent(Connection conn, String username, int classID) {
        Statement stmt = null;
        ResultSet rs = null;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();

            rs = stmt.executeQuery("select student_id from Student WHERE username = '"+username+"';");
            String userID = null;
            if(rs.next()){
                userID = rs.getString("student_id");
            }else{
                System.out.println("User with name" + username + " does not exist. Try again");
                return;
            }

            stmt.executeUpdate("INSERT INTO enrolled_in (class_id, student_id) values ("+String.valueOf(classID)+","+userID+");");
            System.out.println("Student enrolled in" + classID);

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }


    }

    /**
     * This shows all the current students in the current class
     * @param conn Connection to SQL database
     */
    public static void showStudents(Connection conn, int classID){

        Statement stmt = null;
        ResultSet rs = null;
        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("Select enrolled_in.class_id, Student.student_id, Student.first_name, Student.last_name From Student Join enrolled_in on Student.student_id = enrolled_in.student_id Where class_id = " + String.valueOf(classID) + ";");

            System.out.println("Class ID : Student ID : First Name : Last Name");

            // Output class information
            while (rs.next()) {
                System.out.println(rs.getString("class_id") + " : " + rs.getString("student_id") + " : " + rs.getString("first_name") + " : " + rs.getString("last_name"));
            }

            System.out.print("\n");
        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }

    }

    /**
     * This shows all the students with a specific "string" in their
     * Name or username
     * @param conn Connection to SQL database
     * @param string The specific pattern to match
     */
    public static void showStudentsString(Connection conn, String string, int classID){

        Statement stmt = null;
        ResultSet rs = null;
        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("Select Student.student_id,Student.first_name, Student.last_name, Student.username, Student.email From Student Join enrolled_in on Student.student_id = enrolled_in.student_id Where username Like '%" + string + "%' or last_name like '%" + string + "%' or first_name  like '%" + string + "%'And enrolled_in.class_id = " + classID + ";");
            System.out.println("Student ID : First Name : Last Name : Username : Email");

            // Output class information
            while (rs.next()) {
                System.out.println(rs.getString("student_id") + " : " + rs.getString("first_name") + ": " + rs.getString("last_name") + ": " + rs.getString("username") + ": " + rs.getString("email"));
            }

            System.out.print("\n");
        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }

    }

    /**
     * Assigns a grade on an assignment to a student
     * @param classID ID of class to assign grade for
     * @param conn Connection to SQL database
     * @param assignmentName name of existing assignment in class to grade for the student
     * @param username username of student to recieve the assignment grade
     * @param grade Grade in points to be assigned
     */
    public static void gradeAssignment(Connection conn, int classID, String assignmentName, String username, String grade) {

        Statement stmt = null;
        ResultSet rs = null;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();

            //Check that student is enrolled in class and get ID of student if enrolled
            rs = stmt.executeQuery("SELECT Student.student_id FROM enrolled_in JOIN Class ON Class.class_id = enrolled_in.class_id JOIN Student ON Student.student_id = enrolled_in.student_id WHERE Class.class_id = " + classID + " AND Student.username = \'" + username + "\';");

            int userID = -1;

            if(!rs.next()){
                //Student isn't enrolled in class
                System.out.println("Student is not currently enrolled in this class");
                return;
            }else{
                //Student is enrolled get studentIDshow-class
                userID = rs.getInt("student_id");
            }

            rs = null;
            //Get grade and point value if assignment is already graded
            rs = stmt.executeQuery("SELECT grade, point_value, Assignment.assignment_id FROM grade_on JOIN Assignment ON Assignment.assignment_id = grade_on.Assignment_id WHERE student_id = " + userID + " AND name = \'" + assignmentName + "\';" );

            if(rs.next()){ //Assignment already graded
                int oldGrade = rs.getInt("grade");
                int maxPoints = rs.getInt("point_value");
                int assignmentID = rs.getInt("assignment_id");

                //Provides warning if assignment already graded
                System.out.println("WARNING: Assignment already graded with " + String.valueOf(oldGrade) + "Replacing with" + String.valueOf(grade));

                if(Integer.parseInt(grade) > maxPoints){ // Checks if max oints is exceeded
                    System.out.println("WARNING grade " + String.valueOf(grade) + " exceeds maximum score of " + String.valueOf(maxPoints));
                }

                //Perform query to update score in DB
                stmt.executeUpdate("UPDATE grade_on SET grade = " + String.valueOf(grade) + " WHERE assignment_id = " + String.valueOf(assignmentID) + " AND student_id = " + String.valueOf(userID) + ";");
                System.out.println("Grade Updated!\n");

            }else{//Assignment hasn't been graded yet
                //Get maximum score and id for assignment
                rs = stmt.executeQuery("SELECT Assignment.assignment_id, point_value FROM grade_on JOIN Assignment ON Assignment.assignment_id = grade_on.assignment_id WHERE name = \'" + assignmentName + "\';");
                if(rs.next()){//Assignment exists
                    int assignmentID = rs.getInt("assignment_id");
                    int maxPoints = rs.getInt("point_value");

                    if(Integer.parseInt(grade) > maxPoints){ // Checks if max oints is exceeded
                        System.out.println("WARNING grade " + String.valueOf(grade) + " exceeds maximum score of " + String.valueOf(maxPoints));
                    }

                    //insert new value into grade_on
                    stmt.executeUpdate("INSERT INTO grade_on(assignment_id, student_id, grade) VALUES (" +  String.valueOf(assignmentID) + "," + String.valueOf(userID) + "," + String.valueOf(grade) + ");");
                    System.out.println("Assignment Graded Successfully!");
                }else{
                    System.out.println("Assignment with name " + assignmentName + " does not exist");
                    return;
                }
            }

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }


    /**
     * Lists out all classes currently in the DB
     * @param conn Connection to SQL database
     */
    public static void listClasses(Connection conn) {

        Statement stmt = null;
        ResultSet rs = null;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM Class;");

            System.out.println("Course Number : Section Number : Term\n");

            // Output class information
            while (rs.next()) {
                System.out.println(rs.getString("course_num") + " : " + rs.getString("section_num") + " : " + rs.getString("term"));
            }

            System.out.print("\n");

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }

    /**
     * prints the grade book for the specified class
     * @param conn Connection to mySQL DBMS
     * @param classID ID of currently selected class to print grade book for
     */
    public static void printGradebook(Connection conn, String classID) {

        Statement stmt = null;
        ResultSet rs = null;

        try {
            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            //Gets all students in the current class
            rs = stmt.executeQuery("SELECT first_name, last_name, username, Student.student_id FROM enrolled_in JOIN Student ON Student.student_id = enrolled_in.student_id WHERE class_id = " + classID);

            System.out.println(""); // adds spacing

            //Calls printStudentGrades for each student without assignment breakdown
            while(rs.next()){
                String fullName = rs.getString("first_name") + " " + rs.getString("last_name");
                String username = rs.getString("username");
                int student_id = rs.getInt("student_id");

                //Prints out name, username, and ID for student
                System.out.println("Name: " + fullName + " Username: " + username + " ID: " + String.valueOf(student_id));

                //prints out grades
                printStudentGrades(conn, classID, username, false);
            }

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }

    /**
     * Prints the grade breakdown for a student in the current class
     * @param conn Connection to mySQL DBMS
     * @param classID ID of currently selected class
     * @param username Username for the student to print grades for
     * @param listAssignments boolean to determine whether the assignments should be listed individually, set as false for grade book to use
     */
    public static void printStudentGrades(Connection conn, String classID, String username, boolean listAssignments) {

        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conn.createStatement();
            //Gets assignment grades

            if(listAssignments){
                rs = stmt.executeQuery("SELECT name, grade, point_value, category_name \n" +
                        "FROM Student\n" +
                        "JOIN grade_on ON grade_on.student_id = Student.student_id\n" +
                        "JOIN enrolled_in ON Student.student_id = enrolled_in.student_id\n" +
                        "JOIN Assignment ON Assignment.assignment_id = grade_on.assignment_id\n" +
                        "JOIN Class_categories ON Class_categories.category_id = Assignment.category_ID\n" +
                        "WHERE username = \'" + username + "\' AND enrolled_in.class_id = " + classID +
                        "\nORDER BY category_name;");

                System.out.println("\nGrades for " + username);
                System.out.println("Assignment Name : Grade Percentage : Category\n");

                // Output grades for assignments ordered by category
                while (rs.next()) {
                    System.out.println(rs.getString("name") + " : " + String.valueOf(((double)rs.getInt("grade")/(double)rs.getInt("point_value"))*100) + "% : " + rs.getString("category_name"));
                }
                System.out.println("\n");
            }

            //Get total Grade info for the categories along with the weight of each category
            rs = null;
            rs = stmt.executeQuery("SELECT Class_categories.category_id, SUM(point_value) AS total_possible, SUM(grade) AS points_scored, MIN(weighted.weight) AS cat_weight\n" +
                    "FROM Student\n" +
                    "JOIN grade_on ON grade_on.student_id = Student.student_id\n" +
                    "JOIN enrolled_in ON Student.student_id = enrolled_in.student_id\n" +
                    "JOIN Assignment ON Assignment.assignment_id = grade_on.assignment_id\n" +
                    "JOIN Class_categories ON Class_categories.category_id = Assignment.category_ID\n" +
                    "JOIN weighted ON weighted.category_id = Class_categories.category_ID AND enrolled_in.class_id = weighted.class_id\n" +
                    "WHERE username = \'" + username + "\' AND enrolled_in.class_id = "+ classID + "\n" +
                    "GROUP BY Class_categories.category_ID\n" +
                    "ORDER BY category_name;");

            int totalWeight = 0;
            double score = 0;
            int numScores = 0;

            while(rs.next()){
                numScores++;
                double tempWeight = (double)rs.getInt("cat_weight");
                score += ((double)rs.getInt("points_scored")/(double)rs.getInt("total_possible")) * tempWeight;
                totalWeight += tempWeight;
            }

            System.out.println("Total Grade: " + String.valueOf(100.0*score/(double)totalWeight) + "%");

            //Get attempted grade NOTE only difference from last is not null on grade
            rs = null;
            rs = stmt.executeQuery("SELECT Class_categories.category_id, SUM(point_value) AS total_possible, SUM(grade) AS points_scored, MIN(weighted.weight) AS cat_weight\n" +
                    "FROM Student\n" +
                    "JOIN grade_on ON grade_on.student_id = Student.student_id\n" +
                    "JOIN enrolled_in ON Student.student_id = enrolled_in.student_id\n" +
                    "JOIN Assignment ON Assignment.assignment_id = grade_on.assignment_id\n" +
                    "JOIN Class_categories ON Class_categories.category_id = Assignment.category_ID\n" +
                    "JOIN weighted ON weighted.category_id = Class_categories.category_ID AND enrolled_in.class_id = weighted.class_id\n" +
                    "WHERE username = \'" + username + "\' AND enrolled_in.class_id = "+ classID + " AND grade_on.grade IS NOT NULL \n" +
                    "GROUP BY Class_categories.category_ID\n" +
                    "ORDER BY category_name;");

            score = 0;
            numScores = 0;
            totalWeight = 0;

            while(rs.next()){
                numScores++;
                double tempWeight = (double)rs.getInt("cat_weight");
                score += ((double)rs.getInt("points_scored")/(double)rs.getInt("total_possible")) * tempWeight;
                totalWeight += tempWeight;
            }

            System.out.println("Attempted Grade: " + String.valueOf(100.0*score/(double)totalWeight) + "%\n");

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
                } // ignore
                rs = null;
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }

    /**
     * Creates a new class in the mySQL DB
     * @param conn Conneciton to mySQL DBMS
     * @param courseNum course number such as CS103, ENGL201, etc.
     * @param term term for the course such as SP20, FA22, etc.
     * @param section_num section number for the course
     * @param className name of new class
     * @return
     */
    public static void newClass(Connection conn, String courseNum, String term, String section_num , String className) {

        Statement stmt = null;

        try {
            //Do some length checking on data
            if(courseNum.length() > 20){
                System.out.println("Course number " + courseNum + " is to long. must be 20 chars or less");
                return;
            }
            if(term.length() > 5){
                System.out.println("term " + term + " is to long. must be 5 chars or less");
                return;
            }

            //Create and execute SQL to get the class data
            stmt = conn.createStatement();
            stmt.executeUpdate("insert into Class (course_num, section_num, term, description) values (\'" + courseNum + "\', " + section_num + ", \'" + term + "\', \'" + className + "\');");
            System.out.println("Class Successfully created!\n");

        } catch (SQLException ex) {
            // handle any errors
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } finally {
            // it is a good idea to release resources in a finally{} block
            // in reverse-order of their creation if they are no-longer needed
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {
                } // ignore
                stmt = null;
            }
        }
    }

    public static void main(String[] args) {
        int classID = -1;

        try {
            // The newInstance() call is a work around for some broken Java implementations
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            System.out.println();
            System.out.println("JDBC driver loaded");
            System.out.println();

            //Establishes connection to DB and prints output to say that connection was successfull
            Connection conn = makeConnection();

            //Creates scanner for user input
            Scanner inputScan = new Scanner(System.in);

            //Boolean to store whether the user would like to continue providing input
            boolean continueRunning = true;

            //Should run until the user decides to terminate program
            while(continueRunning) {

                //Provides base usage instructions for if no class is selected
                System.out.println("Usage:");
                System.out.println("To add create a new class in the application run");
                System.out.println("new-class <course_num> <term> <section_num> <class_name>\n");
                System.out.println("To list the classes along with the number of students enrolled run");
                System.out.println("list-classes\n");
                System.out.println("To select the case of class_name in the current term run");
                System.out.println("select-class <class_name>\n");
                System.out.println("To select the only section of a Class with class_name in a term run");
                System.out.println("select-class <class_name> <term>\n");
                System.out.println("To select the section of a Class with class_name in a term  with section ID run");
                System.out.println("select-class <class_name> <term> <section_number>\n");
                System.out.println("To exit the program type");
                System.out.println("program-exit\n");

                String userInput = inputScan.nextLine();
                StringTokenizer st = new StringTokenizer(userInput);

                String startInput = null;
                if(!st.hasMoreTokens()){
                    System.out.println("ERROR: No input provided");
                    continue;
                }
                startInput = st.nextToken();

                if(userInput.equals("list-classes")){
                    listClasses(conn);
                    continue;
                }else if(startInput.equals("select-class")){//Check for selecting a class

                    //Strings for performing queries
                    String className = null;
                    String termName = null;
                    String sectionNum = null;

                    //Get the class name
                    if(st.hasMoreTokens()){
                        className = st.nextToken();

                        //Get the term name if applicable
                        if(st.hasMoreTokens()){
                            termName = st.nextToken();

                            //Get the section number if applicable
                            if(st.hasMoreTokens()){
                                sectionNum = st.nextToken();
                                classID = getClassID(conn, className, termName, sectionNum);
                            }else{
                                classID = getClassID(conn, className, termName);
                            }

                        }else{
                            classID = getClassID(conn, className);
                        }

                    }else{
                        System.out.println("ERROR: Class is not specified\n");
                        continue;
                    }

                    boolean continueClassOperation = true;
                    //Class selected successfully
                    while(continueClassOperation && classID != -1){
                        if(!(classID == -1)) {
                            //Print usage
                            System.out.println("Class Operations:");
                            System.out.println("To show currently selected class use");
                            System.out.println("show-class\n"); // Output class information
                            System.out.println("To show the class categories and weight use");
                            System.out.println("show-categories\n");
                            System.out.println("To add a class category use");
                            System.out.println("add-category <cat_name> <cat_weight>\n");
                            System.out.println("To see the assignments ordered by category use");
                            System.out.println("show-assignment\n");
                            System.out.println("To add a new assignment use");
                            System.out.println("add-assignment <name> <category_id> <description> <points>\n");
                            System.out.println("To add a new student to the current class and enroll use");
                            System.out.println("add-student <username> <student_id> <last_name> <first_name>\n");
                            System.out.println("To enroll an existing student use");
                            System.out.println("add-student <username>\n");
                            System.out.println("To show enrolled students use");
                            System.out.println("show-students\n");
                            System.out.println("To show enrolled students with \"string in their name\" use");
                            System.out.println("show-students <string>\n");
                            System.out.println("To assign a grade on an assignment use");
                            System.out.println("grade <assignment_name> <username> <grade>\n");
                            System.out.println("To see a students grad breakdown use");
                            System.out.println("student-grades <username>\n");
                            System.out.println("To see the gradebook use");
                            System.out.println("gradebook\n");
                            System.out.println("To exit to class selection use");
                            System.out.println("exit-to-select\n");

                            //Gets input for action to do on class
                            System.out.println("Enter Input:");
                            userInput = null;
                            userInput = inputScan.nextLine();

                            //Creates string tokenizer for parsing of input
                            st = new StringTokenizer(userInput);

                            //Checks if there is a first element
                            if(!st.hasMoreElements()){
                                System.out.println("No input was provided");
                                continue;
                            }

                            //Gets and stores the first token to do if statement
                            String firstToken = st.nextToken();

                            if(firstToken.equals("show-class")){
                                showClass(conn,classID);
                            } else if (firstToken.equals("show-categories")) {
                                showCategories(conn,classID);
                                continue;

                            } else if (firstToken.equals("add-category")) {
                                //Values for the addCategory function
                                String category_name = null;
                                int weight = 0;

                                //Get the catgory name
                                if(st.hasMoreTokens()) {
                                    category_name = st.nextToken();

                                    //get the weight and then add the category
                                    if (st.hasMoreTokens()) {
                                        weight = Integer.parseInt(st.nextToken());
                                        addCategory(conn, category_name, weight, classID);
                                    } else {
                                        System.out.println("ERROR: Cannot add category\n");
                                    }
                                }
                            } else if (firstToken.equals("show-assignment")) {
                                showAssignments(conn,classID);
                            } else if (firstToken.equals("add-assignment")) {
                                //values for the addAssignment function
                                String assignmentName = null;
                                String category= null;
                                String description = null;
                                int pointValue = 0;

                                //get the assignment name
                                if(st.hasMoreTokens()) {
                                    assignmentName = st.nextToken();

                                    //get the category name
                                    if (st.hasMoreTokens()) {
                                        category = st.nextToken();
                                        //get the description
                                        if (st.hasMoreTokens()) {
                                            description = st.nextToken();

                                            //get the pointValue and then perform the addAssignment function
                                            if (st.hasMoreTokens()) {
                                                pointValue = Integer.parseInt(st.nextToken());
                                                addAssignment(conn, assignmentName, category, description,pointValue,classID);
                                            } else {
                                                System.out.println("ERROR: Cannot add Assignment\n");
                                            }
                                        }
                                    }
                                }
                            } else if (firstToken.equals("add-student")) {
                                //values for the addStudent function
                                String username = null;
                                int student_id = 0;
                                String last_name = null;
                                String first_name = null;

                                //get the username
                                if (st.hasMoreTokens()) {
                                    username = st.nextToken();

                                    //get the studentID
                                    if (st.hasMoreTokens()) {
                                        student_id = Integer.parseInt(st.nextToken());
                                    } else {
                                        //If the student already exists add then to the class
                                        addStudent(conn, username, classID);
                                    }
                                    //get the students last name
                                    if (st.hasMoreTokens()) {
                                        last_name = st.nextToken();

                                        //get the students first name and then add them
                                        if (st.hasMoreTokens()) {
                                            first_name = st.nextToken();
                                            addStudent(conn, username, student_id, last_name, first_name, classID);
                                        } else {
                                            System.out.println("ERROR: Cannot add Student\n");
                                        }
                                    }
                                }
                            }else if(firstToken.equals("show-students")) {
                                    if(st.hasMoreElements()){
                                        showStudentsString(conn,st.nextToken(),classID);
                                    }else{
                                        showStudents(conn,classID);
                                    }
                            }else if (firstToken.equals("gradebook")) {
                                if(!st.hasMoreElements()){
                                    printGradebook(conn, String.valueOf(classID));
                                }else{
                                    System.out.println("ERROR: gradebook does not take arguments");
                                }
                            } else if (firstToken.equals("grade")) { //Grades an assignment
                                //grade an assignment
                                String data[] = new String[3];
                                for(int i = 0; i < 3; i++){//Load input from string tokenizer
                                    if(!st.hasMoreElements()){
                                        System.out.println("WARNING: Not enough arguments for grade");
                                        break;
                                    }else{
                                        data[i] = st.nextToken();//Loads data
                                    }
                                }

                                if(data[2] == null){ // in case that not enough data found
                                    continue;
                                }

                                //Grade the assignment
                                gradeAssignment(conn, classID, data[0], data[1], data[2]);

                            } else if (firstToken.equals("student-grades")) {
                                //Print student grades
                                if(st.hasMoreElements()){
                                    printStudentGrades(conn,String.valueOf(classID),st.nextToken(),true);
                                }else{
                                    System.out.println("ERROR: no username provided");
                                }
                            } else if (firstToken.equals("exit-to-select")) {
                                //Exit class selection
                                continueClassOperation = false;
                                classID = -1;
                            } else {
                                //Input invalid
                                System.out.println(userInput + "\nis an invalid input. Try Again\n");
                            }
                        }
                    }
                }else if(startInput.equals("new-class")){
                    //"new-class <course_num> <term> <section_num> <class_name>\n"
                    String courseNumber = null;
                    String term = null;
                    String sectionNumber = null;
                    String className = null;

                    //Get course number
                    if(st.hasMoreElements()){
                        courseNumber = st.nextToken();
                    }else{
                        System.out.println("ERROR: no course number specified");
                        continue;
                    }

                    //Get term
                    if(st.hasMoreElements()){
                        term = st.nextToken();
                    }else{
                        System.out.println("ERROR: no term specified");
                        continue;
                    }

                    //Get section number
                    if(st.hasMoreElements()){
                        sectionNumber = st.nextToken();
                    }else{
                        System.out.println("ERROR: no section number specified");
                        continue;
                    }

                    //Get class name
                    if(st.hasMoreElements()){
                        className = st.nextToken();
                    }else{
                        System.out.println("ERROR: no class name specified");
                        continue;
                    }

                    //load all of class name
                    while(st.hasMoreElements()){
                        className += " " + st.nextToken();
                    }

                    newClass(conn,courseNumber,term,sectionNumber,className);

                }else if(startInput.equals("program-exit")){
                    continueRunning = false;
                }else{
                    System.out.println("Invalid Input Try Again");
                }
            }

            conn.close();
            System.out.println();
            System.out.println("Database [test db] connection closed");
            System.out.println();
        } catch (Exception ex) {
            // handle the error
            System.err.println(ex);
        }
    }
}