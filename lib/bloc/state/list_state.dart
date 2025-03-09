import 'package:bloc_state_app/model/todo_model.dart';
import 'package:equatable/equatable.dart';

class ListLoadedState extends Equatable{
 final List<TodoModel> mData;
  const ListLoadedState({required this.mData});

@override
  List<Object?> get props => [mData];
}