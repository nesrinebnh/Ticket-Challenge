import 'package:flutter/material.dart';
import 'package:ticketapp/views/edit_ticket.dart';
import '../constants.dart' as Constants;

class TicketCard extends StatefulWidget {
  final String title;
  final String description;
  final String status;
  final String openDate;
  final String closeDate;
  final String id;
  TicketCard(
      {required this.title,
      required this.description,
      required this.status,
      required this.openDate,
      required this.closeDate,
      required this.id});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    var color = Constants.NEWCOLOR;
    if (widget.status == 'In Progress') {
      color = Constants.INPROGRESSCOLOR;
    } else if (widget.status == 'Resolved') {
      color = Constants.RESOLVEDCOLOR;
    } else if (widget.status == 'Closed') {
      color = Constants.CLOSEDCOLOR;
    }
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  )),
              const SizedBox(height: 10),
              Text(widget.description.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  )),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.openDate.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(widget.status.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTicket(
                                    id: widget.id,
                                    title: widget.title,
                                    description: widget.description,
                                    status: widget.status,
                                    openDate: widget.openDate,
                                  )));
                    },
                    child: Icon(Icons.edit, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
