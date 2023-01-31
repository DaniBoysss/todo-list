const String baseUrl = 'https://flutterapidaniboys-production.up.railway.app';

class UserEndpoints {
  static const getAllTasks = baseUrl + '/tasks/getAllTasks';
  static const addTask = baseUrl + '/tasks/addTask';
  static const updateTask = baseUrl + '/tasks/updateTask';
  static const deleteTask = baseUrl + '/tasks/deleteTask';
}