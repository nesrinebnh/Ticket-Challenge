import 'package:flutter/material.dart';
import 'package:ticketapp/models/TicketApi.dart';
import 'package:ticketapp/home.dart';
import '../constants.dart' as Constants;
import '../models/ticket.dart';

class EditTicket extends StatefulWidget {
  String id;
  String title;
  String description;
  String status;
  String openDate;
  EditTicket(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.openDate})
      : super(key: key);

  @override
  State<EditTicket> createState() => _EditTicketState();
}

class _EditTicketState extends State<EditTicket> {
  var _title;
  var _description;
  String? _status;
  var _tickets = [];

  @override
  void initState() {
    super.initState();
    print('init');
    _status = widget.status;
    _title = widget.title;
    _description = widget.description;
  }

  Future<void> EditTicket(String title, String desc, String status) async {
    print('title ${_title}');
    print('desc ${_description}');
    print('status ${_status}');
    DateTime now = new DateTime.now();
    var editCloseDate = false;
    try {
      if (status == 'Closed') {
        editCloseDate = true;
      }
      print('id ${widget.id.toString()}');
      _tickets = await TicketApi.EditTicket(widget.id.toString(),
          title.toString(), desc.toString(), status.toString(), editCloseDate);
      print('edit okay');
      setState(() {});
    } catch (e) {
      _tickets = [];
      print('edit failed');
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
              'Edit Ticket',
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
                      controller: TextEditingController(text: widget.title),
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
                      controller:
                          TextEditingController(text: widget.description),
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
                        EditTicket(_title, _description, _status!),
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      },
                      child: const Text(
                        "UPDATE",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )),
          ],
        ))));
  }
}
