package com.mavidev.samplemavidevproject.view.department;

import com.mavidev.samplemavidevproject.entity.Department;
import com.mavidev.samplemavidevproject.view.main.MainView;
import com.vaadin.flow.router.Route;
import io.jmix.flowui.view.EditedEntityContainer;
import io.jmix.flowui.view.StandardDetailView;
import io.jmix.flowui.view.ViewController;
import io.jmix.flowui.view.ViewDescriptor;

@Route(value = "departments/:id", layout = MainView.class)
@ViewController(id = "Department.detail")
@ViewDescriptor(path = "department-detail-view.xml")
@EditedEntityContainer("departmentDc")
public class DepartmentDetailView extends StandardDetailView<Department> {
}