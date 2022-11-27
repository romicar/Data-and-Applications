# PROJECT PHASE 4
# CPStalk

## TEAM MEMBERS:
> Sriteja Reddy Pashya (2021111019)

> Keval Jain (2021111030)

> Romica Raisinghani (2021101053)

---

**Introduction to the mini-world**

Everyone who does Competitive Programming, has wasted time juggling
between different coding platforms in finding problems, keeping track of
contests, or even stalking your friends!
We provide you a comprehensive solution for all this, by introducing you to
CPstalker.
It provides the below features across ALL popular coding sites:

* To analyze your progress and compare with your friends
* Remind for future contests
* Recommend problems according to the tags and difficulty

---
---
## RUNNIG THE CPStalk

To run the mini-world for different functional requirements:

* python3 main.py

> Running the above command displays a list of operations that can be performed on our database

* mysql -u root -p < CPStalk.sql
* Enter password: 

> After running the above command, run `USE CPStalk;`
> Run the queries to check the updated database

> Make sure you select `0` to `Logout` 
---
---
# UPDATES

### <b> OPTION 0:  Logout </b>

Used to exit from the user interface.

---

### <b> OPTION 1:  Insert user info </b>

> Calls the function `insert_user_info()`

Adds a new user to `CPStalk`. The function asks for *Username*, *First Name*, *Middle Name*, *Last Name*, *Year of Graduation*, *Institute*, *Profession* and *Country* and adds the details to the `USERS` table in the database.

---

### <b> OPTION 2:  Delete user </b>

> Calls the function `update_user()`


Deletes an existing user on `CPStalk`. The function asks for the user's CPStalk *Username* and deletes the details of that particular user from the entire database.

---

### <b> OPTION 3:  Update user info </b>

> Calls the function `delete_user()`

Updates the details of an existing user on `CPStalk`. The function asks for the user's CPStalk *Username* and then deletes the details of that particular user from the entire database. After this the function asks for the new details such as: *Username*, *First Name*, *Middle Name*, *Last Name*, *Year of Graduation*, *Institute*, *Profession* and *Country* and adds the details to the `USERS` table in the database.

---
---
# QUERIES

### <b> OPTION 4:  Show all CPStalk users </b>

> Calls the function `all_users()`

Displays all the existing users on `CPStalk`. The function simply goes through the `USERS` table and displays the user's details such as:*Username*, *First Name*, *Middle Name*, *Last Name*, *Year of Graduation*, *Institute*, *Profession* and *Country*.

---

### <b> OPTION 5:  Show all contests in particular platform </b>

> Calls the function `contests_from_platform()`

Asks for a platform name as an input and displays all the contests that are hosted on that particular platform by going through the `CONTEST` table.

---

### <b> OPTION 6: Show all problems within a rating range </b>

> Calls the function `rating_range()`

Asks for a minimum rating and a maximum rating value and displays all the problems on all the platforms that lie in the range `[min rating,max ratimg]` by goimg through the `PROBLEM` table.

---

### <b> OPTION 7: Show all problems with the tag </b>

> Calls the function `problem_tag()`

Displays all the distinct problem tags from `PROBLEM_TAGS` table and then asks for a particular problem tag as an input.
The problems with the chosen tag are then displayed along with *Problem ID* and *Platform Name* by going through the `PROBLEM_TAGS` table.

---

### <b> OPTION 8: Show top n rated users on a platform </b>

> Calls the function `top_n_users()`

Asks for "platform name" and "n" as an input and displays *PlatformUserName*, *Rating*, *Rank* from `USER_REGISTER_ON` table that are from a particluar platform and are "n" highest rated.

---

### <b> OPTION 9: Register user onto a platform </b>

> Calls the function `register_user_platn()`

Asks for *Platform Name*, *Username* and *Rating* as inputs and registers this user on the specified platform as well as assigns the designated rank to the user based on the rating entered to the `USER_REGISTER_ON` table.

---

### <b> OPTION 10: Show all accounts registered on a platform </b>

> Calls the function `platform_users()`

Asks for a Platform Name as an input and displays all the users that are registered on that particular platform by going through `USER_REGISTER_ON` table.

---
### <b> OPTION 11: Show all users who have a particular verdict on a particular problem </b>

> Calls the function `problem_solved_by()`

Asks for *ProblemID*, *Verdict* and *PlatformName* and displays all the users that have a submission on that particular ProblemID from that PlatformName with that Verdict by goimg through tables `PRAC1`, `PRAC2`, `ATTEMPTS_1` and `ATTEMPTS_3`.