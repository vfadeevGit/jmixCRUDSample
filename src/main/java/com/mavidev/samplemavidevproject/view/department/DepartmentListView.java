package com.mavidev.samplemavidevproject.view.department;

import com.mavidev.samplemavidevproject.app.EmployeeService;
import com.mavidev.samplemavidevproject.entity.Department;
import com.mavidev.samplemavidevproject.view.main.MainView;
import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.Notifications;
import io.jmix.flowui.component.grid.DataGrid;
import io.jmix.flowui.kit.component.button.JmixButton;
import io.jmix.flowui.view.*;
import org.springframework.beans.factory.annotation.Autowired;


@Route(value = "departments", layout = MainView.class)
@ViewController(id = "Department.list")
@ViewDescriptor(path = "department-list-view.xml")
@LookupComponent("departmentsDataGrid")
@DialogMode(width = "64em")
public class DepartmentListView extends StandardListView<Department> {
    @Autowired
    private Notifications notifications;
    @Autowired
    private EmployeeService employeeService;
    @ViewComponent
    private DataGrid<Department> departmentsDataGrid;

    @Subscribe(id = "countBtn", subject = "clickListener")
    public void onCountBtnClick(final ClickEvent<JmixButton> event) {
        notifications.show("This department includes " +employeeService.calculateEmployeeByDepratment(departmentsDataGrid.getSingleSelectedItem()).toString() + " employees!");
    }
}