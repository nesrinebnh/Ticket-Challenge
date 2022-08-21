import 'package:flutter/material.dart';
import 'package:ticketapp/models/TicketApi.dart';
import 'package:ticketapp/home.dart';
import '../constants.dart' as Constants;
import '../models/ticket.dart';

class CreateTicket extends StatefulWidget {
  CreateTicket({Key? key}) : super(key: key);

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  var _title = "";
  var _description = "";
  String? _status = "New";
  var _tickets = [];

  Future<void> createTicket(String title, String desc, String status) async {
    print('title ${_title}');
    print('desc ${_description}');
    print('status ${_status}');
    try {
      _tickets = await TicketApi.CreateTicket(
          title.toString(), desc.toString(), status.toString());
      setState(() {});
    } catch (e) {
      _tickets = [];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.APPNAME),
          backgroundColor: const Color(Constants.APPCOLOR),
        ),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Create Ticket',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextField(
                      onChanged: (value) => _title = value,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.title,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 35),
                    TextField(
                      onChanged: (value) => _description = value,
                      maxLines: 3,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.description,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Text("status",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            )),
                        SizedBox(width: 20),
                        DropdownButton<String>(
                          value: _status,
                          items: <String>[
                            'New',
                            'In Progress',
                            'Resolved',
                            'Closed'
                          ].map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (item) => setState(() => _status = item),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(150, 10),
                        backgroundColor: const Color(Constants.APPCOLOR),
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () => {
                        createTicket(_title, _description, _status!),
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      },
                      child: const Text(
                        "CREATE",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )),
          ],
        ))));
  }
}
