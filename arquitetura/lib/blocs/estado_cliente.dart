import 'package:arquitetura/model/cliente.model.dart';

abstract class EstadoCliente {
  final List<Client> clients;

  EstadoCliente({
    required this.clients
  });
}

class ClienteInicalState extends EstadoCliente {
  ClienteInicalState() : super(clients: []);
}

class ClienteSucessoState extends EstadoCliente {
  ClienteSucessoState({required List<Client> clients}): super(clients: clients);
}