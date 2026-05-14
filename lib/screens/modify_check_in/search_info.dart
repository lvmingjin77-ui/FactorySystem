import 'package:admin/constants.dart';
import 'package:admin/screens/modify_check_in/employee.dart';
import 'package:admin/screens/modify_check_in/employeesInfo.dart';
import 'package:flutter/material.dart';

class SearchAndModify extends StatefulWidget {
  const SearchAndModify({Key? key}) : super(key: key);

  @override
  State<SearchAndModify> createState() => _SearchAndModifyState();
}

class _SearchAndModifyState extends State<SearchAndModify> {
  TextEditingController _searchController = TextEditingController();
  Employee? _foundEmployee;


  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min, // 设置为MainAxisSize.min
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '请输入员工ID......',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _foundEmployee = null;
                    });
                  },
                ),
              ),
              onSubmitted: (value) {
                int id = int.tryParse(value) ?? 0;
                Employee foundEmployee = employees.firstWhere(
                  (employee) => employee.id == id,
                  orElse: () => notFoundEmployee,
                );
                setState(() {
                  _foundEmployee =
                      foundEmployee != notFoundEmployee ? foundEmployee : null;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        ),
        if (_foundEmployee != null && _foundEmployee != notFoundEmployee)
        Container(
          margin: EdgeInsets.all(defaultPadding),
          child:EmployeeCard(employee: _foundEmployee!) ,
        )
          
        else if (_searchController.text.isNotEmpty)
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('没有找到相应员工ID的员工信息: ${_searchController.text}'),
            ),
          )
        else
          Expanded(
            child: Container(
              // 显示所有员工信息
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (BuildContext context, int index) {
                  return EmployeeCard(employee: employees[index]);
                },
              ),
            ),
          )
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
