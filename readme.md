# Jmix CRUD Sample Application  
## Oracle JDeveloper Employee-Department business-domain  

### Agenda

1. Generate JPA entities based on database schema
2. Generate UI for JPA entities
3. Add new attribute in the entity and in UI
4. Create small business service
5. Configure security
6. (Optional) Configure REST API for the data model

### ER-Model
1. **Employee:**
   1. id : uuid
   2. dateofbirth : date
   3. firstname : string
   4. lastname : string
   5. gender : string
   6. position : string
   7. department : department_id
2. **Department:**
   1. id : uuid
   2. name : date

### Database creation
1. Install DBeaver CE or use pgAdmin as a db client
2. Create new database named _sample_HR_db_ on local PostgreSQL server
3. Load the initial data via SQL script [here](./db_init/) - dump-master_HR_db.sql 
4. Check that tables and data exist

### Step-by-step scenario
1. **Create a new Jmix project** **sampleJmixProject:**
    1. Java version 17+
    2. project name: SampleDemoProject
    3. company name in the package: {partner company name}
    4. overview the Jmix project tree
    5. launch the project for the first time
    6. show add-ons and localization message bundle
    7. show the generation of Liquibase scripts when initializing Users entity during the Jmix project local build
2. Create additional Data Store and connect it to the prepared PostgreSQL database
    1. user: {db_user}
    2. password: {db_password}
    3. database name: sample_HR_db
3. **Generate a JPA model and UI** according to the database schema:
    1. show the possibility of selecting tables for migration
    2. show the possibility of mapping types of stored data in the database to Jmix data types
    3. show the possibility of automatic generation of list and detail view for generated entities
    4. click generate for automatic data model and views creation
4. Show the generated Employee entity in Entity Designer and change the rule for naming an instance of the **InstanceName** to **firstname with lastname**;
5. (Optional) Show the list view in preview mode, tell about the structure of the UI components in the descriptor screen and Jmix UI component hierarchy tree
6. Launch the project – **show the logging screen, the list of entities and details screen**. Note that the department selection in the employee details screen has already been implemented through the EntityPicker component – Jmix automatically arranged the components according to the data type of entity attributes
7. Perform a rearrangement of the List View columns in design time for **Employee** entity and demonstrate **Hot Deploy**
8. Show all the possibilities of **filtering and sorting columns** in runtime using the example of the generated project and in [UI Samples](https://demo.jmix.io/ui-samples/sample/data-grid-multi-sort)
9. Show the list of Users and say that **we will now differentiate access to departments and employees based on the department attribute of the user**
10. **Add new attribute and show it in UI**. Add a new **manager** attribute of type User to the department entity. Show three ways of adding a new attribute to Jmix UI:
    1. Add an attribute through the **hierarchy of components** in the component tree;
    2. Add an attribute via the **view XML descriptor**. Show how Actions are added to EntityPicker as an example;
    3. Add an attribute via **auto-addition from Entity Designer**.
11. Show options for **DDL generation options**. Note migration scripts autogeneration option is disabled by default for entities that were migrated from the database
12. **Configure security.** Show the **subsystem for configuring access rights** in design time and in runtime. In runtime create a new **manager role** and set up access rights only for Employee entity screens and all associated attributes for reading
13. Assign the manager role to the **new user – John.Doe**
14. **Log in under John.Doe** show that the menu and the availability of Actions for the new user with the manager role were implemented automatically
15. Go back to **admin** and configure a new Row Level Security **filter-employee-by-user-department** and configure the following:
    1. Entity: Employee
    2. Type: JPQL
    3. Where clause: **{E}.department.id=:current_user_departmentId**
16. Add new permissions to the existing **manager** role -> add Department entity and associated views
17. Set the department attribute value for John.Doe user and assign him the new row-level-role **filter-employee-by-user-department**
18. Log in again under John.Doe and demonstrate that employees are dynamically filtered by the John.Doe department
19. **Create a new service in design time.** Open the **department list screen** and create a new button – **Count FTE**. Click on the button to make a handler and go to the controller. In the controller, describe the notifications – **Button was pressed!** call. Go to runtime and show that the message is being displayed
20. **Create a new SpringBean** – EmployeeService in Design time. In the created bean, make the **calculateEmployeeByDepartment(Department department)** method, returns int. In the method, using the code completion and JPQL constructor, write the following code:

```java
public Integer calculateEmployeeByDepartment(Department department) {
    if (department == null) {
        return 0;
    } else {
        final List<Employee> myEntityList = dataManager.load(Employee.class)
                .query("select e from Employee e where e.department = :department1")
                .parameter("department1", department)
                .list();
        return myEntityList.size();
    }
}
```

21. Call the new bean method in the view controller by passing to it the parameter selected in the DataGrid -> department. Output the result in notification message;
22. (Optional) **Install the Generic REST API in the project**
23. Show the [documentation section](https://docs.jmix.io/jmix/rest/getting-started.html#obtaining-access-token) with configs for Spring Security. Copy it to the project configuration file
24. Configure a new user-management and employee-management role with API access scope;
25. Open Postman – get a token, show the API call by endpoint:
   a. http://localhost:8080/rest/entities/User  
   b. http://localhost:8080/rest/entities/Employee  
   c. http://localhost:8080/rest/entities/Employee /{employee_id}

## The End ##