package com.mavidev.samplemavidevproject.view.employee;

import com.mavidev.samplemavidevproject.entity.Employee;
import com.mavidev.samplemavidevproject.entity.User;
import com.mavidev.samplemavidevproject.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.core.security.CurrentAuthentication;
import io.jmix.flowui.view.*;
import org.springframework.beans.factory.annotation.Autowired;


@Route(value = "employees", layout = MainView.class)
@ViewController(id = "Employee.list")
@ViewDescriptor(path = "employee-list-view.xml")
@LookupComponent("employeesDataGrid")
@DialogMode(width = "64em")
public class EmployeeListView extends StandardListView<Employee> {

}