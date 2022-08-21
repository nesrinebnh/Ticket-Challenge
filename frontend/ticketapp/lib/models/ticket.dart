class Ticket {
  var id;
  var title;
  var description;
  var open_date;
  var close_date;
  var status;

  Ticket(
      {this.id,
      this.title,
      this.description,
      this.open_date,
      this.close_date,
      this.status});

  factory Ticket.fromJson(dynamic json) {
    return Ticket(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      open_date: DateTime.parse(json['open_date']),
      close_date: DateTime.parse(json['open_date']),
      status: json['status'],
    );
  }

  static List<Ticket> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Ticket.fromJson(data);
    }).toList();
  }
}
