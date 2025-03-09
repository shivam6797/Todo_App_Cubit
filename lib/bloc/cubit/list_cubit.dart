import 'package:bloc_state_app/bloc/state/list_state.dart';
import 'package:bloc_state_app/db/db_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/todo_model.dart';

class ListCubit extends Cubit<ListLoadedState> {
  DbHelper dbHelper;
  List<TodoModel> _allTodos = [];
  String _selectedStatus = "All";
  ListCubit({required this.dbHelper}) : super(ListLoadedState(mData: []));

  // Fetch Data from Database
  Future<void> fetchData() async {
    _allTodos = await dbHelper.fetchAllTodos();
    print(
        "All todos fetched: ${_allTodos.map((todo) => todo.toMap()).toList()}");
    emit(ListLoadedState(mData: List.from(_allTodos)));
  }

  // Add New Todo
  Future<void> addData(TodoModel todo) async {
    bool isAdded = await dbHelper.addTodo(todo: todo);
    if (isAdded) {
      fetchData();
    }
  }

  // Update Existing Todo
  Future<void> updateData(TodoModel todo) async {
    bool isUpdated = await dbHelper.updateTodo(todo);
    if (isUpdated) {
      fetchData();
    }
  }

  // Delete Todo
  Future<void> deleteData(int id) async {
    bool isDeleted = await dbHelper.deleteTodo(id);
    if (isDeleted) {
      fetchData();
    }
  }

  //  Filter by Status (All, Completed, Pending)
  void filterByStatus(String status) {
    _selectedStatus = status; // Update current filter
    applyFilters(); // Apply updated filter
  }

  // Filter by Priority
  void filterData(int? priority) {
    emit(ListLoadedState(mData: _allTodos
        .where((todo) => priority == -1 || todo.priority == priority)
        .toList()));
  }

    // Filter Todos by Category
  void filterCategory(String category) {
    List<TodoModel> filteredList =
        _allTodos.where((todo) => todo.category == category).toList();
    emit(ListLoadedState(mData: filteredList));
  }

  // Reset All Filters
  void resetFilters() {
    emit(ListLoadedState(mData: List.from(_allTodos)));
  }

    //  Apply Filters (Status + Priority)
  void applyFilters() {
    List<TodoModel> filteredList = List.from(_allTodos);
    
    // Status Filter Apply
    if (_selectedStatus == "Completed") {
      filteredList = filteredList.where((todo) => todo.isCompleted == true).toList();
    } else if (_selectedStatus == "Pending") {
      filteredList = filteredList.where((todo) => todo.isCompleted == false).toList();
    }
    emit(ListLoadedState(mData: filteredList));
  }
}
