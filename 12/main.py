# Hello! Here is our Python Code 

import subprocess as sp
import pymysql
import pymysql.cursors
import json


def insert_user_info():

    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new user's details: ")
        row["Username"] = input("Username: ")
        name = (input("Name (Fname Mname Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["year_of_grad"] = int(input("Year of graduation (YYYY): "))
        row["Institute"] = input("Institute: ")
        row["Profession"] = input("Profession: ")
        row["Country"] = input("Country: ")

        query = "INSERT INTO USERS(Username, Fname, Mname, Lname, Year_of_Grad, Institute, Profession, Country) VALUES('%s', '%s', '%s', '%s', '%d','%s','%s','%s')" % (
            row["Username"], row["Fname"], row["Minit"], row["Lname"], row["year_of_grad"], row["Institute"], row["Profession"], row["Country"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def delete_user():

    try:
        # Takes emplyee details as input
        row = {}
        row["Username"] = input("Enter user's Username: ")

        query = "DELETE FROM USERS WHERE Username='%s';" % (row["Username"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return


def update_user():
    try:
        # Takes emplyee details as input
        row = {}
        row["Username"] = input("Enter user's Username: ")

        query = "DELETE FROM USERS WHERE Username='%s';" % (row["Username"])

        print(query)
        cur.execute(query)

        row = {}
        print("Enter new user's details: ")
        row["Username"] = input("Username: ")
        name = (input("Name (Fname Mname Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["year_of_grad"] = int(input("Year of graduation (YYYY): "))
        row["Institute"] = input("Institute: ")
        row["Profession"] = input("Profession: ")
        row["Country"] = input("Country: ")

        query = "INSERT INTO USERS(Username, Fname, Mname, Lname, Year_of_Grad, Institute, Profession, Country) VALUES('%s', '%s', '%s', '%s', '%d','%s','%s','%s')" % (
            row["Username"], row["Fname"], row["Minit"], row["Lname"], row["year_of_grad"], row["Institute"], row["Profession"], row["Country"])

        print(query)
        cur.execute(query)

        con.commit()

        print("Updated from Database")

    except Exception as e:
        con.rollback()
        print("Failed to update user info in database")
        print(">>>>>>>>>>>>>", e)

    return


def all_users():
    try:
        # Takes emplyee details as input
        query = "SELECT Username, Fname, Lname, Institute, Country FROM USERS;"

        print(query)
        cur.execute(query)
        print(json.dumps(cur.fetchall(), indent=2))
        con.commit()

        print("These are all the users in the database")

    except Exception as e:
        con.rollback()
        print("Failed to display all users database")
        print(">>>>>>>>>>>>>", e)

    return
  
def contests_from_platform():
    try:
        # Takes emplyee details as input
        platn = input("Enter Platform Name: ")
        query = "SELECT Contest_Id, Start_Time, Duration, Style,Number_of_Participants FROM CONTEST WHERE PlatN='%s';" % (platn)

        print(query)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        con.commit()

        print(f"These are all the contest on {platn} in the database")

    except Exception as e:
        con.rollback()
        print("Failed to display all users database")
        print(">>>>>>>>>>>>>", e)

    return

def rating_range():
    try:
        # Takes emplyee details as input
        min = int(input("Enter min rating: "))
        max = int(input("Enter max rating: "))
        query = "SELECT Problem_Id, PlatN, Problem_Rating FROM PROBLEM WHERE Problem_Rating <= '%d' AND Problem_Rating >= '%d';" % (
            max, min)

        print(query)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        con.commit()

        print(f"These are all the problems within the range on [{min},{max}] in the database")

    except Exception as e:
        con.rollback()
        print("Failed to display problems database")
        print(">>>>>>>>>>>>>", e)

    return

def problem_tag():
    try:
        # Takes emplyee details as input
        query = "SELECT DISTINCT Prob_Tags FROM PROBLEM_TAGS;"
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        print()
        tag = input("Enter problem tag: ")
        query = "SELECT DISTINCT ProbId, PlatName FROM PROBLEM_TAGS WHERE Prob_Tags = '%s';" % (tag)

        print(query)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        con.commit()

        print(f"These are all the problems with the tag {tag} in the database")

    except Exception as e:
        con.rollback()
        print("Failed to display problems database")
        print(">>>>>>>>>>>>>", e)

    return

  
def top_n_users():
    try:
        # Takes emplyee details as input
        platn = input("Enter Platform Name: ")
        n = int(input("Enter n: "))
        query = "SELECT PlatformUserName, Rating, Rank_ FROM USER_REGISTER_ON WHERE Pname = '%s' ORDER BY Rating DESC LIMIT %d;" % (
            platn, n)

        print(query)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        con.commit()

        print(f"These are the top {n} users on the platform {platn} in the database")

    except Exception as e:
        con.rollback()
        print("Failed to display users from database")
        print(">>>>>>>>>>>>>", e)

    return
  

def register_user_platn():
    try:
        # Takes emplyee details as input
        platn = input("Enter Platform Name: ")
        uname = input("Enter CPStalk Username: ")
        platn_uname = input("Enter Platform Username: ")
        rating = int(input("Enter Rating: "))
        query = "INSERT INTO USER_REGISTER_ON(Pname, Uname, PlatformUserName, Rating) VALUES('%s', '%s', '%s', '%d')" % (
            platn, uname, platn_uname, rating)

        print(query)
        cur.execute(query)
        query = "SET @r=0;"
        cur.execute(query)
        query ="UPDATE USER_REGISTER_ON SET Rank_ = @r:=(@r+1) WHERE Pname = '%s' ORDER BY Rating DESC; " % (
            platn)
        print(query)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        con.commit()

        query = "SELECT PlatformUserName, Rating, Rank_ FROM USER_REGISTER_ON WHERE Pname = '%s' AND PlatformUsername = '%s';" % (platn, platn_uname)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
        print("User registered on platform")


    except Exception as e:
        con.rollback()
        print("Failed to display users from database")
        print(">>>>>>>>>>>>>", e)

    return


def platform_users():
    try:
        # Takes emplyee details as input
        platn = input("Enter Platform Name: ")
        query = "SELECT Uname, PlatformUsername, Rating, Rank_ FROM USER_REGISTER_ON WHERE Pname='%s';" % (platn)

        print(query)
        cur.execute(query)
        print(json.dumps(cur.fetchall(), indent=2))
        con.commit()

        print("These are all the users on the {plat} in the database")

    except Exception as e:
        con.rollback()
        print("Failed to display all users database")
        print(">>>>>>>>>>>>>", e)

    return

  
def problem_verdict_by():  
    try:
        # Takes emplyee details as input
        platn = input("Enter Platform Name: ")
        probid = int(input("Enter Problem Id: "))
        verdict = input("Enter Verdict: ")

        query = """SELECT DISTINCT Uname FROM PRAC2 WHERE PlatName = '%s' AND Submission_Id IN (
  SELECT P.Submission_Id FROM PRAC1 P WHERE P.PlatName = '%s' AND P.ProbId = %d AND Verdict = '%s'
);""" % (platn,platn,probid,verdict)

        query2 = """SELECT DISTINCT Uname FROM ATTEMPTS_3 WHERE PlatName = '%s' AND SubmissionId IN (
  SELECT A1.SubmissionId FROM ATTEMPTS_1 A1 WHERE A1.PlatName = '%s' AND A1.ProbId = %d AND Verdict = '%s'
);""" % (platn, platn, probid, verdict)

        print(query)
        print(query2)
        cur.execute(query)
        for row in cur.fetchall():
            print(row)
            

        cur.execute(query2)
        for row in cur.fetchall():
            print(row)

        print(f"These are all the users who have verdict {verdict} on the problem with id {probid} on the platform {platn} in the database")
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to display all users database")
        print(">>>>>>>>>>>>>", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if (ch == 1):
        insert_user_info()
    elif (ch == 2):
        delete_user()
    elif (ch == 3):
        update_user()
    elif (ch == 4):
        all_users()
    elif (ch == 5):
        contests_from_platform()
    elif (ch == 6):
        rating_range()
    elif (ch == 7):
        problem_tag()
    elif (ch == 8):
        top_n_users()
    elif (ch == 9):
        register_user_platn()
    elif (ch == 10):
        platform_users()
    elif (ch == 11):
        problem_verdict_by()
    else:
        print("Error: Invalid Option")


# Global
while (1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                              # port=30306,
                              user="root",
                              password="123A@ababa",
                              db='CPStalk',
                              cursorclass=pymysql.cursors.DictCursor
                              )
        tmp = sp.call('clear', shell=True)

        if (con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while (1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Insert user info")  # Hire an Employee
                print("2. Delete user")  # Fire an Employee
                print("3. Update user info")  # Promote Employee
                print("4. Show all cpstalk users")  # Employee Statistics
                print("5. Show all contests in particular platform")
                print("6. Show all problems within a rating range")
                print("7. Show all problems with the tag")  # Employee Statistics
                print("8. Show top n rated users on a platform")
                print("9. Register user onto a platform")
                print("10. Show all accounts registered on a platform")
                print("11. Show all users who have a particular verdict on a particular problem")
                print("0. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 0:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
