import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart' as Constants;

import 'ticket.dart';

class TicketApi {
  static Future<List<Ticket>> getTickets() async {
    print('server url ${Constants.SERVER}');
    var uri = Uri.parse('${Constants.SERVER}/tickets/');
    final response = await http.get(uri);
    return Ticket.recipesFromSnapshot(jsonDecode(response.body));
  }

  static Future<List<Ticket>> CreateTicket(
      String title, String desc, String status) async {
    var map = <String, dynamic>{};
    print('API status $status');
    map['title'] = title;
    map['description'] = desc;
    map['status'] = status;
    var response = await http.post(
      Uri.parse('${Constants.SERVER}/tickets/create/'),
      body: map,
    );
    return Ticket.recipesFromSnapshot(jsonDecode(response.body));
  }

  static Future<List<Ticket>> EditTicket(String id, String title, String desc,
      String status, bool editCloseDate) async {
    DateTime now = new DateTime.now();
    var map = <String, dynamic>{};
    print('$id $title $desc $status');
    map['title'] = title;
    map['description'] = desc;
    map['status'] = status;

    var response = await http
        .put(Uri.parse('${Constants.SERVER}/tickets/$id/update/'), body: map);
    return Ticket.recipesFromSnapshot(jsonDecode(response.body));
  }
}
