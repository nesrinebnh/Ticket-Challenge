import 'package:flutter/material.dart';
import 'package:ticketapp/views/create_ticket.dart';
import 'package:ticketapp/views/ticket_card.dart';
import 'constants.dart' as Constants;
import 'models/ticket.dart';
import 'models/TicketApi.dart';
import 'views/ticket_card.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ticket> _tickets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    print('init');
    getTickets();
  }

  Future<void> getTickets() async {
    _tickets = await TicketApi.getTickets();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.APPNAME),
        backgroundColor: const Color(Constants.APPCOLOR),
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: _tickets.length,
                      itemBuilder: (context, index) {
                        DateFormat dateFormat =
                            DateFormat("yyyy-MM-dd HH:mm:ss");
                        var close = '';
                        if (_tickets[index].close_date == null) {
                          close = '';
                        } else {
                          close = dateFormat.format(_tickets[index].close_date);
                        }

                        var open = dateFormat.format(_tickets[index].open_date);
                        return TicketCard(
                          title: _tickets[index].title,
                          description: _tickets[index].description,
                          status: _tickets[index].status,
                          openDate: open,
                          closeDate: close,
                          id: _tickets[index].id.toString(),
                        );
                      }),
                ),
              ],
            ),
      bottomNavigationBar: SizedBox(height: 35),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateTicket()))
        },
        child: Icon(Icons.add, size: 25),
        backgroundColor: const Color(Constants.APPCOLOR),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
