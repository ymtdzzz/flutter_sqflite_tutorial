import 'dart:async';
import 'package:flutter_todoapp/Database.dart';

import 'ClientModel.dart';

class ClientsBloc {
  ClientsBloc() {
    getClients();
  }
  final _clientController = StreamController<List<Client>>.broadcast();
  get clients => _clientController.stream;

  dispose() {
    _clientController.close();
  }

  getClients() async {
    _clientController.sink.add(await DBProvider.db.getAllClients());
  }

  blockUnblock(Client client) {
    DBProvider.db.blockOrUnblock(client);
    getClients();
  }

  delete(int id) {
    DBProvider.db.deleteClient(id);
    getClients();
  }

  add(Client client) {
    DBProvider.db.newClient(client);
    getClients();
  }
}