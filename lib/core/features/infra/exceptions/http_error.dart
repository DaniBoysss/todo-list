
class HttpErrors {
  static dynamic handleError(String messageError) {
    switch (messageError) {
      case 'SUCCESS':
        return 'Cadastro criado com sucesso!';
      case 'EMAIL ALREADY REGISTERED':
        return 'Email já registrado no banco de dados.';
      case 'INVALID CREDENTIALS':
        return 'Email e/ou senha inválidos.';
      case 'TASK CREATED SUCCESS':
        return 'Tarefa criada com sucesso!';
      case 'TASK UPDATED SUCCESS':
        return 'Tarefa atualizada com sucesso!';
      case 'TASK DELETED SUCCESS':
        return 'Tarefa deletada com sucesso!';
    }
  }
}