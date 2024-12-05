package com.mavidev.samplemavidevproject.app;

import com.mavidev.samplemavidevproject.entity.Department;
import com.mavidev.samplemavidevproject.entity.Employee;
import com.mavidev.samplemavidevproject.entity.User;
import io.jmix.core.DataManager;
import io.jmix.core.security.CurrentAuthentication;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    private final DataManager dataManager;
    private final CurrentAuthentication currentAuthentication;

    public EmployeeService(DataManager dataManager, CurrentAuthentication currentAuthentication) {
        this.dataManager = dataManager;
        this.currentAuthentication = currentAuthentication;
    }

    public Integer calculateEmployeeByDepratment(Department department) {
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

}