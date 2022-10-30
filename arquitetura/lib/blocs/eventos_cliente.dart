import 'package:arquitetura/model/cliente.model.dart';

abstract class EventosCliente {}

class EventoClienteCarregando extends EventosCliente{}

class EventoClienteAdd extends EventosCliente{
  final Client client;

  EventoClienteAdd({
    required this.client,
  });
}

class EventoClienteRemove extends EventosCliente{
  final Client client;

  EventoClienteRemove({
    required this.client,
  });
}


