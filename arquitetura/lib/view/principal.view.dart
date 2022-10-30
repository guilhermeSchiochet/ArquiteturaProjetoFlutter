import 'package:arquitetura/blocs/cliente_bloc.dart';
import 'package:arquitetura/blocs/estado_cliente.dart';
import 'package:arquitetura/blocs/eventos_cliente.dart';
import 'package:flutter/material.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({Key? key}) : super(key: key);

  @override
  State<PrincipalView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PrincipalView> {

  late final ClienteBloc bloc = ClienteBloc();

  @override
  void initState() {
    super.initState();
    bloc.inputCliente.add(EventoClienteCarregando());
  }

  @override
  void dispose() {
    bloc.inputCliente.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 42, 243, 193),        
        title: const Text('Arquitetura'),
      ),
      body: _conteudo()
    );
  }

  Widget? _conteudo() {
    return StreamBuilder<EstadoCliente>(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final clintsList = snapshot.data?.clients ?? [];
        return ListView.separated(
          itemCount: clintsList.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Text(clintsList[index].nome.substring(0, 1)) ,
              ),
            ),
            title: Text(clintsList[index].nome),
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                  bloc.inputCliente.add(EventoClienteRemove(client: clintsList[index]));
              },
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
        );
      }
    );
  }

}