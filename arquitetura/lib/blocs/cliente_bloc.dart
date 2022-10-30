import 'dart:async';

import 'package:arquitetura/blocs/eventos_cliente.dart';
import 'package:arquitetura/blocs/estado_cliente.dart';
import 'package:arquitetura/model/cliente.model.dart';
import 'package:arquitetura/repository/cliente.repository.dart';

class ClienteBloc {
  final ClientsRepository _repository = ClientsRepository();

  final StreamController<EventosCliente> _inputClientController = StreamController<EventosCliente>();
  final StreamController<EstadoCliente> _outputClientController = StreamController<EstadoCliente>();

  // Oque é o Sink? https://api.flutter.dev/flutter/dart-core/Sink-class.html
  Sink<EventosCliente> get inputCliente => _inputClientController.sink;

  // Oque é o Stream? https://dart.dev/tutorials/language/streams
  Stream<EstadoCliente> get stream => _outputClientController.stream;

  ClienteBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(EventosCliente event) {
    List<Client> clinte = [];

    if(event is EventoClienteCarregando) {
      clinte = _repository.loadClients();
    } else if(event is EventoClienteRemove) {
      clinte = _repository.removeClient(event.client);
    } else if(event is EventoClienteAdd) {
      clinte = _repository.addClient(event.client);
    }
    _outputClientController.add(ClienteSucessoState(clients: clinte));
  }

}